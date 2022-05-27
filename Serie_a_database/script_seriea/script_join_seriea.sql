-- prima query
-- query per visualizzare dati delle squadre di una partita                     
SELECT stagione, giornata, p.id_partita, data_partita, s.codice_squadra, nome_squadra, casa_trasferta, n_goal
FROM partita p
INNER JOIN join_squadra_partita jp ON p.id_partita = jp.id_partita
INNER JOIN squadra s ON s.codice_squadra = jp.codice_squadra
WHERE p.id_partita = 6
ORDER BY stagione, giornata, casa_trasferta;


-- seconda query
-- query per visualizzare dati delle squadre di una partita con anche i dati dei marcatori    
SELECT stagione, giornata, p.id_partita, data_partita, s.codice_squadra, nome_squadra, casa_trasferta, n_goal, nome_marcatore, minuto
FROM partita p
INNER JOIN join_squadra_partita jp ON p.id_partita = jp.id_partita
INNER JOIN squadra s ON s.codice_squadra = jp.codice_squadra
LEFT JOIN goal g ON jp.id_partita = g.id_partita AND jp.codice_squadra = g.codice_squadra
WHERE p.id_partita = 6
ORDER BY stagione, giornata, casa_trasferta;
