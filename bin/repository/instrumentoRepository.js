const webconfig = require('../webconfig');
const mysql = require('jano-mysql')(webconfig.database.MYSQL);

module.exports = {
        getById: (id) => {
                return mysql.executeString(`SELECT * FROM gro_t_instrumento WHERE IDINSTRUMENTO = ${id}`);
        },
        getAll: () => {
                return mysql.executeString(`SELECT * FROM gro_t_instrumento`);
        },
        insert: (body) => {
                return mysql.executeObject(`INSERT INTO gro_t_instrumento SET ?`, { DESCRICAO: body.DESCRICAO });
        },
        update: (body) => {
                return mysql.executeObject(`UPDATE gro_t_instrumento SET ? WHERE IDINSTRUMENTO = ${body.IDINSTRUMENTO}`, { IDINSTRUMENTO: body.IDINSTRUMENTO, DESCRICAO: body.DESCRICAO });
        },
        delete: (id) => {
                return mysql.executeString(`DELETE FROM gro_t_instrumento WHERE IDINSTRUMENTO = ${id}`);
        },
};
