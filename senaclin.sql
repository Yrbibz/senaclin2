senaclin/*mostrar banco de dados*/
SHOW DATABASES
/*selecionar banco de dado*/
USE senaclin
/*mostrar tabelas*/
SHOW TABLES
/*criar banco de dados*/
CREATE DATABASE senaclin
 
DROP TABLE medico
 
/*Criar tabelas*/
CREATE TABLE Medico (
idmedico INT NOT NULL PRIMARY KEY auto_increment,
nomemedico VARCHAR(50)NOT NULL, 
loginmedico VARCHAR(50)NOT NULL, 
senha CHAR(8)NOT NULL, 
crma CHAR(8) NOT NULL  
);
 
SHOW TABLEs /*mostrar as tabelas*/
 
/*DROP TABLE medico - apaga a tabela*/
 
CREATE TABLE recepcionista (
idrecepcionista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomerecepcionista VARCHAR (50) NOT NULL,
loginrecepcionista VARCHAR (50) NOT NULL,
senha CHAR (8) NOT NULL,
celular CHAR (11) NOT NULL,
nomeLogradouro VARCHAR (50) NOT NULL,
numero VARCHAR (7) NOT NULL,
complemento VARCHAR (30) NOT NULL,
cidade VARCHAR (30) NOT NULL,
cep CHAR (8) NOT NULL,
estado CHAR (2) NOT NULL 
);
 
CREATE TABLE paciente(
idpaciente  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomepaciente VARCHAR(50) NOT NULL,
datadenascimento DATETIME NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
email VARCHAR(50) NULL DEFAULT 'Não inoformado', 
tiposanguino VARCHAR(3) NOT NULL,
doencaspreexistentes VARCHAR(255) NOT NULL,
CONSTRAINT chk_tiposanguino CHECK (tiposanguino='A+' OR tiposanguino='A-' OR tiposanguino='AB+' OR tiposanguino='AB-' OR tiposanguino='B+' OR tiposanguino='B-' OR tiposanguino='O-' or tiposanguino='O+')
);
 
 
CREATE TABLE consulta(
idConsulta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idpaciente INT NOT NULL,
idmedico INT NOT NULL,
idrecepcionista INT NOT NULL,
dataHoraConsulta DATETIME NOT NULL,
tipoConsulta SMALLINT DEFAULT 0,
observacoes VARCHAR(255) NOT NULL,
valor DECIMAL(7,2),
CONSTRAINT fk_ConsultaPaciente FOREIGN KEY(idpaciente)
REFERENCES paciente(idpaciente),
CONSTRAINT fk_ConsultaMedico FOREIGN KEY(idmedico)
REFERENCES medico(idmedico),
CONSTRAINT fk_ConsultaRecepcionista FOREIGN KEY(idrecepcionista)
REFERENCES recepcionista(idrecepcionista)
);
 
 
/*inserir o recheio de dados*/
 
INSERT INTO medico (nomemedico, loginmedico, senha, crma)
VALUES('Dr. Olavo','olavodoctor@gamil.com','12345678','222333SP');
 
 
/*inserino mais um medico*/
INSERT INTO medico (nomemedico, loginmedico, senha, crma)
VALUES('Dra. Rosana','rosana@gamil.com','12345678','666333MG');
INSERT INTO medico (nomemedico, loginmedico, senha, crma)
VALUES('Dr. Heitor','heitor@gamil.com','12345678','555333SP');
INSERT INTO medico (nomemedico, loginmedico, senha, crma)
VALUES('Dr. House','hause@gamil.com','12345678','555338SP');

INSERT INTO medico (nomemedico, loginmedico, crma)
VALUES('Dr. Housee','hausee@gamil.com','555338SP');

 
/*inserindo mas mais fácil ainda*/
INSERT INTO medico (nomemedico, loginmedico, senha, crma)
VALUES
('Dr. Ricardo','ricardo@gamil.com','12345678','777222MG'),
('Dra. gabriela','gabriela@gamil.com','12345678','555111RJ');
 
/*Implicito*/
INSERT INTO medico
VALUES (6, 'Dr. Ana Paula','anapaula@gamil.com','11223344','121111SP');
 
 /*excluir registros*/
 DELETE FROM medico 
 WHERE idMedico = 7
 
/*buscar*/
SELECT * FROM medico
SELECT nomemedico, crma FROM medico

/*buscar com filtro*/   -   /*idmedico pra confirmar q a linha ta certa*/
SELECT * FROM medico
WHERE idmedico = 6
 
SELECT idmedico, nomemedico, crma FROM medico
WHERE idmedico >=2 AND idmedico <=5

SELECT idmedico, nomemedico, crma FROM medico
WHERE idmedico BETWEEN 2 AND 5
 
 
SELECT * FROM medico
WHERE crma LIKE '%Rj'

SELECT nomemedico, crma, loginmedico FROM medico 
WHERE nomemedico LIKE 'Dra. An%'

 
/*atualizar dados*/
UPDATE medico
SET senha='87654321',
loginmedico='olavodoctor@hotmail.com'
WHERE idmedico=1

UPDATE medico
SET senha='40028922',
loginmedico='housemanezao@hotmail.com'
WHERE idmedico=8

UPDATE medico
SET nomemedico='Dra. Ana Paula'
WHERE idmedico=6

/*ordenando resultados de uma consulta*/
SELECT * FROM medico
ORDER BY nomemedico DESC

/*--------------------------------------------------------------------------*/

