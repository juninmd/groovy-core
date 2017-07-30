const feedbackRepository = require('../repository/feedbackRepository.js');

module.exports = (app) => {
    app.get("/feedback", (req, res, next) => {
        feedbackRepository.getAll()
            .then(q => res.status(200).send(q))
            .catch(err => next(err))
    })
    app.post("/feedback", (req, res, next) => {
        feedbackRepository.insert(req.body)
            .then(q => res.status(200).send(q))
            .catch(err => next(err))
    })
}