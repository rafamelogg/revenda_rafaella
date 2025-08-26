create database db_revenda_rafaella;

create table endereco (
id serial primary key,
logradouro varchar (100) not null,
localidade varchar (100) not null,
uf char(2) not null,
cep char(8) not null,
bairro varchar(50)not null
);

create table cliente(
id serial primary key,
nome varchar(30) not null,
email varchar(100) unique,
telefone varchar(20),
endereco varchar(50) not null,
cpf char(11) not null unique,
endereco_id int not null,
foreign key (endereco_id) references endereco (id)
);


create table vendedor(
id serial primary key,
nome varchar(30) not null,
email varchar(100) unique,
telefone varchar(20) not null,
comissao numeric(10, 2)
);

create table avaliacao(
id serial primary key, 
nota int not null,
comentarios text,
data_avaliacao date,
cliente_id int not null,
foreign key (cliente_id) references cliente (id)
);

create table venda(
id serial primary key,
data_venda date,
valor numeric(10, 2),
status VARCHAR(20) NOT null,
cliente_id int not null,
foreign key (cliente_id) references cliente (id),
vendedor_id int not null,
foreign key (vendedor_id) references vendedor (id)
);

create table tenis(
id serial primary key,
modelo varchar(100),
preco decimal(10,2),
cor varchar(30),
tamanho decimal(3, 1)
);

create table venda_tenis (
 venda_id int not null,
 tenis_id int not null,
 quantidade int not null,
 primary key (venda_id, tenis_id),
 foreign key (venda_id) references venda(id),
 foreign key (tenis_id) references tenis(id)
);

INSERT INTO endereco (logradouro, localidade, uf, cep, bairro) VALUES
('Rua 16 de Março, 100', 'Petrópolis', 'RJ', '25685210', 'Centro'),
('Rua Teresa, 50', 'Petrópolis', 'RJ', '25685400', 'Centro'),
('Rua do Imperador, 75', 'Petrópolis', 'RJ', '25685020', 'Centro'),
('Rua Paulo Barbosa, 200', 'Petrópolis', 'RJ', '25685410', 'Centro'),
('Rua Marechal Deodoro, 150', 'Petrópolis', 'RJ', '25685500', 'Centro'),
('Rua Dr. Sá Earp, 60', 'Petrópolis', 'RJ', '25685340', 'Centro'),
('Rua Moreira César, 90', 'Petrópolis', 'RJ', '25685300', 'Centro'),
('Rua Bingen, 30', 'Petrópolis', 'RJ', '25685420', 'Centro'),
('Rua Barão do Rio Branco, 10', 'Petrópolis', 'RJ', '25685010', 'Centro'),
('Rua Montecaseros, 45', 'Petrópolis', 'RJ', '25685600', 'Centro');

INSERT INTO cliente (nome, email, telefone, endereco, cpf, endereco_id) VALUES
('Thalita Lisboa', 'thalita.lisboa@email.com', '24222333444', 'Rua 16 de Março, 100', '12345678901', 1),
('Lara Martins', 'Lara.martins@email.com', '24222333555', 'Rua Teresa, 50', '23456789012', 2),
('Clara Vieira', 'clara.V@email.com', '24222333666', 'Rua do Imperador, 75', '34567890123', 3),
('Davi Marques', 'davi.m.zanella@email.com', '24222333777', 'Rua Paulo Barbosa, 200', '45678901234', 4),
('Giovana Baltar', 'gi.baltar@email.com', '24222333888', 'Rua Marechal Deodoro, 150', '56789012345', 5),
('Gustavo Enrique Souza', 'gustavo.souza@email.com', '24222333999', 'Rua Dr. Sá Earp, 60', '67890123456', 6),
('Gabriela Costa', 'gabriela.costa@email.com', '24222333111', 'Rua Moreira César, 90', '78901234567', 7),
('Ana Beatriz de Melo', 'bibia.garcia@email.com', '24222333222', 'Rua Bingen, 30', '89012345678', 8),
('Sophia Moura', 'sophiamoura@email.com', '24222333333', 'Rua Barão do Rio Branco, 10', '90123456789', 9),
('Carolina Gorni', 'Carolgorni@email.com', '24222333444', 'Rua Montecaseros, 45', '01234567890', 10);

