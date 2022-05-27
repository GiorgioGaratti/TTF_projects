DELIMITER $$

CREATE DEFINER=`root`@`localhost` TRIGGER `join_squadra_partita_BEFORE_UPDATE` 
BEFORE UPDATE ON `join_squadra_partita` FOR EACH ROW 
BEGIN
	
	DECLARE num_partite INT; -- numero di record con lo stesso id_partita
    DECLARE char_ct CHAR(1); -- variabile per salvare il valore di casa_trasferta del record già presente con lo stesso id_partita

    -- Recupero il numero di record con id_partita uguale a quello del nuovo record aggiornato (num_partite)
    SELECT count(*)
    INTO num_partite
    FROM join_squadra_partita
    WHERE id_partita = new.id_partita;
    
    -- CASO A
    -- se modifico un record e ne cambio l'id_partita con un valore nuovo per la tabella join_squadra_partita, controllo che convert(new.casa_trasferta USING binary) sia un valore valido
    IF (num_partite = 0 && convert(new.casa_trasferta USING binary) != convert('C' USING binary) AND convert(new.casa_trasferta USING binary) != convert('T' USING binary)) THEN
        -- restituisco errore nel caso sia un valore non valido 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERRORE! Non è possibile aggiornare casa_trasferta con un valore diverso da C o T.';

    -- CASO B
    -- se modifico il campo casa_trasferta di un record che è il solo ad avere quel id_partita, controllo che new.casa_trasferta sia un valore valido
    ELSEIF (num_partite = 1 AND new.id_partita = old.id_partita AND convert(new.casa_trasferta USING binary) != convert('C' USING binary)  AND convert(new.casa_trasferta USING binary) != convert('T' USING binary)) THEN
        -- restituisco errore nel caso sia un valore non valido
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERRORE! Non è possibile aggiornare casa_trasferta con un valore diverso da C o T.';

    -- CASO C
    -- se modifico il campo casa_trasferta e l'id_partita di un record che avrebbe come new.id_partita un valore già presente in un altro record
    -- controllo che new.casa_trasferta sia un valore valido e che non sia un duplicato per quel id_partita
    ELSEIF (num_partite = 1 AND new.id_partita != old.id_partita) THEN

        -- assegno ad char_ct il valore di casa_trasferta del record già presente con lo stesso id_partita
        SELECT casa_trasferta
        INTO char_ct
        FROM join_squadra_partita
        WHERE id_partita = new.id_partita;

        -- CASO C.1
        -- restituisco un errore se il valore new.casa_trasferta non è valido
        IF (convert(new.casa_trasferta USING binary) != convert('C' USING binary)  AND convert(new.casa_trasferta USING binary) != convert('T' USING binary)) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERRORE! Non è possibile aggiornare casa_trasferta con un valore diverso da C o T.';
        -- CASO C.2
        -- restituisco un errore se è già presente un record con l'id_partita e il valore casa_trasferta coinvolti nell'update
        ELSEIF (convert(new.casa_trasferta USING binary) = convert(char_ct using binary)) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERRORE! E'' già presente un record con questo id_partita e il valore casa_trasferta che è stato inserito.';
        END IF;

    -- CASO D
    -- se ho già due record con id_ partita = new.id_partita
    ELSEIF (num_partite = 2) THEN

        -- CASO D.1
        -- restituisco errore se sto modificando id_partita
        IF (new.id_partita != old.id_partita) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERRORE! Sono già presenti due record con l''id_partita che è stato inserito per l'' aggiornamento.';
        -- CASO D.2
        -- restituisco errore se sto modificando o casa_trasferta o codice_squadra di record
        ELSEIF (convert(new.casa_trasferta USING binary) != convert(old.casa_trasferta USING binary) || new.codice_squadra != old.codice_squadra) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERRORE! Impossibile effettuare l''update , effettuare la cancellazione e poi inserimento del record.';
        END IF;

    END IF;

END $$

DELIMITER ;
