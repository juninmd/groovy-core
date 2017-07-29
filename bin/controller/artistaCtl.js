const artistaSrv = require('../service/artistaSrv.js');

module.exports = (app) => {
    app.post("/artista", (req, res, next) => {
        artistaSrv.insert(req.body)
            .then(q => res.status(200).send(q))
            .catch(err => next(err))
    })

    app.get("/artista", (req, res, next) => {
        artistaSrv.getById(req.query)
            .then(q => res.status(200).send(q))
            .catch(err => next(err))
    })
}