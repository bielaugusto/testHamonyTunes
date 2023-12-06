const express = require('express');
const mysql = require('mysql');

const bodyParser = require('body-parser'); // Pacote para facilitar o manuseio de dados JSON no corpo das requisições

const app = express();

const db = mysql.createConnection({
  'host': 'localhost',
  'user': 'root',
  'password': 'admin',
  'database': 'harmonytunes',
});

db.connect((err) => {
  if (err) {
    console.error('Erro ao conectar ao banco de dados:', err);
  } else {
    console.log('Conexão bem-sucedida ao banco de dados!');
  }
});

//app.use(bodyParser.json()); // Middleware para analisar dados JSON no corpo das requisições


//
// Rota para listar todos os clientes
app.get('/clientes', (req, res) => {
    db.query('SELECT * FROM Cliente', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar clientes.' });
      } else {
        res.json(results);
      }
    });
  });
// Rota para obter informações de um cliente específico
app.get('/clientes/:id', (req, res) => {
  const clienteId = req.params.id;
  db.query('SELECT * FROM Cliente WHERE ID_CLIENTE = ?', [clienteId], (err, results) => {
    if (err) throw err;
    if (results.length > 0) {
      res.json(results[0]);
    } else {
      res.status(404).json({ error: 'Cliente não encontrado.' });
    }
  });
});

// Rota para buscar todos os endereços dos clientes
app.get('/enderecos', (req, res) => {
    db.query('SELECT * FROM EnderecoCliente', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar endereços.' });
      } else {
        res.json(results);
      }
    });
  });
  
  // Rota para buscar todos os pedidos
  app.get('/pedidos', (req, res) => {
    db.query('SELECT * FROM Pedido', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar pedidos.' });
      } else {
        res.json(results);
      }
    });
  });
  
  // Você pode adicionar rotas para outras tabelas da mesma maneira
  

/*app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});*/

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor iniciado na porta ${PORT}`);
});
