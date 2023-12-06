CREATE DATABASE HarmonyTunes;
USE HarmonyTunes;

CREATE TABLE EnderecoCliente (
    ID_ENDERECO INT AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(150) not null,
    numero VARCHAR(15) not null,
    CEP CHAR(8) not null,
    bairro VARCHAR(50) not null,
    cidade VARCHAR(100) not null,
    complemento VARCHAR(50) null
);

INSERT INTO EnderecoCliente VALUES (default, 'Rua das Andorinhas', '234', '12345678', 'Jardim das Flores', 'São Paulo', 'Apartamento 123');
INSERT INTO EnderecoCliente VALUES (default, 'Avenida Paulista', '888', '01454000', 'Centro', 'São Paulo', 'Sala 101');
INSERT INTO EnderecoCliente VALUES(default,'Rua das Rosas', '123', '98765432', 'Vila Nova', 'Rio de Janeiro', 'Casa');
INSERT INTO EnderecoCliente VALUES (default, 'Avenida Beira-Mar', '456', '54321123', 'Copacabana', 'Rio de Janeiro', 'Apartamento 202');
INSERT INTO EnderecoCliente VALUES (default, 'Rua das Palmeiras', '789', '32165432', 'Boa Vista', 'Recife', 'Casa');
INSERT INTO EnderecoCliente VALUES (default, 'Avenida Atlântica', '123', '12345678', 'Copacabana', 'Rio de Janeiro', 'Hotel Copacabana Palace'); 
INSERT INTO EnderecoCliente VALUES (default, 'Rua das Flores', '456', '98765432', 'Vila Nova', 'Rio de Janeiro', 'Apartamento 303');
INSERT INTO EnderecoCliente VALUES (default, 'Avenida Paulista', '999', '01454000', 'Centro', 'São Paulo', 'Edifício Paulista 1000');
INSERT INTO EnderecoCliente VALUES (default, 'Rua das Andorinhas', '678', '12345678', 'Jardim das Flores', 'São Paulo', 'Casa');
INSERT INTO EnderecoCliente VALUES (default,'Avenida Beira-Mar', '234', '54321123', 'Copacabana', 'Rio de Janeiro', 'Hotel Golden Tulip');


CREATE TABLE Cliente (
    ID_CLIENTE INT AUTO_INCREMENT not null,
    USUARIO_CLIENTE VARCHAR(20) not null,
    email VARCHAR(50) not null,
    senha VARCHAR(20) not null,
    nome VARCHAR(100) not null,
    dataNasc DATE not null /*aaaa-mm-dd*/, 
    idade INT not null,
    telefone CHAR(15) not null,
    endereco INT not null,

    CONSTRAINT pk_Cliente PRIMARY KEY (ID_CLIENTE, USUARIO_CLIENTE, email),
    CONSTRAINT fk_EnderecoCliente FOREIGN KEY (endereco) REFERENCES EnderecoCliente(ID_ENDERECO) ON DELETE RESTRICT
);



INSERT INTO Cliente VALUES (default, 'joao123', 'joao@email.com', '123456', 'João da Silva', '1990-10-04', 33, '(11) 99999-9999', 1);
INSERT INTO Cliente VALUES (default, 'maria123', 'maria@email.com', '123456', 'Maria Souza', '1995-05-12', 28, '(11) 88888-8888', 2);
INSERT INTO Cliente VALUES (default, 'pedro123', 'pedro@email.com', '123456', 'Pedro Santos', '1985-02-20', 38, '(21) 77777-7777', 3);
INSERT INTO Cliente VALUES (default, 'ana123', 'ana@email.com', '123456', 'Ana Oliveira', '2000-06-18', 23, '(11) 66666-6666', 4);
INSERT INTO Cliente VALUES (default, 'carlos123', 'carlos@email.com', '123456', 'Carlos Pereira', '1975-08-17', 48, '(81) 55555-5555', 5);
INSERT INTO Cliente VALUES (default, 'jose123', 'jose@email.com', '123456', 'José Machado', '1960-01-01', 63, '(11) 44444-4444', 6);
INSERT INTO Cliente VALUES (default, 'francisco123', 'francisco@email.com', '123456', 'Francisco Lima', '1980-09-22', 43, '(21) 33333-3333', 7);
INSERT INTO Cliente VALUES (default, 'luis123', 'luis@email.com', '123456', 'Luís Soares', '1992-07-14', 31, '(11) 22222-2222', 8);
INSERT INTO Cliente VALUES (default, 'daniel123', 'daniel@email.com', '123456', 'Daniel Almeida', '2005-03-08', 18, '(11) 11111-1111', 9);
INSERT INTO Cliente VALUES (default, 'mariana123', 'mariana@email.com', '123456', 'Mariana Silva', '1996-04-25', 27, '(21) 99999-0000', 10);




