SELECT a.artista AS artista, al.album AS album FROM artistas AS a
JOIN albuns AS al
ON a.artista_id = al.artista_id
GROUP BY artista, album HAVING artista = 'Walter Phoenix'
ORDER BY album ASC;
