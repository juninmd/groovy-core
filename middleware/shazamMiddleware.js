const webconfig = require('../bin/webconfig')
const package = require('../package')

const shazam = require('shazam-middleware')({
    api: {
        name: webconfig.myApi.name,
        version: package.version
    }
});

module.exports = (app) => {
    app.use(shazam.log);
    app.use(shazam.exception);
};