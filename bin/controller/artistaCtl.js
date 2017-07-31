const artistaSrv = require('../service/artistaSrv.js');

module.exports = (app) => {
    app.post("/artista", (req, res, next) => {
        if (typeof req.body.estilos == "string") {
            req.body.estilos = [req.body.estilos];
        }

        if (typeof req.body.instrumentos == "string") {
            req.body.instrumentos = [req.body.instrumentos];
        }

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