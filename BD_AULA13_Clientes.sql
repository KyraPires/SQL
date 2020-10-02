CREATE DATABASE BD_AULA13_CLIENTES

USE BD_AULA13_CLIENTES

CREATE TABLE Filial(
	CodFilial VARCHAR(1) NOT NULL,
	NomeFilial VARCHAR(40) NOT NULL,
	Telefones VARCHAR(10),
	CONSTRAINT PK_Filial PRIMARY KEY (CodFilial),
)

CREATE TABLE Clientes (
	CodCli BIGINT NOT NULL,
	Nome VARCHAR (40) NOT NULL,
	Sexo VARCHAR (1) NOT NULL CHECK (Sexo IN ('F', 'M')),
	Limite MONEY CHECK (limite >=0),
	CodFilial VARCHAR(1),
	CONSTRAINT PK_Clientes PRIMARY KEY (CodCli),
	CONSTRAINT FK_filial FOREIGN KEY (CodFilial) REFERENCES Filial (CodFilial),
)

INSERT INTO Filial VALUES
	('A', 'Centro', '332-2020'),
	('B', 'Shopping', '3333-1010'),
	('C', 'Votorantim', '3243-1515'),
	('D', 'Itu', '9321-8345');

INSERT INTO Clientes VALUES
	('5', 'João', 'F', 500.00, 'A'),
	('28', 'Maria', 'F', 300.00, 'C'),
	('4', 'Pedro', 'M', 700.00, 'A'),
	('32', 'Paulo', 'M', 800.00, 'A'),
	('16', 'Ana', 'F', 900.00, 'C'),
	('15', 'José', 'M', 500.00, 'B'),
	('22', 'Antonio', 'M', 500.00, NULL),
	('19', 'Cláudia', 'F', 900.00, 'B');

SELECT * FROM Clientes
SELECT * FROM Filial

DELETE FROM Filial 
	WHERE CodFilial LIKE 'C';

DELETE FROM Clientes 
	WHERE CodCli LIKE '16';

INSERT INTO CLIENTES VALUES 
(25, 'Roberta', 'F', 'R$ 800,00', 'E')

INSERT INTO Filial VALUES
	('E', 'Salto', '8343-9483')

UPDATE Clientes 
	SET CodFilial = 'B'
	WHERE Nome = 'MARIA';

UPDATE Clientes
	SET Sexo = 'M'
	WHERE CodCli = 5;

UPDATE Filial 
	SET Telefones = '3333-3030'
	WHERE CodFilial = 'B';

UPDATE Clientes
	SET Limite = Limite + 100
	WHERE Nome = 'JOÃO' OR Nome = 'MARIA' OR Nome = 'CLAUDIA' 


