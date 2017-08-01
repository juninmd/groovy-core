const webconfig = require('../webconfig');
const mysql = require('jano-mysql')(webconfig.database.MYSQL);

module.exports = {
    getAll: () => {
        return mysql.executeString(`SELECT * from gro_t_feedback`);
    },
    insert: (body) => {
        return mysql.executeObject(`INSERT INTO gro_t_feedback SET ?`,
            {
                P1: body.P1,
                P2: body.P2,
                P3: body.P3,
                P4: body.P4,
                P5: body.P5,
            });
    },
    insertTransaction: (connection, body) => {
        return mysql.executeTransaction(connection, `INSERT INTO gro_t_feedback SET ?`,
            {
                P1: body.P1,
                P2: body.P2,
                P3: body.P3,
                P4: body.P4,
                P5: body.P5,
            });
    }
};
