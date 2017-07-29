const webconfig = require('../webconfig');
const mysql = require('jano-mysql')(webconfig.database.MYSQL);

module.exports = {
        getById: (id) => {
                return mysql.executeString(`SELECT * FROM gro_t_artista_instrumento WHERE IDARTISTA = ${id}`);
        },
        getAll: () => {
                return mysql.executeString(`SELECT * FROM gro_t_artista_instrumento`);
        },
        insert: (body) => {
                return mysql.executeObject(`INSERT INTO gro_t_artista_instrumento SET ?`, { IDARTISTA: body.IDARTISTA, IDINSTRUMENTO: body.IDINSTRUMENTO });
        },
        insertTransaction: (connection, body) => {
                return mysql.executeTransaction(connection, `INSERT INTO gro_t_artista_instrumento SET ?`, { IDARTISTA: body.IDARTISTA, IDINSTRUMENTO: body.IDINSTRUMENTO });
        },
        update: (body) => {
                return mysql.executeObject(`UPDATE gro_t_artista_instrumento SET ? WHERE IDARTISTA = ${body.IDARTISTA}`, { IDARTISTA: body.IDARTISTA, IDINSTRUMENTO: body.IDINSTRUMENTO });
        },
        delete: (id) => {
                return mysql.executeString(`DELETE FROM gro_t_artista_instrumento WHERE IDARTISTA = ${id}`);
        },
};
