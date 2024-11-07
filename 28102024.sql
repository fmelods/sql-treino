DROP TABLE Pedidos;
DROP TABLE Clientes;
DROP TABLE Funcionarios;

-- Cria a tabela "Clientes"
CREATE TABLE Clientes (
    ID NUMBER(5) PRIMARY KEY,
    Nome VARCHAR2(255),
    Cidade VARCHAR2(255),
    Sexo VARCHAR2(1),
    idade int
);

-- Insercao de dados na tabela "Clientes"
 INSERT INTO Clientes VALUES (1, 'Joï¿½o', 'Sao Paulo','M',20);
 INSERT INTO Clientes VALUES (2, 'Maria', 'Rio de Janeiro','F',30);
 INSERT INTO Clientes VALUES (3, 'Carlos', 'Belo Horizonte','M',20);
 INSERT INTO Clientes VALUES (4, 'Ana', 'Sao Paulo','F',25);
 INSERT INTO Clientes VALUES (5, 'Rafael', 'Rio de Janeiro','M',50);

-- Cria a tabela "Pedidos"
CREATE TABLE Pedidos (
    id NUMBER(5) PRIMARY KEY,
    cliente_id NUMBER(5),
    ds_produto VARCHAR2(255),
    vl_pedido Number (6,2),
	FOREIGN KEY (cliente_id) REFERENCES 
		Clientes (id)
);

-- Insercao de dados na tabela "Pedidos"
INSERT INTO Pedidos VALUES(101, 1, 'Celular', 1100.00);
INSERT INTO Pedidos VALUES(102, 2, 'Laptop', 4000.00);
INSERT INTO Pedidos VALUES(103, 3, 'Tablet', 3500.00);
INSERT INTO Pedidos VALUES(104, 1, 'TV', 5000.00);
INSERT INTO Pedidos VALUES(105, 4, 'Geladeira', 3000.00);


CREATE TABLE Funcionarios (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Supervisor_ID INT
);


INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES (1, 'Joao', NULL); 
INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES  (2, 'Maria', 1); 
INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES  (3, 'Carlos', 1); 
INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES  (4, 'Ana', 2);    
INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES  (5, 'Rafael', 2); 






-- SELECT FUNCTIONS E GROUP BY
SELECT * FROM Clientes ORDER BY nome ASC;
SELECT * FROM Clientes ORDER BY nome DESC;

SELECT AVG(idade), COUNT(nome), MIN(idade), MAX(idade), STDDEV(idade), VARIANCE(idade) FROM Clientes;

SELECT nome
FROM Clientes
WHERE id IN(SELECT cliente_id FROM Pedidos WHERE vl_pedido > 3000);

SELECT cliente_id FROM PEDIDOS WHERE vl_pedido>3000;

--exemplo de subconsulta
SELECT nome
FROM Clientes
WHERE id IN(2,3,1);

--também é possível utilizando o join
SELECT nome
FROM Clientes c INNER JOIN Pedidos p ON c.id = p.cliente_id
WHERE p.vl_pedido>3000;

-- exemplo de subconsulta com NOT IN
SELECT nome
FROM Clientes
WHERE id NOT IN(SELECT cliente_id FROM Pedidos WHERE vl_pedido > 3000);

-- exemplo de subconsulta de cliente que tem pedidos
SELECT nome
FROM Clientes
WHERE EXISTS (SELECT 1 FROM
                CLIENTES c INNER JOIN
                Pedidos p ON c.id = p.cliente_id);
                
-- exemplo de subconsulta de cliente que não tem pedidos
SELECT nome
FROM Clientes
WHERE NOT EXISTS (SELECT 1 FROM
                CLIENTES c INNER JOIN
                Pedidos p ON c.id = p.cliente_id);

-- exemplo de subconsulta de clientes que tem uma idade
-- superior aos moradores da cidade de Sao Paulo
SELECT nome
FROM Clientes
WHERE idade > ANY(SELECT idade FROM Clientes
WHERE Cidade = 'Sao Paulo');

-- exemplo de subconsulta de clientes que tem uma idade
--superior a média da idade de moradores na cidade de Sao Paulo
SELECT nome, idade
FROM Clientes
WHERE idade > ANY(SELECT AVG(idade) FROM Clientes
WHERE Cidade = 'Sao Paulo');

-- exemplo de subconsulta com UNION: Clientes que moram em
-- Sao Paulo ou no Rio de Janeiro
SELECT nome FROM Clientes WHERE Cidade = 'Sao Paulo'
UNION
SELECT nome, cidade FROM Clientes WHERE cidade = 'Rio de Janeiro';

SELECT nome, idade
FROM Clientes
WHERE idade > ALL(SELECT idade FROM Clientes
WHERE Cidade = 'Sao Paulo');

-- CRIANDO UMA VIEW DE CLIENTE COM PEDIDOS
CREATE VIEW PEDIDOS_CLIENTES AS
SELECT nome
FROM Clientes c INNER JOIN Pedidos p ON c.id = p.cliente_id;

--CONSULTANDO UMA VIEW
SELECT * FROM PEDIDOS_CLIENTES;

--REMOVENDO UMA VIEW
DROP VIEW PEDIDOS_CLIENTES;