CREATE TABLE PF(
    CPF CHAR(11) PRIMARY KEY not null,
    Cliente_ID INT not null,

    CONSTRAINT fk_ClientePF FOREIGN KEY(Cliente_ID) REFERENCES Cliente(ID_CLIENTE) ON DELETE CASCADE
);

CREATE TABLE PJ (
    CNPJ CHAR(14) PRIMARY KEY not null,
    Cliente_ID INT not null,

    CONSTRAINT fk_ClientePJ FOREIGN KEY(Cliente_ID) REFERENCES Cliente(ID_CLIENTE) ON DELETE CASCADE
);


ALTER TABLE Cliente ADD INDEX idx_usr_cliente (USUARIO_CLIENTE);
CREATE TABLE Comentario (
  ID_COMENTARIO INT AUTO_INCREMENT not null,
  content TEXT not null,
  dataComment DATE not null,
  Cliente_ID INT not null,
  Cliente_USER VARCHAR(20) not null,

  CONSTRAINT pk_Comentario PRIMARY KEY (ID_COMENTARIO),
  CONSTRAINT fk_ClienteIDComentario FOREIGN KEY(Cliente_ID) REFERENCES Cliente(ID_CLIENTE) ON DELETE RESTRICT,
  CONSTRAINT fk_UserComentario FOREIGN KEY(Cliente_USER) REFERENCES Cliente(USUARIO_CLIENTE) ON DELETE RESTRICT
);

CREATE TABLE Resposta (
    ID_RESPOSTA INT AUTO_INCREMENT not null,
    content TEXT not null,
    dataResposta DATE not null,
    Comentario_ID INT not null,
    Cliente_ID INT not null,
    Cliente_USER VARCHAR(20) not null,

    CONSTRAINT pk_Resposta PRIMARY KEY (ID_RESPOSTA),
    CONSTRAINT fk_ComentResposta FOREIGN KEY(Comentario_ID) REFERENCES Comentario(ID_COMENTARIO) ON DELETE RESTRICT,
    CONSTRAINT fk_ClienteIDResposta FOREIGN KEY(Cliente_ID) REFERENCES Cliente(ID_CLIENTE) ON DELETE RESTRICT,
    CONSTRAINT fk_ClienteUSERResposta FOREIGN KEY(Cliente_USER) REFERENCES Cliente(USUARIO_CLIENTE) ON DELETE RESTRICT
);

INSERT INTO Comentario VALUES (default, 'Primeiro comentario', '2023-11-08', 1, 'joao123');
INSERT INTO Comentario VALUES (default, 'Segundo comentario', '2023-11-08', 2, 'maria123');
INSERT INTO Comentario VALUES (default, 'Terceiro comentario', '2023-11-08', 3, 'francisco123');
INSERT INTO Comentario VALUES (default, 'Quarto comentario', '2023-11-08', 4, 'mariana123');
INSERT INTO Comentario VALUES (default, 'Quinto comentario', '2023-11-08', 2, 'maria123');
INSERT INTO Comentario VALUES (default, 'Sexto comentario', '2023-11-08', 1, 'joao123');
INSERT INTO Comentario VALUES (default, 'Sétimo comentario', '2023-11-08', 3, 'francisco123');
INSERT INTO Comentario VALUES (default, 'Oitavo comentario', '2023-11-08', 4, 'mariana123');
INSERT INTO Comentario VALUES (default, 'Nono comentario', '2023-11-08', 9, 'luis123');
INSERT INTO Comentario VALUES (default, 'Décimo comentario', '2023-11-08', 9, 'luis123');

