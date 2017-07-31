const webconfig = require('../webconfig');
const artistaRepository = require('../repository/artistaRepository');
const artistaEstiloRepository = require('../repository/artistaEstiloRepository');
const artistaInstrumentoRepository = require('../repository/artistaInstrumentoRepository');
const mysql = require('jano-mysql')(webconfig.database.MYSQL);

module.exports = {
    getById: (query) => {
        return new Promise((resolve, reject) => {
            artistaRepository.getById(query.EMAIL, query.SENHA)
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
            artistaRepository.getByEmail(body.email)
                .then(q => {
                    if (q.content.length == 0) {
                        return mysql.beginTransaction();
                    }
                    return Promise.reject({
                        message: {
                            userMessage: "Esse usuário já se encontra registrado.",
                            developerMessage: "Duplicidade de e-mail"
                        },
                        statusCode: 400
                    });
                })
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
                    if (connection.endConnection)
                        return connection.endConnection(false)
                            .then(q => reject(err));

                    return reject(err);
                });
        });
    }
};