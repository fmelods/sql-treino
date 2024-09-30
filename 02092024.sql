CREATE TABLE T_ALUNO (
ID_ALUNO INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
NM_ALUNO VARCHAR(60),
SX_ALUNO VARCHAR(2),
DT_NASCIMENTO DATE
);

-- GEN�RICO
INSERT INTO T_ALUNO (NM_ALUNO, SX_ALUNO, DT_NASCIMENTO)
VALUES(NULL, 'Felipe', 'M', TO DATE, '01-01-2000', 'DD-MM-YYYY'));

-- ESPEC�FICO (INSERINDO EM ALGUMAS COLUNAS)
INSERT INTO T_ALUNO (NM_ALUNO, SX_ALUNO)
VALUES ('Maria', 'F');

-- CONSULTANDO LINHAS NA TABELA]
SELECT * FROM T_ALUNO;

CREATE TABLE T_TURMA (
ID_TURMA INT PRIMARY KEY,
SIGLA VARCHAR(2),
ST_TURMA VARCHAR(2) CHECK(ST_TURMA='A' OR ST_TURMA='I'),
SEMESTRE VARCHAR(1) NOT NULL
)

DROP TABLE T_TURMA

-- CEN�RIOS DE SUCESSO COM INSERTS
INSERT INTO T_TURMA VALUES(1, 'PW', 'A', '2');

INSERT INTO T_TURMA (ID_TURMA, SEMESTRE) VALUES (2, '2');

-- CEN�RIOS DE ERRO

-- FALHA CONSTRAINT DA UNIQUE (N�O PODE TER VALORES REPETIDOS)
INSERT INTO T_TURMA VALUES (1, 'PW', 'A', '2');

-- FALHA CONSTRAINT DA PRIMARY KEY (N�O PODE TER VALORES REPETIDOS)
INSERT INTO T_TURMA VALUES (1, 'PX', 'A', '2');

-- FALHA NA CONSTRAINT NOT NULL (� OBRIGAT�RIO CITAR AS COLUNAS NOT NULL)
INSERT INTO T_TURMA (ID_TURMA, SIGLA) VALUES (2, 'PS');

-- FALHA NA CONSTRAINT CHECK (� OBRIGAT�RIO CITAR OS VALORES DEFINIDOS)
INSERT INTO T_TURMA VALUES (3, 'PY', '', '2');

SELECT * FROM T_TURMA VALUES (1, 'PX', 'A', '2');