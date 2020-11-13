/* Danubia N da Silva RA 0030481913007
	Valquiria Pires RA:0030481913033
*/

/*BANCO DE DADOS UTILIZADO: MYSQL*/

CREATE DATABASE BD_Motorista

USE BD_Motorista

SET DATEFORMAT dmy

CREATE TABLE Motorista (
	cartHab numeric(6) NOT NULL,
	nomeMot varchar(30),
	dataNasc date,
	dataEmissao date,
	endereco varchar(30),
	tipo_habilitacao varchar(1),
	situacao varchar(15),
	CONSTRAINT pk_motorista PRIMARY KEY (cartHab)
)

CREATE TABLE Veiculo (
	placaVeic varchar(7) NOT NULL,
	Modelo varchar(25),
	marca varchar(10),
	ano numeric,
	cor varchar(15),
	CONSTRAINT pk_veiculo PRIMARY KEY (placaVeic)
)

CREATE TABLE Multa (
	codMulta numeric(5) NOT NULL,
	cartHab numeric(6) NOT NULL,
	placaVeic varchar(7) NOT NULL,
	dataMulta date,
	tipoMulta varchar(15),
	valorMulta numeric(6, 2),
	pontosMulta numeric(3),
	CONSTRAINT pk_multa PRIMARY KEY (codMulta),
	CONSTRAINT fk_motorista FOREIGN KEY (cartHab) REFERENCES Motorista (cartHab),
	CONSTRAINT fk_veiculo FOREIGN KEY (placaVeic) REFERENCES Veiculo (placaVeic)
)

INSERT INTO Motorista VALUES (
	123456,'Cirino da Silva','10/05/1991','01/02/2016','Rua Manoel Fonseca','A','A'), (
	123457,'Romão da Motta','10/05/1977','01/02/1995','Rua 7 de setembro','A','A'), (
	123458,'Mariano Siqueira','10/05/1981','01/02/2000','Rua 15 de novembro','C','A'), (
	123459,'José Gustavo Almeida','10/05/1975','01/02/2016','Rua 15 de agosto','C','A'), (
	123450,'Fabiana Platina','10/05/1988','01/02/2004','Rua9 de julho','C','A'), (
	123451,'Jair Rodrigues','10/05/1988','01/02/2004','Rua 16 de agosto','C','A')

INSERT INTO Veiculo VALUES (
	'CPD1234','Prisma','Chevrolet',2009,'prata'), (
	'TII1234','Prisma','Chevrolet',2009,'preto'), (
	'CPD1235','Fusca','Wolksvagen',1988,'amarelo'), (
	'CPD1236','Logan','Renault',2016,'cinza'), (
	'ABC1234','Gol','Wolksvagen',2015,'vermelho'), (
	'ZZZ1234','Gol','Wolksvagen',2016,'azul'), (
	'ZZZ1235','Voyage','Wolksvagen',2000,'cinza'), (
	'TOI0000','Celta','Chevrolet',2001,'branco'), (
	'CAT1234','Prisma','Chevrolet',2010,'branco'), (
	'ZUM1234','Prisma','Chevrolet',2009,'branco')

INSERT INTO Multa VALUES (
	1,123456,'CPD1234','10/01/2016','grave',700,4), (
	2,123456,'CPD1234','31/01/2016','média',300,3), (
	3,123457,'TII1234','10/02/2016','gravíssima',1200,7), (
	4,123457,'TII1234','10/02/2016','grave',700,4), (
	5,123457,'CPD1235','10/02/2016','grave',700,4), (
	6,123458,'CPD1235','10/03/2016','grave',700,4), (
	7,123458,'CPD1234','10/03/2016','grave',700,4), (
	8,123459,'CPD1234','10/03/2016','gravíssima',1200,7), (
	9,123459,'CPD1234','10/04/2016','grave',700,4), (
	10,123459,'CPD1234','10/01/2015','grave',700,4), (
	11,123459,'CPD1234','10/01/2015','gravíssima',1200,7), (
	12,123459,'TII1234','10/01/2015','grave',700,4), (
	13,123459,'CPD1234','10/01/2014','gravíssima',1200,7), (
	14,123459,'TII1234','10/01/2014','grave',700,4), (
	15,123450,'TOI0000','10/01/2014','grave',700,4), (
	16,123450,'TOI0000','10/01/2014','gravíssima',1200,7), (
	17,123450,'TOI0000','10/01/2014','grave',700,4), (
	18,123450,'ZZZ1234','10/01/2014','grave',700,4), (
	19,123450,'ZZZ1234','10/01/2014','leve',200,1), (
	20,123450,'ZZZ1234','10/01/2014','leve',200,1), (
	21,123450,'ABC1234','10/01/2014','leve',200,1), (
	22,123450,'CAT1234','10/01/2014','leve',200,1), (
	23,123450,'CAT1234','10/01/2015','leve',200,1), (
	24,123450,'CAT1234','10/01/2015','grave',700,4)

/*Exercicio 1*/
 
 SELECT t0.codMulta, T1.nomeMot, t0.dataMulta, t2.Modelo, t2.marca
 from Multa T0
 inner join Motorista T1
 on t0.cartHab = t1.cartHab
 inner join Veiculo T2
 on t0.placaVeic = T2.placaVeic
 where valorMulta > 100 and valorMulta < 900

 /*Exercicio 2*/
 SELECT T0.nomeMot, sum(T1.valorMulta)
 FROM Motorista T0
 INNER JOIN Multa T1
 ON T0.cartHab = T1.cartHab
 group by nomeMot

 /*Exercicio 3*/
SELECT T0.nomeMot
FROM Motorista T0
 INNER JOIN Multa T1
 ON T0.cartHab = T1.cartHab
 GROUP BY T0.nomeMot HAVING COUNT(pontosMulta) <3

 /*Exercicio 4 - No lugar do minus, foi usado o EXCEPT que tem a mesma função no MYSQL*/
SELECT cartHab, nomeMot
FROM Motorista
EXCEPT
SELECT cartHab, tipoMulta
FROM Multa
WHERE tipoMulta = 'gravíssima'

 /*Exercicio 5*/
 SELECT T0.nomeMot, sum(T1.pontosMulta) as 'totalPontos'
 FROM Motorista T0
 INNER JOIN Multa T1
 ON T0.cartHab = T1.cartHab
 GROUP BY nomeMot

 /*Exercicio 6*/
SELECT t0.placaVeic, T0.modelo
FROM Veiculo T0
LEFT JOIN Multa T1 ON T0.placaVeic = T1.placaVeic
WHERE T1.codMulta IS NULL