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

app.use(bodyParser.json()); // Middleware para analisar dados JSON no corpo das requisições

// Rotas
// CRUD
// Cliente

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

// Rota para lidar com solicitações POST para /clientes
app.post('/clientes', (req, res) => {
    const { USUARIO_CLIENTE, email, senha, nome, dataNasc, idade, telefone, endereco } = req.body;

    // Executa a inserção no banco de dados
    const query = `INSERT INTO Cliente (USUARIO_CLIENTE, email, senha, nome, dataNasc, idade, telefone, endereco) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;
    const values = [USUARIO_CLIENTE, email, senha, nome, dataNasc, idade, telefone, endereco];

    connection.query(query, values, (error, results, fields) => {
        if (error) {
            console.error(error);
            res.status(500).send('Erro ao adicionar o cliente.');
        } else {
            res.status(201).send('Cliente adicionado com sucesso.');
        }
    });
});
/*
app.post('/clientes', (req, res) => {
    const { USUARIO_CLIENTE, email, senha, nome, dataNasc, idade, telefone, endereco} = req.body;
    const query = 'INSERT INTO Cliente ( USUARIO_CLIENTE, email, senha, nome, dataNasc, idade, telefone, endereco) VALUES (?, ?, ?, ?, ?, ?, ?, ?,)';
    connection.query(query, [USUARIO_CLIENTE, email, senha, nome, dataNasc, idade, telefone, endereco], (err, result) => {
        if (err) throw err;
        res.send('Cliente adicionado com sucesso!');
    });
});*/


app.put('/clientes/:id', (req, res) => {
    const clienteId = req.params.id;
    const { email, senha, nome, dataNasc, telefone, endereco } = req.body;
    const query = 'UPDATE Cliente SET email=?, senha=?, nome=?, dataNasc=?, telefone=? endereco=? WHERE ID_CLIENTE=?';

    db.query(query, [email, senha, nome, dataNasc, telefone, endereco, clienteID], (err, result) => {
        if (err) throw err;
        res.send('Cliente atualizado com sucesso!');
    });
});

app.delete('clientes/:id', (req, res) => {
    const clienteId = req.params.id;

    db.query('DELETE FROM Cliente WHERE ID_CLIENTE = ?', [clienteId], (err, result) => {
        if (err) throw err;
        res.send('Cliente removido com sucesso!');
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
  
  app.get('/enderecos/:id', (req, res) => {
    const enderecoId = req.params.id;
    db.query('SELECT * FROM EnderecoCliente WHERE ID_ENDERECO = ?', [enderecoId], (err, results) => {
      if (err) throw err;
      if (results.length > 0) {
        res.json(results[0]);
      } else {
        res.status(404).json({ error: 'Endereço não encontrado.' });
      }
    });
  });


  
  // Rota para Comentarios
  app.get('/comentarios', (req, res) => {
    db.query('SELECT * FROM Comentario', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar comentarios.' });
      } else {
        res.json(results);
      }
    });
  });

  // Rota para Respostas
  app.get('/respostas', (req, res) => {
    db.query('SELECT * FROM Resposta', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar respostas.' });
      } else {
        res.json(results);
      }
    });
  });

  // Rota para FormasPagamento
  app.get('/formaPagamento', (req, res) => {
    db.query('SELECT * FROM FormaPagamento', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar formas de pagamento.' });
      } else {
        res.json(results);
      }
    });
  });

  // Rota para Cartões
  app.get('/cartoes', (req, res) => {
    db.query('SELECT * FROM Cartao', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar cartões.' });
      } else {
        res.json(results);
      }
    });
  });

  // Rota para PIX
  app.get('/pix', (req, res) => {
    db.query('SELECT * FROM Pix', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar chaves pix.' });
      } else {
        res.json(results);
      }
    });
  });

  // Rota para Boletos
  app.get('/boletos', (req, res) => {
    db.query('SELECT * FROM Comentario', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar boletos.' });
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

  // Rota para buscar todos os patrocinados
  app.get('/patrocinados', (req, res) => {
    db.query('SELECT * FROM Patrocinado', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar patrocinados.' });
      } else {
        res.json(results);
      }
    });
  });

  // Rota para buscar todos os cupons
  app.get('/cupons', (req, res) => {
    db.query('SELECT * FROM Cupom', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar CUpons.' });
      } else {
        res.json(results);
      }
    });
  });

  // Rota para buscar todos os carrinhos
  app.get('/carrinhos', (req, res) => {
    db.query('SELECT * FROM Carrinho', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar carrinhos.' });
      } else {
        res.json(results);
      }
    });
  });

  // Rota para buscar todos os fornecedores
  app.get('/fornecedores', (req, res) => {
    db.query('SELECT * FROM Fornecedor', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar Fornecedores.' });
      } else {
        res.json(results);
      }
    });
  });

  // Rota para buscar todas as categorias
  app.get('/categorias', (req, res) => {
    db.query('SELECT * FROM Categoria', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar categorias.' });
      } else {
        res.json(results);
      }
    });
  });

  // Rota para buscar todos os produtos
  app.get('/produtos', (req, res) => {
    db.query('SELECT * FROM Produto', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar produtos.' });
      } else {
        res.json(results);
      }
    });
  });

  // Rota para buscar todos os carrinhos com produtos
  app.get('/carrinhoproduto', (req, res) => {
    db.query('SELECT * FROM Carrinho_Tem_Produto', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar carrinhos com produtos.' });
      } else {
        res.json(results);
      }
    });
  });

    // Rota para buscar todos os carrinhos com produtos
  app.get('/pedidoproduto', (req, res) => {
    db.query('SELECT * FROM Pedito_Tem_Produto', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar pedidos com produtos.' });
      } else {
        res.json(results);
      }
    });
  });

  // Rota para buscar todos os produtos
  app.get('/nota', (req, res) => {
    db.query('SELECT * FROM Nota', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar notas.' });
      } else {
        res.json(results);
      }
    });
  });

    // Rota para buscar todos os produtos
  app.get('/itemnota', (req, res) => {
    db.query('SELECT * FROM ItemNota', (err, results) => {
      if (err) {
        res.status(500).json({ error: 'Erro ao buscar itens de nota.' });
      } else {
        res.json(results);
      }
    });
  });




// Conexão porta
/*app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});*/

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor iniciado na porta ${PORT}`);
});
