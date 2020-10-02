CREATE TABLE Socios(
    codigo BIGINT NOT NULL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    lograd VARCHAR(30) NOT NULL,
    complem VARCHAR(15),
    bairro VARCHAR(15),
    cidade VARCHAR(20),
    UF CHAR(2),
    CEP CHAR(8)
);

CREATE TABLE Assuntos(
    codigo BIGINT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE Livros(
    id VARCHAR(15) NOT NULL PRIMARY KEY,
    titulo VARCHAR(80) NOT NULL,
    editora VARCHAR(20) NOT NULL,
    totPag INT CHECK(totPag > 0),
    diasPrazo int CHECK(diasPrazo >= 0),
    CODASSUNTO BIGINT NOT NULL,
    FOREIGN KEY (CODASSUNTO) REFERENCES Assuntos(codigo) 
);

CREATE TABLE Autores(
    codigo BIGINT NOT NULL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    origem VARCHAR(20) NOT NULL
);

CREATE TABLE AUTORIAS(
    IDLIVRO VARCHAR(15),
    CODAUTOR BIGINT,
    FOREIGN KEY (IDLIVRO) REFERENCES Livros(id),
    FOREIGN KEY (CODAUTOR) REFERENCES Autores(codigo),
    PRIMARY KEY(IDLIVRO, CODAUTOR) 
);

CREATE TABLE Emprestimos(
    IDLIVRO VARCHAR(15),
    CODSOCIO BIGINT,
    dtRetirada datetime NOT NULL,
    dtDevPrev datetime NOT NULL,
    dtDevReal datetime,
    vrMulta decimal(15,2),
    FOREIGN KEY (IDLIVRO) REFERENCES Livros(id),
    FOREIGN KEY (CODSOCIO) REFERENCES Socios(codigo),
    PRIMARY KEY(IDLIVRO, CODSOCIO, dtRetirada)
);
INSERT INTO Assuntos VALUES (1, 'MICROBIOLOGIA');
INSERT INTO Autores VALUES (1, 'Silva, José da', 'Brasil');
INSERT INTO Autores VALUES (2, 'Silva, Vanderlei', 'Brasil');

INSERT INTO Assuntos VALUES
    (2, 'PROGRAMAÇÃO'),
    (3, 'MATERIAIS'),
    (4, 'FISIOLOGIA'),
    (5, 'USINAGEM'),
    (6, 'BANCO DE DADOS'),
    (7, 'CALCULO');

INSERT INTO Autores VALUES
    (3, 'Silva, João da', 'Brasil'),
    (4, 'Silva, Pedro da', 'Brasil'),
    (5, 'Silva, Ana da', 'Brasil'),
    (6, 'Silva, Antônio da', 'Brasil'),
    (7, 'Silva, Joaquim da', 'Brasil'),
    (8, 'Silva, Maria da', 'Brasil'),
    (9, 'Silva, Teobaldo da', 'Brasil'),
    (10, 'Silva, Arlete da', 'Brasil');

INSERT INTO Livros VALUES
    ('737.4.202 S2002', 'Os bichos são assim', 'LTC: 1990', 300, 7, 1),
    ('681.5.203 S442', 'Técnicas de programação estruturada', 'Campus Ano: 1992', 253, 7, 2),
    ('588.9.949 S3003', 'Ensaios de dureza e de moleza', 'LTC Ano: 1993', 330, 7, 3),
    ('737.4.234 S2323', 'O funcionamento do intestino', 'Globo Ano: 1990', 300, 7, 4),
    ('588.3.342 S4343', 'Torno radial: Como funciona a coisa', 'LTC Ano: 1994', 505, 7, 5),
    ('737.4.180 S2023', 'Bactérias, micróbios e coisas parecidas', 'Erika Ano: 1989', 300, 7, 1),
    ('683.2.343 S334', 'Teoria de bancos de dados', 'Campus Ano: 1990', 450, 7, 6),
    ('333.5.656 S1849', 'Calculo diferencial e integral', 'LTC Ano: 1990', 300, 7, 7);

INSERT INTO Autorias VALUES
    ('737.4.202 S2002', 1),
    ('737.4.202 S2002', 2),
    ('681.5.203 S442', 3),
    ('588.9.949 S3003', 4),
    ('737.4.234 S2323', 5),
    ('588.3.342 S4343', 6),
    ('588.3.342 S4343', 7),
    ('588.3.342 S4343', 4),
    ('737.4.180 S2023', 8),
    ('737.4.180 S2023', 2),
    ('683.2.343 S334', 9),
    ('333.5.656 S1849', 10);

INSERT INTO Socios VALUES
    (1, 'Valquiria Pires', '(15)98106-1643', 'Rua Miguel Montoro Lozano, 24', ' ','Jd 2 Corações', 'Sorocaba', 'SP', '18085761'),
    (2, 'Lucas Arashiro', '(15)99623-2085', 'Trovador Candini, 24', ' ', 'Jd Sto André', 'São Paulo', 'SP', '18077300'),
    (3, 'Sara de Oliveira', '(15)98101-4644', 'Galileu Pasquinelli, 970', 'casa 2', 'Brasilandia', 'Sorocaba', 'SP', '18075610'),
    (4, 'Pedro de Lara', '(11)99622-3654', 'Av Paulista, 23', 'Quadra 2', 'Vl Mariana', 'São Paulo', 'SP', '44022256'),
    (5, 'Hebe Camargo', '(11)99816-9832', 'Miguel Falabella, 678', ' ', 'B dos Famosos', 'São Paulo', 'SP', '44056000');

INSERT INTO Emprestimos VALUES
	('737.4.180 S2023', 2, '2019-11-24', '2019-11-29', '2019-11-28', 0),
	('737.4.202 S2002', 1, '2019-08-02', '2019-08-07', '2019-08-05', 0),
	('737.4.202 S2002', 3, '2019-07-06', '2019-07-11', '2019-07-11', 0),
	('681.5.203 S442', 5, '2020-02-03', '2020-02-08', '2020-02-05', 0),
	('588.9.949 S3003', 1, '2020-03-15', '2020-03-20', '2020-03-19', 0),
	('737.4.234 S2323', 4, '2020-04-22', '2020-04-27', '2020-04-27', 0),
	('588.3.342 S4343', 2, '2020-05-18', '2020-05-23', '2020-05-23', 0),
	('588.3.342 S4343', 3, '2020-03-02', '2020-03-07', '2020-03-04', 0),
	('737.4.180 S2023', 4, '2020-04-06', '2020-04-11', '2020-04-11', 0),
	('683.2.343 S334', 1, '2020-02-14', '2020-02-19', '2020-02-18', 0),
	('333.5.656 S1849', 5, '2020-08-16', '2020-08-21', '2020-08-25', 12),
	('737.4.180 S2023', 2, '2020-09-10', '2020-09-15', '2020-09-17', 6),
	('588.3.342 S4343', 3, '2020-09-20', '2020-09-20', NULL, 30),
	('737.4.234 S2323', 4, '2020-09-17', '2020-09-22', NULL, 30),
	('333.5.656 S1849', 5, '2020-09-11', '2020-09-16',NULL, 30);

	SELECT * FROM Emprestimos

