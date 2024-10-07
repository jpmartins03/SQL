-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: dev_mysql:3306
-- Tempo de geração: 14/09/2024 às 22:39
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
-- Banco de dados: `CHESS`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogador`
--

CREATE TABLE `jogador` (
  `id` int NOT NULL,
  `nome` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `jogador`
--

INSERT INTO `jogador` (`id`, `nome`) VALUES
(1, 'Joao'),
(2, 'Lucas'),
(3, 'Anderson'),
(4, 'Diego');

-- --------------------------------------------------------

--
-- Estrutura para tabela `movimento`
--

CREATE TABLE `movimento` (
  `movimento` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `xeque_stats` int NOT NULL,
  `xeque_mate` int NOT NULL,
  `id` int NOT NULL,
  `id_ptd` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `movimento`
--

INSERT INTO `movimento` (`movimento`, `xeque_stats`, `xeque_mate`, `id`, `id_ptd`) VALUES
('e2e4', 0, 0, 1, 1),
('e2e4', 0, 0, 2, 1),
('e7e5', 0, 0, 3, 1),
('f1c4', 0, 0, 4, 1),
('g8f6', 0, 0, 5, 1),
('d1h5', 0, 0, 6, 1),
('f6h5', 0, 0, 7, 1),
('d1f7', 1, 1, 8, 1),
('e2e4', 0, 0, 10, 5),
('e7e5', 0, 0, 11, 5),
('f1c4', 0, 0, 12, 5),
('g8f6', 0, 0, 13, 5),
('d1h5', 0, 0, 14, 5),
('d7d6', 0, 0, 15, 5),
('g1f3', 0, 0, 16, 5),
('f7f5', 0, 0, 17, 5),
('h5f5', 1, 0, 18, 5),
('f6e4', 0, 0, 19, 5),
('f5e5', 0, 1, 20, 5),
('e2e4', 0, 0, 21, 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `partida`
--

CREATE TABLE `partida` (
  `id` int NOT NULL,
  `stats` int NOT NULL,
  `hor_ini` time NOT NULL,
  `hor_fim` time NOT NULL,
  `vencedor` int NOT NULL,
  `tabuleiro` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_brancas` int NOT NULL,
  `id_pretas` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `partida`
--

