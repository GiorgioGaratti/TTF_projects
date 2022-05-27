DELIMITER $$

CREATE DEFINER=`root`@`localhost` TRIGGER `join_squadra_partita_BEFORE_INSERT` 
BEFORE INSERT ON `join_squadra_partita` FOR EACH ROW 
BEGIN

	DECLARE num_partite INT; -- numero di record con lo stesso id_partita
    DECLARE ct_partita CHAR(1); -- variabile per salvare il valore di casa_trasferta del record già presente con lo stesso id_partita 
    
	-- conto il numero di squadre con l'id uguale a quella che sto inserendo, salvando il risultato in num_partite
    SELECT COUNT(*)
    INTO num_partite
    FROM join_squadra_partita
    WHERE id_partita = new.id_partita;
    
	-- CASO 1
	-- se ho 0 squadre con new.id_partita nel db controllo se new.casa_trasferta è diverso da C e T
    IF (num_partite = 0 && convert(new.casa_trasferta USING binary) != convert('C' USING binary) && convert(new.casa_trasferta USING binary) != convert('T' USING binary)) THEN

		-- se true restituisco un errore
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'ERRORE! Il valore che si vuole inserire per casa_trasferta non è valido. Valori accettati: C e T.';
	
	-- CASO 2
	-- se ho 1 squadra con new.id_partita nel db
    ELSEIF (num_partite = 1) THEN
	
		-- salvo in ct_partita il campo casa_trasferta del record presente nel db
		SELECT casa_trasferta
        INTO ct_partita
        FROM join_squadra_partita
        WHERE id_partita = new.id_partita;
        
		-- se new.casa_trasferta è un valore accettato (C o T) ma uguale a casa_traferta del record già presente nel db, allora restituisco un errore
        IF (ct_partita = 'C' && convert(new.casa_trasferta USING binary) = convert(ct_partita USING binary)) THEN
			SIGNAL SQLSTATE '45000' 
			SET MESSAGE_TEXT = 'ERRORE! Esiste già una partita che ha giocato questa partita in casa.';
		ELSEIF (ct_partita = 'T' && convert(new.casa_trasferta USING binary) = convert(ct_partita USING binary)) THEN
			SIGNAL SQLSTATE '45000' 
			SET MESSAGE_TEXT = 'ERRORE! Esiste già una partita che ha giocato questa partita in trasferta.';
		-- se il record che sto inserendo ha un valore di casa_trasferta non accettato, allora restituisco un errore
		ELSEIF (convert(new.casa_trasferta USING binary) != convert('T' USING binary) && convert(new.casa_trasferta USING binary) != convert('C' USING binary)) THEN
			SIGNAL SQLSTATE '45000' 
			SET MESSAGE_TEXT = 'ERRORE! Il valore che si vuole inserire per casa_trasferta non è valido. Valori accettati: C e T.';
		END IF;

	-- CASO 3
	-- se ho 2+ squadre con quel id_partita nel db restituisco un errore
	ELSEIF (num_partite > 1) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERRORE! Sono già state inserite due squadre per questa partita.';
	END IF;
    
END$$

DELIMITER ;