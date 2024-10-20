SELECT * FROM dados_escolas;

-- asc: ascendente
SELECT * FROM dados_escolas ORDER BY ano ASC;

-- desc: descendente
SELECT * FROM dados_ESCOLAS ORDER BY ano DESC;

-- asc: ascendente (a-z)
SELECT * FROM dados_escolas ORDER BY sigla_uf ASC;

-- desc: descendente (z-a)
SELECT * FROM dados_escolas ORDER BY sigla_uf DESC;

SELECT ano FROM dados_escolas
GROUP BY ano ORDER BY ano DESC;

SELECT sigla_uf FROM dados_escolas
GROUP BY sigla_uf ORDER BY sigla_uf ASC;

-- somar valores de todas as linhas
SELECT SUM(taxa_aprovacao)
FROM dados_escolas;

-- valor mínimo entre as linhas
SELECT MIN(taxa_aprovacao)
FROM dados_escolas;

-- valor máximo entre as linhas
SELECT MAX(taxa_aprovacao)
FROM dados_escolas;

-- valor médio entre as linhas
SELECT AVG(taxa_aprovacao)
FROM dados_escolas;

-- desvio padrão entre as linhas
SELECT STDDEV(taxa_aprovacao)
FROM dados_escolas;

-- select com exemplo de apelido
SELECT sigla_uf, MIN(taxa_aprovacao) m
FROM dados_escolas
GROUP BY sigla_uf
ORDER BY m asc;

SELECT sigla_uf, MAX(taxa_aprovacao) m
FROM dados_escolas
GROUP BY sigla_uf
ORDER BY m asc;

-- quantidade de linhas 
SELECT COUNT(taxa_aprovacao)
FROM dados_escolas;

SELECT sigla_uf, COUNT(taxa_aprovacao) m
FROM dados_escolas
GROUP BY sigla_uf
ORDER BY m asc;

SELECT sigla_uf, AVG(taxa_aprovacao) m
FROM dados_escolas
GROUP BY sigla_uf
ORDER BY m asc;

-- os estados que tem a melhor media
-- e exiba apenas aqueles que tiverem uma nota >= 90
SELECT sigla_uf, AVG(taxa_aprovacao) m
FROM dados_escolas
GROUP BY sigla_uf
HAVING AVG(taxa_aprovacao)>=90
ORDER BY m asc

-- os estados que tem a melhor media
-- onde, apenas os estados que tem a nota >= 90 participam da média
-- e exiba apenas aqueles que tiverem uma nota >= 90
SELECT sigla_uf,
AVG(taxa_aprovacao) m
FROM dados_escolas
WHERE ano>=90
GROUP BY sigla_uf
HAVING AVG(taxa_aprovacao)>=90
ORDER BY m ASC;

-- os estados que tem a melhor media
-- No ano >= 2011 participam da média
-- e exiba apenas aqueles que tiverem uma nota >= 90
SELECT sigla_uf,
AVG(taxa_aprovacao) m
FROM dados_escolas
WHERE ano>=2011
GROUP BY sigla_uf
HAVING AVG(taxa_aprovacao)>=90
ORDER BY m ASC;

-- os estados que tem a melhor media
-- No ano de 2011 participam da média
-- e exiba apenas aqueles que tiverem uma nota >= 90
SELECT sigla_uf,
AVG(taxa_aprovacao) m
FROM dados_escolas
WHERE ano=2011
GROUP BY sigla_uf
ORDER BY m ASC;

-- criando view
CREATE VIEW media_estado AS
SELECT sigla_uf, AVG(taxa_aprovacao) m
FROM dados_escolas
GROUP BY sigla_uf
ORDER BY m ASC;

SELECT * FROM media_estado;
DROP VIEW media_estado;