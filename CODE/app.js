const express = require('express');
const managersController = require('./controllers/managerCOnstroller');
const bodyParser = require('body-parser');
app.use(bodyParser.json());

app.use(express.json());
app.get('/managers', managersController.getAll);
app.post('managers', managersController.createManager);

module.exports = app;