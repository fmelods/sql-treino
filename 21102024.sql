CREATE TABLE Tipos (
    TipoID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Pokemons (
    PokemonID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    TipoID INT,
    HP INT,
    Ataque INT,
    Defesa INT,
    FOREIGN KEY (TipoID) REFERENCES Tipos(TipoID)
);


INSERT INTO Tipos (TipoID, Nome) VALUES (1, 'Fogo');
INSERT INTO Tipos (TipoID, Nome) VALUES (2, 'Ã?gua');
INSERT INTO Tipos (TipoID, Nome) VALUES (3, 'Grama');
INSERT INTO Tipos (TipoID, Nome) VALUES (4, 'ElÃ©trico');
INSERT INTO Tipos (TipoID, Nome) VALUES (5, 'PsÃ­quico');
INSERT INTO Tipos (TipoID, Nome) VALUES (6, 'Voador');
INSERT INTO Tipos (TipoID, Nome) VALUES (7, 'Gelo');

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (1, 'Charmander', 1, 39, 52, 43);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (2, 'Squirtle', 2, 44, 48, 65);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (3, 'Bulbasaur', 3, 45, 49, 49);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (4, 'Pikachu', 4, 35, 55, 40);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (5, 'Jigglypuff', 5, 115, 45, 20);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (6, 'Vulpix', 1, 38, 41, 40);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (7, 'Missingno', NULL, 38, 41, 40);

SELECT * FROM Pokemons;
SELECT * FROM Tipos; 

-- INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
-- VALUES (8, 'Psyduck', 2, 50, 52, 48);

-- INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
-- VALUES (9, 'Oddish', 3, 45, 50, 55);

-- INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
-- VALUES (10, 'Magnemite', 4, 25, 35, 70);

-- INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
-- VALUES (11, 'Abra', 5, 25, 20, 15);

-- INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
-- VALUES (12, 'Pidgey', 6, 40, 45, 40);

-- INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
-- VALUES (13, 'Growlithe', 1, 55, 70, 45);

-- INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
-- VALUES (14, 'Horsea', 2, 30, 40, 70);

-- INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
-- VALUES (15, 'Bellsprout', 3, 50, 75, 35);

-- INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
-- VALUES (16, 'Voltorb', 4, 40, 30, 50);

-- INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
-- VALUES (17, 'Drowzee', 5, 60, 48, 45);

-- INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
-- VALUES (18, 'Spearow', 6, 40, 60, 30);

SELECT * FROM Pokemons;

-- ALIAS é utilizado para definir apelidos (ou sinônimos)
-- apelidos na coluna e na tabela
-- 

SELECT nome
FROM POKEMONS, TIPOS;

-- ORDEM DE CITAÇÃO
-- NOME_TABELA.NOME_COLUNA

SELECT Pokemons.nome
FROM Pokemons, tipos;

-- apelido na tabela
SELECT P.nome, T.nome
FROM Pokemons P, tipos T;

-- apelido na coluna
SELECT P.nome nome_pokemon, T.nome tipo
FROM Pokemons P, tipos T
WHERE p.pokemonid = t.tipoid;

-- inner join
SELECT P.nome nome_pokemon, T.nome tipos
FROM Pokemons p
INNER JOIN tipos T ON p.tipoid = t.tipoid;

-- left join
SELECT P.nome nome_pokemon, T.nome tipos
FROM Pokemons p
LEFT JOIN tipos T ON p.tipoid = t.tipoid;

-- right join
SELECT P.nome nome_pokemon, T.nome tipos
FROM Pokemons p
RIGHT JOIN tipos T ON p.tipoid = t.tipoid;

-- LEFT JOIN EXCLUDE
SELECT P.nome nome_pokemon, T.nome tipos
FROM Pokemons p
LEFT JOIN tipos T ON p.tipoid = t.tipoid
WHERE t.tipoid is null;

-- RIGHT JOIN EXCLUDE
SELECT P.nome nome_pokemon, T.nome tipos
FROM Pokemons p
RIGHT JOIN tipos T ON p.tipoid = t.tipoid
WHERE p.tipoid is null;

-- FULL JOIN
SELECT P.nome nome_pokemon, T.nome tipos
FROM Pokemons p
FULL JOIN tipos T ON p.tipoid = t.tipoid;

-- OUTRA FORMA DE FAZER O FULL JOIN => COM UNION
SELECT P.nome nome_pokemon, T.nome tipos
FROM Pokemons p
LEFT JOIN tipos T ON p.tipoid = t.tipoid
UNION
SELECT P.nome nome_pokemon, T.nome tipos
FROM Pokemons p
RIGHT JOIN tipos T ON p.tipoid = t.tipoid;

-- FULL OUTER JOIN COM UNION
SELECT P.nome nome_pokemon, T.nome tipos
FROM Pokemons p
LEFT JOIN tipos T ON p.tipoid = t.tipoid
WHERE t.tipoid is null
UNION
SELECT P.nome nome_pokemon, T.nome tipos
FROM Pokemons p
RIGHT JOIN tipos T ON p.tipoid = t.tipoid
WHERE p.tipoid is null;

-- OBS: O UNION ALL DEIXA AS DUPLICATAS

-- exercício
SELECT p.PokemonID, p.Nome, t.Nome, p.HP, p.Ataque, p.Defesa
FROM Pokemons p, Tipos t
WHERE p.TipoID = t.TipoID
