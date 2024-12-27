-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: dev_mysql:3306
-- Tempo de geração: 11/09/2024 às 02:11
-- Versão do servidor: 9.0.1
-- Versão do PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ELEICAO`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `CANDIDATO`
--

CREATE TABLE `CANDIDATO` (
  `num` int NOT NULL,
  `nome` varchar(256) NOT NULL,
  `votos` int NOT NULL,
  `FK_num_partido` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `CANDIDATO`
--

INSERT INTO `CANDIDATO` (`num`, `nome`, `votos`, `FK_num_partido`) VALUES
(101, 'Candidato A', 0, 1),
(102, 'Candidato B', 0, 2),
(103, 'Candidato C', 0, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ELEITOR`
--

CREATE TABLE `ELEITOR` (
  `titulo` varchar(256) NOT NULL,
  `RG` varchar(9) NOT NULL,
  `data_nasc` int NOT NULL,
  `nome` int NOT NULL,
  `FK_num_secao` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `ELEITOR`
--

INSERT INTO `ELEITOR` (`titulo`, `RG`, `data_nasc`, `nome`, `FK_num_secao`) VALUES
('123456789', '987654321', 19900101, 0, 1),
('223456789', '187654321', 19850101, 0, 2),
('323456789', '287654321', 19750101, 0, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `PARTIDO`
--

CREATE TABLE `PARTIDO` (
  `num` int NOT NULL,
  `nome_partido` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `PARTIDO`
--

INSERT INTO `PARTIDO` (`num`, `nome_partido`) VALUES
(1, 'Partido A'),
(2, 'Partido B'),
(3, 'Partido C');

-- --------------------------------------------------------

--
-- Estrutura para tabela `SECAO`
--

CREATE TABLE `SECAO` (
  `num` int NOT NULL,
  `local` varchar(256) NOT NULL,
  `FK_num_zona` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `SECAO`
--

INSERT INTO `SECAO` (`num`, `local`, `FK_num_zona`) VALUES
(1, 'Local A', 1),
(2, 'Local B', 2),
(3, 'Local C', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `VOTO`
--

CREATE TABLE `VOTO` (
  `id` varchar(256) NOT NULL,
  `candidato` varchar(256) NOT NULL,
  `FK_num_secao` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `VOTO`
--

INSERT INTO `VOTO` (`id`, `candidato`, `FK_num_secao`) VALUES
('voto_001', 'Candidato A', 1),
('voto_002', 'Candidato B', 2),
('voto_003', 'Candidato C', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ZONA_ELEITORAL`
--

CREATE TABLE `ZONA_ELEITORAL` (
  `num_zona` int NOT NULL,
  `nome` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `ZONA_ELEITORAL`
--

INSERT INTO `ZONA_ELEITORAL` (`num_zona`, `nome`) VALUES
(1, 'Zona 1'),
(2, 'Zona 2'),
(3, 'Zona 3');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `CANDIDATO`
--
ALTER TABLE `CANDIDATO`
  ADD PRIMARY KEY (`num`),
  ADD KEY `FK_num_partido` (`FK_num_partido`);

--
-- Índices de tabela `ELEITOR`
--
ALTER TABLE `ELEITOR`
  ADD PRIMARY KEY (`titulo`,`RG`),
  ADD KEY `FK_num_secao` (`FK_num_secao`);

--
-- Índices de tabela `PARTIDO`
--
ALTER TABLE `PARTIDO`
  ADD PRIMARY KEY (`num`);

--
-- Índices de tabela `SECAO`
--
ALTER TABLE `SECAO`
  ADD PRIMARY KEY (`num`),
  ADD KEY `SECAO_ibfk_1` (`FK_num_zona`);

--
-- Índices de tabela `VOTO`
--
ALTER TABLE `VOTO`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_num_secao` (`FK_num_secao`);

--
-- Índices de tabela `ZONA_ELEITORAL`
--
ALTER TABLE `ZONA_ELEITORAL`
  ADD PRIMARY KEY (`num_zona`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `CANDIDATO`
--
ALTER TABLE `CANDIDATO`
  ADD CONSTRAINT `CANDIDATO_ibfk_1` FOREIGN KEY (`FK_num_partido`) REFERENCES `PARTIDO` (`num`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `ELEITOR`
--
ALTER TABLE `ELEITOR`
  ADD CONSTRAINT `ELEITOR_ibfk_1` FOREIGN KEY (`FK_num_secao`) REFERENCES `SECAO` (`num`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `SECAO`
--
ALTER TABLE `SECAO`
  ADD CONSTRAINT `SECAO_ibfk_1` FOREIGN KEY (`FK_num_zona`) REFERENCES `ZONA_ELEITORAL` (`num_zona`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `VOTO`
--
ALTER TABLE `VOTO`
  ADD CONSTRAINT `VOTO_ibfk_1` FOREIGN KEY (`FK_num_secao`) REFERENCES `SECAO` (`num`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
