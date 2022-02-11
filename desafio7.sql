SELECT a.artista AS artista, al.album AS album, COUNT(s.artista_id) AS seguidores FROM artistas AS a
JOIN albuns AS al
ON a.artista_id = al.artista_id
JOIN seguidores AS s
ON a.artista_id = s.artista_id
GROUP BY album, artista
ORDER BY seguidores DESC, artista ASC, album ASC;
