CREATE TABLE `aluno` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `dt_nascimento` date DEFAULT NULL,
  `st_aluno` tinyint(1) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
