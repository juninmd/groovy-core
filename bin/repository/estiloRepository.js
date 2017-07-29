const webconfig = require('../webconfig');
const mysql = require('jano-mysql')(webconfig.database.MYSQL);

module.exports = {
        getById: (id) => {
                return mysql.executeString(`SELECT * FROM gro_t_estilo WHERE IDESTILO = ${id}`);
        },
        getAll: () => {
                return mysql.executeString(`SELECT * FROM gro_t_estilo`);
        },
        insert: (body) => { 
                return mysql.executeObject(`INSERT INTO gro_t_estilo SET ?`, { DESCRICAO: body.DESCRICAO });
        },
        update: (body) => { 
                return mysql.executeObject(`UPDATE gro_t_estilo SET ? WHERE IDESTILO = ${body.IDESTILO}`, { IDESTILO: body.IDESTILO, DESCRICAO: body.DESCRICAO });
        },
        delete: (id) => { 
                return mysql.executeString(`DELETE FROM gro_t_estilo WHERE IDESTILO = ${id}`);
        },
};
