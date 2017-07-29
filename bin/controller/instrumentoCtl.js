const instrumentoRepository = require('../repository/instrumentoRepository.js');

module.exports = (app) => {
    app.get("/instrumento", (req, res, next) => {
        instrumentoRepository.getAll()
            .then(q => res.status(200).send(q))
            .catch(err => next(err))
    })
}