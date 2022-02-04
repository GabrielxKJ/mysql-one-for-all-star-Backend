DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
    plano_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    plano VARCHAR(50),
    valor_plano DECIMAL(3,2)
) engine = InnoDB;

CREATE TABLE artistas(
    artista_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    artista VARCHAR(50)
) engine = InnoDB;

CREATE TABLE usuarios(
    usuario_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    idade INT NOT NULL,
    plano_id TINYINT NOT NULL,
    data_assinatura DATETIME ,
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;

CREATE TABLE albuns(
    album_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(50),
    artista_id TINYINT NOT NULL,
    ano_lancamento INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE cancoes(
    cancao_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    cancao VARCHAR(50),
    artista_id TINYINT NOT NULL,
    duracao_segundos INT,
    album_id TINYINT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
    FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) engine = InnoDB;

CREATE TABLE historico_de_reproducao(
    CONSTRAINT PRIMARY KEY(cancao_id, usuario_id),
    cancao_id TINYINT NOT NULL,
    usuario_id TINYINT NOT NULL,
    ano DATETIME,
    horario TIME,
    FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
) engine = InnoDB;

CREATE TABLE seguidores(
    CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
    usuario_id TINYINT NOT NULL,
    artista_id TINYINT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (plano, valor_plano)
VALUES
  ('gratuito',	0),
  ('familiar',7.99),
  ('pessoal', 6.99),  	
  ('universitario', 5.99);
  
INSERT INTO SpotifyClone.artistas (artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');
  
  INSERT INTO SpotifyClone.albuns (album, artista_id, ano_lancamento)
VALUES
  ('Envious', 1, 1990),
  ('Exuberant',	1, 1993),
  ('Hallowed Steam', 2, 1995),
  ('Incandescent', 3, 1998),
  ('Temporary Culture',	4, 2001),
  ('Library of liberty', 4,	2003),
  ('Chained Down', 5, 2007),
  ('Cabinet of fools', 5, 2012),
  ('No guarantees',	5, 2015),
  ('Apparatus', 6, 2015);
  
  INSERT INTO SpotifyClone.cancoes (cancao, artista_id, duracao_segundos, album_id)
VALUES
  ('Soul For Us', 1, 200,	1),
  ('Reflections Of Magic',	1,	163,	1),
  ('Dance With Her Own', 1,	116, 1),
  ('Troubles Of My Inner Fire',	1, 203,	2),
  ('Time Fireworks', 1,	152, 2),
  ('Magic Circus', 2,	105, 3),
  ('Honey, So Do I', 2,	207, 3),
  ("Sweetie, Let's Go Wild", 2,	139, 3),
  ('She Knows', 2, 244,	3),
  ('Fantasy For Me', 3,	100, 4),
  ('Celebration Of More',	3, 146, 4),
  ('Rock His Everything',	3, 223,	4),
  ('Home Forever',	3, 231, 4),
  ('Diamond Power', 3, 241, 4),
  ("Let's Be Silly", 3,	132, 4),
  ('Thang Of Thunder', 4,	240, 5),
  ('Words Of Her Life',	4, 185,	5),
  ('Without My Streets', 4,	176, 5),
  ('Need Of The Evening',	4, 190,	6),
  ('History Of My Roses',	4, 222,	6),
  ('Without My Love',	4, 111, 6),
  ('Walking And Game', 4,	123, 6),
  ('Young And Father', 4, 197,	6),
  ('Finding My Traditions', 5, 179, 7),
  ('Walking And Man', 5, 229,	7),
  ('Hard And Time',	5, 135,	7),
  ("Honey, I'm A Lone Wolf", 5,	150,	7),
  ("She Thinks I Won't Stay Tonight",	5, 166,	8),
  ("He Heard You're Bad For Me", 5,	154, 8),
  ("He Hopes We Can't Stay", 5,	210, 8),
  ('I Know I Know',	5, 117,	8),
  ("He's Walking Away", 5, 159,	9),
  ("He's Trouble", 5,	138, 9),
  ('I Heard I Want To Bo Alone', 5,	120,	9),
  ('I Ride Alone', 5,	151,	9),
  ('Honey',	6, 79, 10),
  ('You Cheated On Me', 6, 95, 10),
  ("Wouldn't It Be Nice",	6, 213,	10),
  ('Baby',	6, 136,	10),
  ('You Make Me Feel So..',	6, 83, 10);
  
INSERT INTO SpotifyClone.usuarios (nome, idade, plano_id, data_assinatura)
VALUES
  ('Thati', 23,	1, '2019-10-20'),
  ('Cintia', 35, 2,	'2017-12-30'),
  ( 'Bill',	20, 4, '2019-06-05'),
  ('Roger',	45, 3, '2020-05-13'),
  ('Norman', 58, 3,	'2017-02-17'),
  ('Patrick', 33, 2, '2017-01-06'),
  ('Vivian', 26, 4,	'2018-01-05'),
  ('Carol',	19,	4, '2018-02-14'),
  ('Angelina', 42, 2, '2018-04-29'),
  ('Paul', 46, 2, '2017-01-17');

INSERT INTO SpotifyClone.historico_de_reproducao (cancao_id, usuario_id, ano, horario)
VALUES
  (36, 1, '2020-02-28', '10:45:55'),
  (25, 1, '2020-05-02',	'05:30:35'),
  (23, 1,	'2020-03-06',	'11:22:33'),
  (14, 1,	'2020-08-05',	'08:05:17'),
  (15, 1,	'2020-09-14',	'16:32:22'),
  (34, 2,	'2020-01-02',	'07:40:33'),
  (24, 2,	'2020-05-16',	'06:16:22'),
  (21, 2,	'2020-10-09',	'12:27:48'),
  (39, 2,	'2020-09-21',	'13:14:46'),
  (6, 3, '2020-11-13', '16:55:13'),
  (3,	3, '2020-12-05', '18:38:30'),
  (26, 3,	'2020-07-30',	'10:00:00'),
  (2,	4, '2021-08-15', '17:10:10'),
  (35, 4,	'2021-07-10',	'15:20:30'),
  (27, 4,	'2021-01-09',	'01:44:33'),
  (7, 5, '2020-07-03', '19:33:28'),
  (12, 5,	'2017-02-24',	'21:14:22'),
  (14, 5,	'2020-08-06',	'15:23:43'),
  (1,	5, '2020-11-10', '13:52:27'),
  (38, 6, '2019-02-07',	'20:33:48'),
  (29, 6,	'2017-01-24',	'00:31:17'),
  (30, 6,	'2017-10-12',	'12:35:20'),
  (22, 6,	'2018-05-29',	'14:56:41'),
  (5,	7, '2018-05-09',	'22:30:49'),
  (4,	7, '2020-07-27',	'12:52:58'),
  (11, 7,	'2018-01-16',	'18:40:43'),
  (39, 8,	'2018-03-21',	'16:56:40'),
  (40, 8,	'2020-10-18',	'13:38:05'),
  (32, 8,	'2019-05-25',	'08:14:03'),
  (33, 8,	'2021-08-15',	'21:37:09'),
  (16, 9,	'2021-05-24',	'17:23:45'),
  (17, 9,	'2018-12-07',	'22:48:52'),
  (8, 9, '2021-03-14',	'06:14:26'),
  (9,	9, '2020-04-01', '03:36:00'),
  (20, 10,	'2017-02-06',	'08:21:34'),
  (21, 10,	'2017-12-04',	'05:33:43'),
  (12, 10,	'2017-07-27',	'05:24:49'),
  (13, 10,	'2017-12-25',	'01:03:57');

INSERT INTO SpotifyClone.seguidores (usuario_id, artista_id)
VALUES
  (1, 1),
  (1,	4),
  (1,	3),
  (2,	1),
  (2,	3),
  (3,	2),
  (3,	1),
  (4,	4),
  (5,	5),
  (5,	6),
  (6,	6),
  (6,	3),
  (6,	1),
  (7,	2),
  (7,	5),
  (8,	1),
  (8,	5),
  (9,	6),
  (9,	4),
  (9,	3),
  (10,	2),
  (10,	6);
  
