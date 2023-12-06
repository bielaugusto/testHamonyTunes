const app = require('./app');
require('dotnev').config();

app.listen(process.env.PORT, () => {
    console.log("escutando na porta ${process.env.PORT}");
});