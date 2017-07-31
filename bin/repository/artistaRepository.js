const webconfig = require('../webconfig');
const mysql = require('jano-mysql')(webconfig.database.MYSQL);

module.exports = {
        getById: (email, senha) => {
                return mysql.executeString(`SELECT IDARTISTA, EMAIL, NOME FROM gro_t_artista WHERE EMAIL = '${email}' AND SENHA ${senha}`);
        },
        getByEmail: (email) => {
                return mysql.executeString(`SELECT IDARTISTA, EMAIL, NOME FROM gro_t_artista WHERE EMAIL = '${email}'`);
        },
        getAll: () => {
                return mysql.executeString(`SELECT IDARTISTA, EMAIL, NOME FROM gro_t_artista`);
        },
        insertTransaction: (connection, body) => {
                return mysql.executeTransaction(connection, `INSERT INTO gro_t_artista SET ?`, { EMAIL: body.email, NOME: body.nome });
        },
};
