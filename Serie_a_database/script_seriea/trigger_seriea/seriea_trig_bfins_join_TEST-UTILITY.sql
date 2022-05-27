-- UTILITY PER TEST TRIGGER BEFORE INSERT "JOIN_SQUADRA_PARTITA"

-- DELETE TUTTI RECORD CON UN DETEMRINATO ID_PARTITA
DELETE FROM `serie_a`.`join_squadra_partita` WHERE (`id_partita` = '1');

-- DELETE DEL RECORD CON ID_PARTITA = 1 E CASA_TRASFERTA = 'T'
DELETE FROM `serie_a`.`join_squadra_partita` WHERE (`id_partita` = '1') AND (`casa_trasferta` = 'T');

-- UPDATE DA JUV-C A JUV-T
UPDATE `serie_a`.`join_squadra_partita` 
SET `casa_trasferta` = 'T' 
WHERE (`id_partita` = '1') and (`codice_squadra` = 'JUV');

-- UPDATE DA INT-C A JUV-C
UPDATE `serie_a`.`join_squadra_partita` 
SET `codice_squadra` = 'JUV' 
WHERE (`id_partita` = '1') and (`codice_squadra` = 'INT');