INSERT INTO `partida` (`id`, `stats`, `hor_ini`, `hor_fim`, `vencedor`, `tabuleiro`, `id_brancas`, `id_pretas`) VALUES
(1, 1, '10:00:00', '10:25:25', 1, 'a1_t, b1_c, c1_b, d1_r, e1_d, f1_b, g1_c, h1_t / \r\na2_p, b2_p, c2_p, d2_p, e2_p, f2_p, g2_p, h2_p / \r\na3_, b3_, c3_, d3_, e3_, f3_, g3_, h3_ / \r\na4_, b4_, c4_, d4_, e4_, f4_, g4_, h4_ / \r\na5_, b5_, c5_, d5_, e5_, f5_, g5_, h5_ / \r\na6_, b6_, c6_, d6_, e6_, f6_, g6_, h6_ / \r\na7_P, b7_P, c7_P, d7_P, e7_P, f7_P, g7_P, h7_P / \r\na8_T, b8_C, c8_B, d8_D, e', 1, 2),
(5, 1, '14:00:00', '14:20:20', 3, 'a1_t, b1_c, c1_b, d1_r, e1_d, f1_b, g1_c, h1_t / \r\na2_p, b2_p, c2_p, d2_p, e2_p, f2_p, g2_p, h2_p / \r\na3_, b3_, c3_, d3_, e3_, f3_, g3_, h3_ / \r\na4_, b4_, c4_, d4_, e4_, f4_, g4_, h4_ / \r\na5_, b5_, c5_, d5_, e5_, f5_, g5_, h5_ / \r\na6_, b6_, c6_, d6_, e6_, f6_, g6_, h6_ / \r\na7_P, b7_P, c7_P, d7_P, e7_P, f7_P, g7_P, h7_P / \r\na8_T, b8_C, c8_B, d8_D, e', 1, 2),
(6, 0, '16:00:00', '16:00:10', 0, 'a1_t, b1_c, c1_b, d1_r, e1_d, f1_b, g1_c, h1_t / \r\na2_p, b2_p, c2_p, d2_p, e2_, f2_p, g2_p, h2_p / \r\na3_, b3_, c3_, d3_, e3_, f3_, g3_, h3_ / \r\na4_, b4_, c4_, d4_, e4_, f4_, g4_, h4_ / \r\na5_, b5_, c5_, d5_, e5_, f5_, g5_, h5_ / \r\na6_, b6_, c6_, d6_, e6_, f6_, g6_, h6_ / \r\na7_P, b7_P, c7_P, d7_P, e7_P, f7_P, g7_P, h7_P / \r\na8_T, b8_C, c8_B, d8_D, e8', 2, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `peca`
--

CREATE TABLE `peca` (
  `id` int NOT NULL,
  `posi_ini` varchar(3) NOT NULL,
  `tipo` varchar(3) NOT NULL,
  `cor` varchar(3) NOT NULL,
  `id_mov` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `peca`
--

INSERT INTO `peca` (`id`, `posi_ini`, `tipo`, `cor`, `id_mov`) VALUES
(17, 'a1', 't', 'b', 1),
(18, 'b1', 'c', 'b', 1),
(19, 'c1', 'b', 'b', 1),
(20, 'd1', 'r', 'b', 1),
(21, 'e1', 'd', 'b', 1),
(22, 'f1', 'b', 'b', 1),
(23, 'g1', 'c', 'b', 1),
(24, 'h1', 't', 'b', 1),
(25, 'a2', 'p', 'b', 1),
(26, 'b2', 'p', 'b', 1),
(27, 'c2', 'p', 'b', 1),
(28, 'd2', 'p', 'b', 1),
(29, 'e2', 'p', 'b', 1),
(30, 'f2', 'p', 'b', 1),
(31, 'g2', 'p', 'b', 1),
(32, 'h2', 'p', 'b', 1),
(33, 'a8', 'T', 'p', 1),
(34, 'b8', 'C', 'p', 1),
(35, 'c8', 'B', 'p', 1),
(36, 'd8', 'D', 'p', 1),
(37, 'e8', 'R', 'p', 1),
(38, 'f8', 'B', 'p', 1),
(39, 'g8', 'C', 'p', 1),
(40, 'h8', 'T', 'p', 1),
(41, 'a7', 'P', 'p', 1),
(42, 'b7', 'P', 'p', 1),
(43, 'c7', 'P', 'p', 1),
(44, 'd7', 'P', 'p', 1),
(45, 'e7', 'P', 'p', 1),
(46, 'f7', 'P', 'p', 1),
(47, 'g7', 'P', 'p', 1),
(48, 'h7', 'P', 'p', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `jogador`
--
ALTER TABLE `jogador`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `movimento`
--
ALTER TABLE `movimento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ptd` (`id_ptd`);

--
-- Índices de tabela `partida`
--
ALTER TABLE `partida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_brancas` (`id_brancas`),
  ADD KEY `id_pretas` (`id_pretas`);

--
-- Índices de tabela `peca`
--
ALTER TABLE `peca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mov` (`id_mov`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `jogador`
--
ALTER TABLE `jogador`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `movimento`
--
ALTER TABLE `movimento`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `partida`
--
ALTER TABLE `partida`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `peca`
--
ALTER TABLE `peca`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `movimento`
--
ALTER TABLE `movimento`
  ADD CONSTRAINT `movimento_ibfk_1` FOREIGN KEY (`id_ptd`) REFERENCES `partida` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `partida`
--
ALTER TABLE `partida`
  ADD CONSTRAINT `partida_ibfk_1` FOREIGN KEY (`id_brancas`) REFERENCES `jogador` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `partida_ibfk_2` FOREIGN KEY (`id_pretas`) REFERENCES `jogador` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `peca`
--
ALTER TABLE `peca`
  ADD CONSTRAINT `peca_ibfk_1` FOREIGN KEY (`id_mov`) REFERENCES `movimento` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
