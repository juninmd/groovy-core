const webconfig = require('../webconfig');
const artistaRepository = require('../repository/artistaRepository');
const artistaEstiloRepository = require('../repository/artistaEstiloRepository');
const artistaInstrumentoRepository = require('../repository/artistaInstrumentoRepository');
const mysql = require('jano-mysql')(webconfig.database.MYSQL);

module.exports = {
    getById: (query) => {
        return new Promise((resolve, reject) => {
            artistaRepository.getById(query.email, query.senha)
                .then(q => {
                    if (q.content.length == 0) {
                        return reject({
                            message: {
                                userMessage: "Por favor, confira e-mail/senha",
                                developerMessage: ""
                            },
                            statusCode: 404
                        });
                    }
                    q.content = q.content[0];
                    return resolve(q);
                })
                .catch(err => {
                    return reject(err);
                });
        });
    },
    insert: (body) => {
        return new Promise((resolve, reject) => {
            let connection = {};
            mysql.beginTransaction()
                .then(q => {
                    connection = q;
                    return artistaRepository.insertTransaction(connection, body);
                })
                .then(q => {
                    let promises = [];

                    body.estilos.map(e => {
                        promises.push(artistaEstiloRepository.insertTransaction(connection,
                            {
                                IDARTISTA: q.content,
                                IDESTILO: e
                            }));
                    });

                    body.instrumentos.map(e => {
                        promises.push(artistaInstrumentoRepository.insertTransaction(connection,
                            {
                                IDARTISTA: q.content,
                                IDINSTRUMENTO: e
                            }));
                    });

                    return Promise.all(promises);
                })
                .then(q => {
                    return connection.endConnection(true);
                })
                .then(q => {
                    return resolve(q);
                })
                .catch(err => {
                    connection.endConnection(false)
                        .then(q => reject(err));
                });
        });
    }
};