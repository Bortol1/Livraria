# Schema é uma coleção de objetos dentro de um determinado database,servem para agrupar objetos no nível de aplicação como também para simplesmente fazer divisões departamentais.
CREATE SCHEMA CLUBE_DO_LIVRO;

CREATE TABLE LIVROS(   
  ID_LIVRO INT NOT NULL,
  NOME_LIVRO VARCHAR(100) NOT NULL,
  AUTORIA VARCHAR(100) NOT NULL,
  EDITORA VARCHAR(100) NOT NULL,
  CATEGORIA VARCHAR(100) NOT NULL,
  PREÇO DECIMAL(5,2) NOT NULL,

PRIMARY KEY (ID_LIVRO)
);

CREATE TABLE ESTOQUE(
  ID_LIVRO INT NOT NULL,
  QTD_ESTOQUE INT NOT NULL,

PRIMARY KEY (ID_LIVRO)
);

CREATE TABLE VENDAS(
  ID_PEDIDO INT NOT NULL,
  ID_VENDEDOR INT NOT NULL,
  ID_LIVRO INT NOT NULL,
  QTD_VENDIDA INT NOT NULL,
  DATA_VENDA DATE NOT NULL,

PRIMARY KEY (ID_VENDEDOR, ID_PEDIDO)
);

CREATE TABLE VENDEDORES (
    ID_VENDEDOR INT NOT NULL,
    NOME_VENDEDOR VARCHAR(255) NOT NULL,
 PRIMARY KEY (ID_VENDEDOR)
);

ALTER TABLE ESTOQUE ADD CONSTRAINT CE_ESTOQUE_LIVROS
FOREIGN KEY (ID_LIVRO) 
REFERENCES LIVROS (ID_LIVRO)
ON DELETE NO ACTION 
ON UPDATE NO ACTION;

ALTER TABLE VENDAS ADD CONSTRAINT CE_VENDAS_LIVROS
FOREIGN KEY (ID_LIVRO)
REFERENCES LIVROS (ID_LIVRO)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE VENDAS ADD CONSTRAINT CE_VENDAS_VENDEDORES
FOREIGN KEY (ID_VENDEDOR)
REFERENCES VENDEDORES (ID_VENDEDOR)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO LIVROS VALUES (
1,
"Percy Jackson e o ladrão de Raios",
"Rick Riordan",
"Intrínseca",
"Aventura",
34.65);

INSERT INTO LIVROS VALUES
(2, "O cortiço", "Aluísio de Azevedo", "Panda Books", "Romance", 47.8),
(3, "A Volta ao Mundo em 80 Dias", "Julio verne", "Principis", "Aventura", 21.99),
(4, "Dom Casmurro", "Machado de Assis", "Via Leitura", "Romance", 48);

INSERT INTO LIVROS VALUES
(5, "Memórias Póstumas de Brás Cubas", "Machado de Assis", "Antofágica", "Romance", 28.90),
(6, "Quincas Borba", "Machado de Assis", "L&PM Editores", "Romance", 48.50),
(7, "Ícaro", "Gabriel Pedrosa", "Ateliê", "Poesia", 36.00),
(8, "Os Lusíadas", "Luís Vaz de Camões", "Montecristo", "Poesia", 18.79),
(9, "Outros Jeitos de Usar a Boca", "Rupi Kaur", "Planeta", "Poesia", 34.80),
(10, "Eu sou Malala", "Malala Yousafzai", "Companhia de Letras", "Biografia", 34.90),
(11, "Minha História", "Michelle Obama", "Objetiva", "Biografia", 57.90);

INSERT INTO VENDEDORES VALUES
(1, "Paula Rabelo"),
(2, "Juliana Macedo"),
(3, "Roberto Barros"),
(4, "Barbara Jales");

INSERT INTO VENDAS 
VALUES 
(1, 3, 7, 1, '2020-11-02'),
(2, 4, 8, 2, '2020-11-02'),
(3, 4, 4, 3, '2020-11-02'),
(4, 1, 7, 1, '2020-11-03'),
(5, 1, 6, 3, '2020-11-03'),
(6, 1, 9, 2, '2020-11-04'),
(7, 4, 1, 3, '2020-11-04'),
(8, 1, 5, 2, '2020-11-05'),
(9, 1, 2, 1, '2020-11-05'),
(10, 3, 8, 2, '2020-11-11'),
(11, 1, 1, 4, '2020-11-11'),
(12, 2, 10, 10, '2020-11-11'),
(13, 1, 12, 5, '2020-11-18'),
(14, 2, 4, 1, '2020-11-25'),
(15, 3, 13, 2,'2021-01-05'),
(16, 4, 13, 1, '2021-01-05'),
(17, 4, 4, 3, '2021-01-06'),
(18, 2, 12, 2, '2021-01-06');

INSERT INTO ESTOQUE 
VALUES
(1,  7),
(2,  10),
(3,  2),
(8,  4),
(10, 5),
(11, 3),
(12, 3);


#Inserindo valores fora de ordem
INSERT INTO LIVROS 
(CATEGORIA, AUTORIA, NOME_LIVRO, EDITORA, ID_LIVRO, PREÇO)
VALUES
('Biografia' ,    'Malala Yousafzai', 'Eu sou Malala'       , 'Companhia das Letras', 12, 22.32),
('Biografia' ,    'Michelle Obama'  , 'Minha história'      , 'Objetiva'            ,    13,    57.90),
('Biografia' ,    'Anne Frank'      , 'Diário de Anne Frank', 'Pe Da Letra'         , 14, 34.90);

# comando para selecionar tudo de uma só tabela
SELECT * FROM LIVROS;

# comando para selecionar somente um campo específico da tabela
SELECT NOME_LIVRO FROM LIVROS;

# comando para apelidar um campo em espeífico
SELECT ID_LIVRO AS "Código do livro" FROM LIVROS;

# comando para selecionar somente os livros que tenham a categoria biografia
SELECT * FROM LIVROS
WHERE CATEGORIA = "BIOGRAFIA";

# comando para selecionar somente os livros com a categoria romance e com o preço menor que 48 reais
SELECT * FROM LIVROS
WHERE CATEGORIA = "ROMANCE" AND PREÇO < 48;

# comando para selecionar somente os livros com a categoria poesia, porem que não sejam dos autores específicos a baixo
SELECT * FROM LIVROS
WHERE CATEGORIA = "POESIA" AND NOT (AUTORIA = "Luís Vaz De Camões" OR AUTORIA = "Gabriel Pedrosa");

# comando para selecionar somente os livros com os autores que começam com a letra m
SELECT * FROM LIVROS
WHERE AUTORIA LIKE "M%";