INSERT INTO recepcionista (nomerecepcionista, loginrecepcionista, senha, celular, nomeLogradouro, numero, complemento, cidade, cep, estado)
VALUES
('Raquele','rack@gmail.com','12345678','40028922','Conselheiro Nebias', '223', 'apto 145', 'Santos', '11040230', 'SP'),
('João Henrique','hauntered@gmail.com','12345678','991421942', 'Alexandre Martins', '666', 'apto 3', 'Santos', '11654896', 'SP');
INSERT INTO recepcionista (nomerecepcionista, loginrecepcionista, senha, celular, nomeLogradouro, numero, cidade, cep, estado)
VALUES
('Paralinda','sadspace@gmail.com','40028922','40028922','Vergueiro Steidel', '526', 'Santos', '11080230', 'SP');

SELECT * FROM recepcionista


INSERT INTO paciente (nomepaciente, email, cpf, datadenascimento, tiposanguino, doencaspreexistentes)
VALUES
('Maui','semideus@gmail.com', '12345678910', '1941-12-06 18:59', 'A+', 'Anemia');

insert INTO paciente (nomepaciente, email, cpf, datadenascimento, tiposanguino)
VALUES
('Pedro', 'pedrin@gmail.com', '78945612358', '1666-06-06 16:06', 'AB+'),
('Arley', 'arwhey@gmail.com', '98765432158', '1986-05-27 15:47', 'O-');

SELECT * FROM paciente
/*-------------------------------------------------------------------------*/

/* inserindo consulta */
INSERT INTO consulta (idmedico, idpaciente, idrecepcionista, datahoraconsulta, tipoconsulta)
VALUES 
(2,2,2, '2024-06-24 18:30',0);

INSERT INTO consulta (idmedico, idpaciente, idrecepcionista, datahoraconsulta, tipoconsulta)
VALUES 
(1,3,3, '2024-06-26 15:30',0);

DELETE  FROM paciente /*exclusão fisica*/
WHERE idpaciente = 3

UPDATE paciente /*exclusão logica*/
SET STATUS = 0
WHERE idpaciente = algumacoisa

SELECT * FROM consulta

/*------------------------------------------------------------------------------*/
/*conta coisa*/
SELECT COUNT(idmedico) AS 'Quantidade de medicos' 
FROM medico
/*pega o valor maximo*/
SELECT MAX(dataHoraConsulta) FROM consulta
/*pega o valor minimo*/
SELECT MIN(dataHoraConsulta) FROM consulta
/*soma*/
SELECT SUM(idrecepcionista) FROM recepcionista
/*faz a media */
SELECT AVG(idpaciente) FROM paciente

SELECT COUNT(idmedico) AS 'Quantidade de medicos - MG' 
FROM medico
WHERE crma LIKE '%MG'

SELECT * FROM recepcionista

INSERT INTO paciente (nomepaciente, cpf, datadenascimento, tiposanguino)
VALUES 
('Magali', '55566677788', '2001-07-07 06:55', 'O+'),
('Mônica', '99966677788', '2002-10-02 13:22', 'O+'),
('Cascão', '99966611188', '2002-12-02 11:21', 'B-'),
('Penadinho', '22266677788', '1997-08-01 12:22', 'O-');


SELECT tiposanguino AS 'Tipos Sangnuineos',
    COUNT(idpaciente) AS 'Total pacientes'
    FROM paciente
GROUP BY tiposanguino  


SELECT tiposanguino AS 'Tipos Sangnuineos',
    COUNT(idpaciente) AS 'Total pacientes'
    FROM paciente
WHERE tiposanguino LIKE 'O%'
GROUP BY tiposanguino


SELECT tiposanguino AS 'Tipos Sangnuineos',
    COUNT(idpaciente) AS 'Total pacientes'
    FROM paciente
GROUP BY tiposanguino 
ORDER BY COUNT(idpaciente)  DESC 

 SELECT tiposanguino AS 'Tipos Sangnuineos',
    COUNT(idpaciente) AS 'Total pacientes'
    FROM paciente
GROUP BY tiposanguino 
HAVING COUNT(idpaciente) >=2
ORDER BY COUNT(idpaciente)  DESC 


/*join*/
/*traga o nome do medico, crm e a data da consulta marcada para ele levando em conta todos os medicos q possuem consulta*/
    SELECT nomemedico, crma, datahoraconsulta FROM medico
    INNER JOIN consulta 
    ON medico.idmedico = consulta.idmedico
	 
	 
	 SELECT nomemedico, nomepaciente, crma, datahoraconsulta FROM medico
    INNER JOIN consulta 
    ON medico.idmedico = consulta.idmedico 
    INNER JOIN paciente 
    ON  consulta.idpaciente = paciente.idpaciente
    
   SELECT nomemedico, crma, datahoraconsulta FROM medico
    LEFT  JOIN consulta 
    ON medico.idmedico = consulta.idmedico 
    
   SELECT nomemedico, crma, datahoraconsulta FROM medico
    INNER  JOIN consulta 
    ON medico.idmedico = consulta.idmedico 
    
    
    /* A - Criar uma query que traga o nome do recepcionista, o celular
dele, e a data da consulta que ele marcou */
    SELECT nomerecepcionista, celular, datahoraconsulta FROM recepcionista
    INNER JOIN consulta
    ON recepcionista.idrecepcionista = consulta.idrecepcionista
    
    SELECT * FROM paciente
    
    
   /*B - Criar uma query que traga o nome do paciente, seu documento,
o nome do médico, o crm, a data da consulta e o recepcionista 
que a marcou */
 
    SELECT nomemedico, crma, datahoraconsulta, nomepaciente, cpf, nomerecepcionista FROM medico
    INNER JOIN consulta 
    ON medico.idmedico = consulta.idmedico 
    INNER JOIN paciente 
    ON  consulta.idpaciente = paciente.idpaciente
   INNER JOIN recepcionista
    ON  consulta.idrecepcionista = recepcionista.idrecepcionista
    
  /*C - Criar uma query que traga quantas consultas existem 
na clínica */  