INSERT INTO Resposta VALUES (default, 'Primeira resposta', '2023-11-08', 1, 9, 'luis123');
INSERT INTO Resposta VALUES (default, 'Segunda resposta', '2023-11-08', 2, 4, 'mariana123');
INSERT INTO Resposta VALUES (default, 'Terceira resposta', '2023-11-08', 3, 3, 'francisco123');
INSERT INTO Resposta VALUES (default, 'Quarta resposta', '2023-11-08', 4, 1, 'joao123');
INSERT INTO Resposta VALUES (default, 'Quinta resposta', '2023-11-08', 5, 3, 'francisco123');
INSERT INTO Resposta VALUES (default, 'Sexta resposta', '2023-11-08', 6, 2, 'maria123');
INSERT INTO Resposta VALUES (default, 'Sétima resposta', '2023-11-08', 7, 3, 'francisco123');
INSERT INTO Resposta VALUES (default, 'Oitava resposta', '2023-11-08', 8, 1, 'joao123');
INSERT INTO Resposta VALUES (default, 'Nona resposta', '2023-11-08', 9, 4, 'mariana123');
INSERT INTO Resposta VALUES (default, 'Décima resposta', '2023-11-08', 10, 9, 'luis123');


CREATE TABLE FormaPagamento (
    ID_FormaPagamento INT PRIMARY KEY,
    metodoPagamento VARCHAR(20) not null,
    Cliente_ID INT not null,
    
    CONSTRAINT fk_CientePagamento FOREIGN KEY (Cliente_ID) REFERENCES Cliente(ID_CLIENTE) ON DELETE CASCADE
);

CREATE TABLE Cartao(
    ID_CARTAO INT AUTO_INCREMENT not null,
    numeroCartao CHAR(16) not null,
    nomeTitular VARCHAR(100) not null,
    validadeCartao DATE not null /* aaaa/mm/30*/,
    /* datepart p/ consulta m/y */
    codVerificacao char(3) not null,
    FormaPagamento INT not null,
    tipCartao CHAR(7) not null,

    CONSTRAINT pk_Cartao PRIMARY KEY(ID_CARTAO, numeroCartao),
    CONSTRAINT fk_PagamentoCredito FOREIGN KEY (FormaPagamento) REFERENCES FormaPagamento(ID_FormaPagamento) ON DELETE RESTRICT
);

CREATE TABLE PIX (
	ChavePIX VARCHAR(100) not null,
    FormaPagamento INT not null,
    
    PRIMARY KEY (ChavePIX),
    CONSTRAINT fk_PagamentoPIX FOREIGN KEY (FormaPagamento) REFERENCES FormaPagamento(ID_FormaPagamento) ON DELETE CASCADE
);

CREATE TABLE BOLETO (
	ID_BOLETO INT not null,
    codBarras VARCHAR(50) not null,
    FormaPagamento INT not null,
    
    PRIMARY KEY (ID_BOLETO),
    CONSTRAINT fk_PagamentoBoleto FOREIGN KEY (FormaPagamento) REFERENCES FormaPagamento(ID_FormaPagamento) ON DELETE CASCADE
);

CREATE TABLE Pedido (
    ID_PEDIDO INT AUTO_INCREMENT PRIMARY KEY,
    numItens INT not null,
    dataPedido DATE not null,
    valorCompra DOUBLE not null,
    estadoPedido VARCHAR(30),
    codigoDeRastreio CHAR(12),
    Cliente_ID INT not null,
    
    CONSTRAINT fk_ClientePedito FOREIGN KEY (Cliente_ID) REFERENCES Cliente (ID_CLIENTE) ON DELETE RESTRICT
);

