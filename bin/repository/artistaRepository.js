const webconfig = require('../webconfig');
const mysql = require('jano-mysql')(webconfig.database.MYSQL);

module.exports = {
        getById: (id, senha) => {
                return mysql.executeString(`SELECT * FROM gro_t_artista WHERE IDARTISTA = ${id} AND SENHA ${senha}`);
        },
        getAll: () => {
                return mysql.executeString(`SELECT * FROM gro_t_artista`);
        },
        insert: (body) => {
                return mysql.executeObject(`INSERT INTO gro_t_artista SET ?`, { EMAIL: body.EMAIL, NOME: body.NOME, SENHA: body.SENHA });
        },
        insertTransaction: (connection, body) => {
                return mysql.executeTransaction(connection, `INSERT INTO gro_t_artista SET ?`, { EMAIL: body.EMAIL, NOME: body.NOME, SENHA: body.SENHA });
        },
        update: (body) => {
                return mysql.executeObject(`UPDATE gro_t_artista SET ? WHERE IDARTISTA = ${body.IDARTISTA}`, { IDARTISTA: body.IDARTISTA, EMAIL: body.EMAIL, NOME: body.NOME, SENHA: body.SENHA });
        },
        delete: (id) => {
                return mysql.executeString(`DELETE FROM gro_t_artista WHERE IDARTISTA = ${id}`);
        },
};