const webconfig = require('../webconfig');
const mysql = require('jano-mysql')(webconfig.database.MYSQL);

module.exports = {
        getById: (id) => {
                return mysql.executeString(`SELECT * FROM gro_t_artista_estilo WHERE IDARTISTA = ${id}`);
        },
        getAll: () => {
                return mysql.executeString(`SELECT * FROM gro_t_artista_estilo`);
        },
        insert: (body) => {
                return mysql.executeObject(`INSERT INTO gro_t_artista_estilo SET ?`, { IDARTISTA: body.IDARTISTA, IDESTILO: body.IDESTILO });
        },
        insertTransaction: (connection, body) => {
                return mysql.executeTransaction(connection, `INSERT INTO gro_t_artista_estilo SET ?`, { IDARTISTA: body.IDARTISTA, IDESTILO: body.IDESTILO });
        },
        update: (body) => {
                return mysql.executeObject(`UPDATE gro_t_artista_estilo SET ? WHERE IDARTISTA = ${body.IDARTISTA}`, { IDARTISTA: body.IDARTISTA, IDESTILO: body.IDESTILO });
        },
        delete: (id) => {
                return mysql.executeString(`DELETE FROM gro_t_artista_estilo WHERE IDARTISTA = ${id}`);
        },
};
