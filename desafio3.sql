USE SpotifyClone;USE SpotifyClone;
SELECT
 a.nome AS usuario,
 COUNT(b.cancao_id) AS qtde_musicas_ouvidas,
 SUM(ROUND(c.duracao_segundos/60, 2)) AS total_minutos
 -- ROUND(SUM(c.duracao_segundos)/60, 2) AS total_minutos
FROM usuarios AS a
JOIN historico_de_reproducao AS b
ON a.usuario_id = b.usuario_id
JOIN cancoes AS c
ON b.cancao_id = c.cancao_id
GROUP BY a.nome
ORDER BY a.nome ASC;