INSERT INTO Pedido (ID_PEDIDO, numItens, dataPedido, valorCompra, estadoPedido, codigoDeRastreio, Cliente_ID) VALUES (default, 2, '2023-11-05', 789.58, "Entregue", "1234", 1);
INSERT INTO Pedido (ID_PEDIDO, numItens, dataPedido, valorCompra, estadoPedido, codigoDeRastreio, Cliente_ID) VALUES (default, 1, '2023-09-11', 147.37, "Entregue", "12345", 2);
INSERT INTO Pedido (ID_PEDIDO, numItens, dataPedido, valorCompra, estadoPedido, codigoDeRastreio, Cliente_ID) VALUES (default, 3, '2023-03-15', 985, "Entregue", "3216", 3);
INSERT INTO Pedido (ID_PEDIDO, numItens, dataPedido, valorCompra, estadoPedido, codigoDeRastreio, Cliente_ID) VALUES (default, 5, '2023-05-20', 1587.99, "Entregue", "54789", 4);
INSERT INTO Pedido (ID_PEDIDO, numItens, dataPedido, valorCompra, estadoPedido, codigoDeRastreio, Cliente_ID) VALUES (default, 2, '2023-05-20', 58, "Entregue", "1478546", 5);
INSERT INTO Pedido (ID_PEDIDO, numItens, dataPedido, valorCompra, estadoPedido, codigoDeRastreio, Cliente_ID) VALUES (default, 1, '2023-07-01', 25.99, "Entregue", "111478", 6);
INSERT INTO Pedido (ID_PEDIDO, numItens, dataPedido, valorCompra, estadoPedido, codigoDeRastreio, Cliente_ID) VALUES (default, 3, '2023-01-28', 99.90, "Entregue", "154781358", 7);
INSERT INTO Pedido (ID_PEDIDO, numItens, dataPedido, valorCompra, estadoPedido, codigoDeRastreio, Cliente_ID) VALUES (default, 25, '2023-03-25', 28987.32, "Entregue", "5897451", 8);
INSERT INTO Pedido (ID_PEDIDO, numItens, dataPedido, valorCompra, estadoPedido, codigoDeRastreio, Cliente_ID) VALUES (default, 8, '2023-05-04', 380.73, "Entregue", "587468", 9);
INSERT INTO Pedido (ID_PEDIDO, numItens, dataPedido, valorCompra, estadoPedido, codigoDeRastreio, Cliente_ID) VALUES (default, 1, '2023-02-09', 134.99, "Entregue", "5879231458", 10);

CREATE TABLE Patrocinado (
    ID_PATROCINADO INT AUTO_INCREMENT PRIMARY KEY,
    nomePatrocinado VARCHAR(100) not null,
    CPFPatocinado CHAR(11) not null,
    Comissao double not null,
    inicioPatrocinio DATE not null,
    periodoPatrocinio INT not null /*SEMANAS*/    
);

INSERT INTO Patrocinado (nomePatrocinado, CPFPatocinado, Comissao, inicioPatrocinio, periodoPatrocinio) VALUES ("José da Silva", '87613564511', 0.1, '2023-08-11', 2);
INSERT INTO Patrocinado (nomePatrocinado, CPFPatocinado, Comissao, inicioPatrocinio, periodoPatrocinio) VALUES ("Julio Cesar", '73912468302', 0.2, '2023-08-11', 2);
INSERT INTO Patrocinado (nomePatrocinado, CPFPatocinado, Comissao, inicioPatrocinio, periodoPatrocinio) VALUES ("Rômulo Roma", '03892815394', 0.15, '2023-08-11', 1);
INSERT INTO Patrocinado (nomePatrocinado, CPFPatocinado, Comissao, inicioPatrocinio, periodoPatrocinio) VALUES ("Remo Lacio", '19374278401', 0.3, '2023-08-11', 1);
INSERT INTO Patrocinado (nomePatrocinado, CPFPatocinado, Comissao, inicioPatrocinio, periodoPatrocinio) VALUES ("Catarina Grande", '13675385922', 0.1, '2023-08-11', 2);
INSERT INTO Patrocinado (nomePatrocinado, CPFPatocinado, Comissao, inicioPatrocinio, periodoPatrocinio) VALUES ("Roberto de Souza", '35489124678', 1, '2023-08-11', 52);

CREATE TABLE Cupom(
	ID_CUPOM INT AUTO_INCREMENT PRIMARY KEY,
    codCupom VARCHAR(10),
    descontoCupom DOUBLE,
    patrocinado_ID INT not null,
    
    CONSTRAINT fk_PatrocinadoCupom FOREIGN KEY (patrocinado_ID) REFERENCES Patrocinado (ID_PATROCINADO) ON DELETE CASCADE
);

INSERT INTO Cupom VALUES (default, "cJose", 0.1, 1);
INSERT INTO Cupom VALUES (default, "cJulio", 0.2, 2);
INSERT INTO Cupom VALUES (default, "cRomulo", 0.15, 3);
INSERT INTO Cupom VALUES (default, "cRemo", 0.15, 4);
INSERT INTO Cupom VALUES (default, "cCatarina", 0.3, 5);
INSERT INTO Cupom VALUES (default, "cRobert", 1, 6);

