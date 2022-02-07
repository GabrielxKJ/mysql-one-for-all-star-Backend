SELECT
 COUNT(DISTINCT c.cancao_id) AS cancoes,
 COUNT(DISTINCT al.artista_id) AS artistas,
 COUNT(DISTINCT al.album_id) AS albuns
FROM SpotifyClone.cancoes AS c
JOIN SpotifyClone.albuns AS al
JOIN SpotifyClone.artistas AS a;