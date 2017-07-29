let getBanco = () => {
    console.log(`[MYSQL] Conectado a ${process.env.NODE_ENV || 'DESENVOLVIMENTO'}`);
    if (process.env.NODE_ENV == "development") {
        return {
            host: 'localhost',
            user: 'root',
            database: 'groovy',
            password: '',
            port: 3306
        }
    }
    return {
        host: process.env.dbhost,
        user: process.env.dbuser,
        database: process.env.dbdatabase,
        password: process.env.dbpassword,
        port: +process.env.dbport
    }
}

module.exports = {
    apis: {
        timeOut: 3500
    },
    slack: {
        urlHook: process.env.urlHook,
        channel: process.env.channel,
        iconUrl: process.env.iconUrl,
        botusername: process.env.botusername
    },
    myApi: {
        name: 'Groovy API',
        url: 'http://localhost',
        port: process.env.PORT || 4700,
    },
    database: {
        MYSQL: getBanco()
    }
};