CREATE TABLE Carrinho (
    ID_CARRINHO INT AUTO_INCREMENT PRIMARY KEY,
    qntdItens INT not null,
    valorCarrinho DOUBLE not null,
    cliente_ID INT not null,
    cupom_ID INT not null,
    
    CONSTRAINT fk_ClienteCarrinho FOREIGN KEY (cliente_ID) REFERENCES Cliente (ID_CLIENTE) ON DELETE RESTRICT,
    CONSTRAINT fk_CupomCarrinho FOREIGN KEY (cupom_ID) REFERENCES Cupom (ID_CUPOM) ON DELETE CASCADE
);

CREATE TABLE Loja (
    CNPJ CHAR(14) PRIMARY KEY,
    Nome CHAR(13) not null
);
INSERT INTO Loja VALUES (33041260065290, "HarmonyTunes");

CREATE TABLE Fornecedor (
    ID_FORNECEDOR INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) not null,
    emailContato VARCHAR(100) not null
);
INSERT INTO Fornecedor (nome, emailContato) VALUES ("StringBerg", "contatostringberg@stberg.com");
INSERT INTO Fornecedor (nome, emailContato) VALUES ("Tagima", "contacttagima@tagima.com");
INSERT INTO Fornecedor (nome, emailContato) VALUES ("Michael", "michaelcontato@michael.com");
INSERT INTO Fornecedor (nome, emailContato) VALUES ("Yamaha", "contactyamaha@yamaha");
INSERT INTO Fornecedor VALUES (default, "Eagle", "eaglecontact@eagle.com");
INSERT INTO Fornecedor VALUES (default, "Borne", "bornecontact@borne.com");
INSERT INTO Fornecedor VALUES (default, "Shure", "contatoshure@shure.com");
INSERT INTO Fornecedor VALUES (default, "Boss", "bosscontact@boss.com");
INSERT INTO Fornecedor VALUES (default, "Behringer", "begercontact@behringer.com");
INSERT INTO Fornecedor VALUES (default, "Edifier", "contato.edifier@edfier.com");



CREATE TABLE Categoria (
    ID_CATEGORIA INT AUTO_INCREMENT PRIMARY KEY,
    NomeCategoria VARCHAR(30) not null
);
INSERT INTO Categoria VAlUES ( default, "Cordas");
INSERT INTO Categoria VAlUES ( default, "Bateria e Percussão");
INSERT INTO Categoria VAlUES ( default, "Sopros");
INSERT INTO Categoria VAlUES ( default, "Teclas");
INSERT INTO Categoria VAlUES ( default, "Arcos");
INSERT INTO Categoria VAlUES ( default, "Audio");
INSERT INTO Categoria VAlUES ( default, "Acessórios");
INSERT INTO Categoria VAlUES ( default, "Capas e Cases");
INSERT INTO Categoria VAlUES ( default, "Microfones");
INSERT INTO Categoria VAlUES ( default, "Pedais");


CREATE TABLE Produto (
    codProd INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) not null,
    qtdEstoque INT not null,
    descricao TEXT not null,
    precoUnit DOUBLE not null,
    fornecedor_ID INT not null,
    loja_CNPJ CHAR(14) not null,
    Categoria_ID INT not null,
    
    CONSTRAINT fk_fornecedorProduto FOREIGN KEY (fornecedor_ID) REFERENCES Fornecedor (ID_FORNECEDOR) ON DELETE RESTRICT,
    CONSTRAINT fk_LojaProduto FOREIGN KEY (loja_CNPJ) REFERENCES Loja (CNPJ) ON DELETE RESTRICT,
    CONSTRAINT fk_CatProd FOREIGN KEY (Categoria_ID) REFERENCES Categoria(ID_CATEGORIA) ON DELETE RESTRICT
);

