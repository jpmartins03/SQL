-- Inserindo dados na tabela PARTIDO
INSERT INTO PARTIDO (num, nome_partido) VALUES
(1, 'Partido A'),
(2, 'Partido B'),
(3, 'Partido C');

-- Inserindo dados na tabela ZONA_ELEITORAL
INSERT INTO ZONA_ELEITORAL (num_zona, nome) VALUES
(1, 'Zona 1'),
(2, 'Zona 2'),
(3, 'Zona 3');

-- Inserindo dados na tabela SECAO
INSERT INTO SECAO (num, local, FK_num_zona) VALUES
(1, 'Local A', 1),
(2, 'Local B', 2),
(3, 'Local C', 3);

-- Inserindo dados na tabela CANDIDATO
INSERT INTO CANDIDATO (num, nome, votos, FK_num_partido) VALUES
(101, 'Candidato A', 0, 1),
(102, 'Candidato B', 0, 2),
(103, 'Candidato C', 0, 3);

-- Inserindo dados na tabela ELEITOR
INSERT INTO ELEITOR (titulo, RG, data_nasc, nome, FK_num_secao) VALUES
('123456789', '987654321', 19900101, 'Eleitor A', 1),
('223456789', '187654321', 19850101, 'Eleitor B', 2),
('323456789', '287654321', 19750101, 'Eleitor C', 3);

-- Inserindo dados na tabela VOTO
INSERT INTO VOTO (id, candidato, FK_num_secao) VALUES
('voto_001', 'Candidato A', 1),
('voto_002', 'Candidato B', 2),
('voto_003', 'Candidato C', 3);