INSERT INTO vendedor (nome, email, telefone, comissao) VALUES
('Lucas Oliveira', 'lucas.oliveira@email.com', '21999990001', 5.00),
('Milene Melo', 'milenemelo@email.com', '21999990002', 7.50),
('Alessandro José Garcia', 'alessandrogarcia@email.com', '21999990003', 6.00),
('Rafaela Lima', 'rafaela.lima@email.com', '21999990004', 8.00),
('Sofia Almeida', 'sofia.almeida@email.com', '21999990005', 5.50),
('Thiago Rocha', 'thiago.rocha@email.com', '21999990006', 7.00),
('Vanessa Costa', 'vanessa.costa@email.com', '21999990007', 6.50),
('Ryan Souza', 'ryansouza@email.com', '21999990008', 5.75),
('Joao Guilherme', 'Joaoguilherme@email.com', '21999990009', 7.25),
('Debora souza', 'deborasouza@email.com', '21999990010', 6.25);

INSERT INTO tenis (modelo, preco, cor, tamanho) VALUES
('Air Max 90', 499.90, 'Preto', 38.5),
('Jordan Retro', 599.00, 'Branco', 40),
('Ultra Boost', 699.99, 'Cinza', 39),
('Classic Leather', 349.90, 'Vermelho', 37.5),
('Gel-Kayano', 429.50, 'Azul', 41),
('Pegasus Trail', 389.00, 'Verde', 42),
('Suede Classic', 279.90, 'Bege', 38),
('Chuck Taylor', 329.99, 'Branco', 40),
('Air Force 1', 399.00, 'Preto', 39.5),
('Clyde Court', 459.90, 'Vermelho', 41.5);

INSERT INTO venda (data_venda, valor, status, cliente_id, vendedor_id) VALUES
('2023-08-01', 499.90, 'Concluída', 1, 1),
('2023-08-02', 1198.00, 'Concluída', 2, 2),
('2023-08-03', 699.99, 'Pendente', 3, 3),
('2023-08-04', 349.90, 'Concluída', 4, 4),
('2023-08-05', 1288.50, 'Cancelada', 5, 5),
('2023-08-06', 389.00, 'Concluída', 6, 6),
('2023-08-07', 559.80, 'Concluída', 7, 7),
('2023-08-08', 329.99, 'Pendente', 8, 8),
('2023-08-09', 399.00, 'Concluída', 9, 9),
('2023-08-10', 919.80, 'Concluída', 10, 10);

INSERT INTO avaliacao (nota, comentarios, data_avaliacao, cliente_id) VALUES
(5, 'Tênis muito confortável e bonito.', '2023-08-11', 1),
(4, 'Ótimo produto, mas poderia ser mais barato.', '2023-08-12', 2),
(3, 'Confortável, mas o design não me agradou.', '2023-08-13', 3),
(5, 'Excelente qualidade!', '2023-08-14', 4),
(2, 'Achei o tamanho um pouco pequeno.', '2023-08-15', 5),
(4, 'Gostei bastante, recomendo.', '2023-08-16', 6),
(3, 'Preço justo pelo produto.', '2023-08-17', 7),
(5, 'Tênis muito estiloso.', '2023-08-18', 8),
(4, 'Confortável e resistente.', '2023-08-19', 9),
(5, 'Superou minhas expectativas.', '2023-08-20', 10);

INSERT INTO venda_tenis (venda_id, tenis_id, quantidade) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 1),
(5, 5, 3),
(6, 6, 1),
(7, 7, 2),
(8, 8, 1),
(9, 9, 1),
(10, 10, 2);

CREATE VIEW vendas_com_cliente AS
SELECT
  v.id,
  v.data_venda,
  v.status,
  v.valor,
  c.nome
FROM venda v
JOIN cliente c ON v.cliente_id = c.id
WHERE v.status = 'Concluída';

CREATE VIEW clientes_com_endereco AS
SELECT
  c.id,
  c.nome,
  c.email,
  e.logradouro,
  e.localidade
FROM cliente c
JOIN endereco e ON c.endereco_id = e.id
WHERE e.uf = 'RJ';

SELECT * FROM vendas_com_cliente;

SELECT * FROM clientes_com_endereco;