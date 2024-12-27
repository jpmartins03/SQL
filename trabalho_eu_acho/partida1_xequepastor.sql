-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
-- Host: dev_mysql:3306
-- Tempo de geração: 14/09/2024 às 02:32
-- Versão do servidor: 9.0.1
-- Versão do PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Banco de dados: `CHESS`

-- --------------------------------------------------------

-- Inserir dados na tabela `jogador`
INSERT INTO `jogador` (`id`, `nome`) VALUES 
('j1', 'Jogador Branco'),
('j2', 'Jogador Preto');

-- Inserir dados na tabela `partida`
INSERT INTO `partida` (`id`, `stats`, `hor_ini`, `hor_fim`, `vencedor`, `tabuleiro`, `id_brancas`, `id_pretas`) VALUES 
('p1', 1, '000000', '000002', 'j1', 'a1t, b1c, c1b, d1d, e1r, f1b, g1c, h1t / a2p, b2p, c2p, d2p, e2p, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T', 'j1', 'j2');

-- Inserir dados na tabela `movimento` e atualizar o tabuleiro
-- Movimento 1
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'e4', 0, 0, 1, 'p1');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1b, g1c, h1t / a2p, b2p, c2p, d2p, e2p, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p1';

-- Movimento 2
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'e5', 0, 0, 2, 'p1');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1b, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p1';

-- Continue inserindo e atualizando os movimentos e tabuleiros conforme necessário...

-- Último movimento
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(4, 'Qxf7#', 1, 1, 7, 'p1');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1b, g1c, h1t / a2p, b2p, c2p, d2p, e2, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p1';

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
