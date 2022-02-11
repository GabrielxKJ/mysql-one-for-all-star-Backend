SELECT c.cancao AS cancao, COUNT(h.cancao_id) AS reproducoes FROM cancoes AS c
JOIN historico_de_reproducao AS h
ON c.cancao_id = h.cancao_id
GROUP BY c.cancao, h.cancao_id
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;