CREATE TABLE Dados_Escolas (
    ano INT,
    sigla_uf VARCHAR(2),
    id_municipio VARCHAR(10),
    id_escola VARCHAR(10),
    rede VARCHAR(10),
    ensino VARCHAR(15),
    anos_escolares VARCHAR(20),
    taxa_aprovacao NUMBER,
    indicador_rendimento DECIMAL(10, 8),
    nota_saeb_matematica NUMBER,
    nota_saeb_lingua_portuguesa NUMBER,
    nota_saeb_media_padronizada NUMBER,
    ideb NUMBER,
    projecao NUMBER
);

-- consulta simples n�o procedural
-- retornando todas as linhas e todas as colunas
SELECT * FROM Dados_Escolas;

-- retornando todas as linhas sobre algumas colunas (n�o procedural)
SELECT ano, sigla_uf, rede FROM Dados_escolas

-- retornando algumas linhas sobre algumas colunas (procedural)
SELECT ano, sigla_uf, rede
FROM Dados_escolas WHERE ano=2005;

-- op maior
SELECT ano, sigla_uf, rede
FROM Dados_escolas WHERE ano>2005;

-- op menor
SELECT ano, sigla_uf, rede
FROM Dados_escolas WHERE ano<2005;

-- op maior ou igual
SELECT ano, sigla_uf, rede
FROM Dados_escolas WHERE ano>=2005;

-- op menor ou igual
SELECT ano, sigla_uf, rede
FROM Dados_escolas WHERE ano<=2005;

-- op diferente
SELECT ano, sigla_uf, rede
FROM Dados_escolas WHERE ano<>2005;

-- logica and
SELECT ano, sigla_uf, rede
FROM Dados_escolas WHERE ano>=2010 AND ano<=2015;

--logica or
SELECT ano, sigla_uf, rede
FROM Dados_escolas WHERE sigla_uf='SP' OR sigla_uf='SE' OR sigla_uf='PI';

SELECT ano, sigla_uf, rede
FROM Dados_escolas WHERE sigla_uf='SP' AND sigla_uf='SE' AND sigla_uf='PI';

-- l�gica in
SELECT ano, sigla_uf, rede
FROM Dados_escolas WHERE sigla_uf IN('SP','SE','PI');

-- l�gica between
SELECT ano, sigla_uf, rede
FROM Dados_escolas WHERE ano BETWEEN 2010 and 2015;