INSERT INTO Produto VALUES (default, 'Violão acústico', 10, 'Violão acústico de tamanho standard com cordas de nylon.', 1000.00, 1, '33041260065290', 1);
INSERT INTO Produto VALUES (default, 'Guitarra elétrica', 5, 'Guitarra elétrica com corpo em alder e escala em maple.', 2000.00, 2, '33041260065290', 2);
INSERT INTO Produto VALUES (default, 'Baixo elétrico', 2, 'Baixo elétrico com corpo em basswood e escala em rosewood.', 3000.00, 3, '33041260065290', 3);
INSERT INTO Produto VALUES (default, 'Bateria completa', 1, 'Bateria completa com 4 tambores e 3 pratos.', 5000.00, 3, '33041260065290', 4);
INSERT INTO Produto VALUES (default, 'Teclado elétrico', 3, 'Teclado elétrico com 88 teclas e 64 sons.', 4000.00, 4, '33041260065290', 6);
INSERT INTO Produto VALUES (default, 'Flauta transversal', 4, 'Flauta transversal de metal com 3 chaves.', 500.00, 4, '33041260065290', 5);
INSERT INTO Produto VALUES (default, 'Saxofone', 2, 'Saxofone tenor em bronze.', 1000.00, 5, '33041260065290', 7);
INSERT INTO Produto VALUES (default, 'Trompete', 1, 'Trompete em latão.', 500.00, 5, '33041260065290', 8);
INSERT INTO Produto VALUES (default, 'Violino', 6, 'Violino com 4 cordas.', 1000.00, 5, '33041260065290', 9);
INSERT INTO Produto VALUES (default, 'Bateria eletrônica', 2, 'Bateria eletrônica com 10 pads e 12 sons.', 4000.00, 3, '33041260065290', 10);
/*INSERT INTO Produto VALUES (default, 'Amplificador de guitarra', 3, 'Amplificador de guitarra de 100 watts.', 2000.00, 6, '33041260065290', 11);
INSERT INTO Produto VALUES (default, 'Pedal de efeitos para guitarra', 5, 'Pedal de efeitos para guitarra com 10 efeitos.', 1000.00, 9, '33041260065290', 12);
INSERT INTO Produto VALUES (default, 'Microfone', 10, 'Microfone condensador com cabo de 3 metros.', 500.00, 8, '33041260065290', 11);
INSERT INTO Produto VALUES (default, 'Sanfona', 7, 'Sanfona com 120 baixos e 80 agudos.', 3000.00, 3, '33041260065290', 7);*/

CREATE TABLE Imagens(
	ID_IMAGEM INT AUTO_INCREMENT PRIMARY KEY,
    nomeImg VARCHAR(25) not null,
    tamImg VARCHAR(25) not null,
    tipoIMG VARCHAR(25) not null,
    Imglink VARCHAR(200) not null, 
    codProd INT not null,
    
    CONSTRAINT fk_ProdutoIMG FOREIGN KEY Produto(codProd) REFERENCES Produto(codProd) ON DELETE CASCADE
);

CREATE TABLE Carrinho_Tem_Produto (
    Carrinho_ID INT PRIMARY KEY,
    Produto_codProd INT not null,
    
    CONSTRAINT fk_Carrinho FOREIGN KEY (Carrinho_ID) REFERENCES Carrinho (ID_CARRINHO) ON DELETE CASCADE,
    CONSTRAINT fk_Produto FOREIGN KEY (Produto_codProd) REFERENCES Produto (codProd) ON DELETE CASCADE
);

CREATE TABLE Pedito_Tem_Produto (
    Produto_codProd INT not null,
    Pedido_ID INT not null,
    
    CONSTRAINT pk_Pedito_Tem_Produto PRIMARY KEY (Pedido_ID, Produto_codProd),
    CONSTRAINT fk_Pedido FOREIGN KEY (Pedido_ID) REFERENCES Pedido (ID_PEDIDO) ON DELETE CASCADE,
    CONSTRAINT fk_ProdutoPedido FOREIGN KEY (Produto_codProd) REFERENCES Produto (codProd) ON DELETE CASCADE
);

CREATE TABLE Nota (
    ID_NOTA INT PRIMARY KEY,
    ValorNota DOUBLE not null,
    dataEmissao DATE not null,
    Cliente_ID INT not null,
    Loja_CNPJ CHAR(14) not null,
    
    CONSTRAINT fk_ClienteNota FOREIGN KEY (cliente_ID) REFERENCES Cliente (ID_CLIENTE) ON DELETE RESTRICT,
    CONSTRAINT fk_LojaNota FOREIGN KEY (Loja_CNPJ) REFERENCES Loja (CNPJ) ON DELETE RESTRICT
);

CREATE TABLE ItemNota (
    ID_ITEM INT PRIMARY KEY,
    qtdComprada INT not null,
    Produto_codProd INT not null,
    Nota_ID INT not null,
    
    CONSTRAINT fk_ProdutoItem FOREIGN KEY (Produto_codProd) REFERENCES Produto (codProd) ON DELETE RESTRICT,
    CONSTRAINT fk_NotaItem FOREIGN KEY (Nota_ID) REFERENCES Nota(ID_NOTA) ON DELETE RESTRICT
);
