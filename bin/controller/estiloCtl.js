const estiloRepository = require('../repository/estiloRepository.js');

module.exports = (app) => {
    app.get("/estilo", (req, res, next) => {
        estiloRepository.getAll()
            .then(q => res.status(200).send(q))
            .catch(err => next(err))
    })
}