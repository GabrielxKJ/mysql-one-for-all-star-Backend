SELECT 
 usr.nome AS usuario,
 IF(YEAR(MAX(hist.ano)) < 2021, 'Usuário inativo', 'Usuário ativo') AS condicao_usuario
FROM usuarios AS usr
JOIN historico_de_reproducao AS hist
ON usr.usuario_id = hist.usuario_id
GROUP BY usr.nome
ORDER BY usr.nome ASC;
