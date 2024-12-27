-- Inserir dados na tabela `partida`
INSERT INTO `partida` (`id`, `stats`, `hor_ini`, `hor_fim`, `vencedor`, `tabuleiro`, `id_brancas`, `id_pretas`) VALUES 
('p2', 1, '000000', '000020', 'j1', 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2p, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6p, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T', 'j1', 'j2');

-- Inserir dados na tabela `movimento` e atualizar o tabuleiro

-- Movimento 1
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'e4', 0, 0, 1, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2p, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 2
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'e5', 0, 0, 2, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 3
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'Nf3', 0, 0, 3, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 4
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'Nc6', 0, 0, 4, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 5
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'Bb5', 0, 0, 5, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 6
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'a6', 0, 0, 6, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6p, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 7
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'Be7', 0, 0, 7, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6p, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 8
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'b5', 0, 0, 8, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6p, b6p, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 9
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'O-O', 0, 0, 9, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6p, b6p, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 10
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'bxa6', 0, 0, 10, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6P, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 11
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'dxc6', 0, 0, 11, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6P, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 12
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'dxc6', 0, 0, 12, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6P, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 13
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'dxe7+', 0, 0, 13, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 14
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'Nf5', 0, 0, 14, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 15
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'Rxf5', 0, 0, 15, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 16
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'O-O-O', 0, 0, 16, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 17
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'Rxa6', 0, 0, 17, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 18
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'Qf3', 0, 0, 18, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 19
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'f6', 0, 0, 19, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 20
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'Qh3+', 0, 0, 20, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 21
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'Kf8', 0, 0, 21, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 22
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'Rxf6+', 0, 0, 22, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 23
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'gxh6', 0, 0, 23, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8D, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 24
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'Rxd8', 0, 0, 24, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8R, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 25
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'Rxd8+', 0, 0, 25, 'p2');
UPDATE `partida` SET `tabuleiro` = 'a1t, b1c, c1b, d1d, e1r, f1n, g1c, h1t / a2p, b2p, c2p, d2p, e2P, f2p, g2p, h2p / a3, b3, c3, d3, e3, f3, g3, h3 / a4, b4, c4, d4, e4, f4, g4, h4 / a5, b5, c5, d5, e5, f5, g5, h5 / a6, b6, c6, d6, e6, f6, g6, h6 / a7P, b7P, c7P, d7P, e7P, f7P, g7P, h7P / a8T, b8C, c8B, d8R, e8R, f8B, g8C, h8T' WHERE `id` = 'p2';

-- Movimento 26
INSERT INTO `movimento` (`num_rodada`, `movimento`, `xeque_stats`, `xeque_mate`, `num_movimento`, `id_ptd`) VALUES 
(1, 'Rxd8#', 0, 1, 26, 'p2');
UPDATE `partida
