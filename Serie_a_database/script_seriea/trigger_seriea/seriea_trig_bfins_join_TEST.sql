-- CASO 1
-- ho 0 squadre con l'id_partita che sto inserendo

-- CASO DI INSERIMENTO SCORRETTO (VALORE CASA_TRASFERTA NON ACCETTATO)
-- controllo quante squadre ho in una determinata partita (ossia 0)
SELECT *
FROM join_squadra_partita
WHERE id_partita = 1;
-- SE HO 1 o 2 RECORD CON ID_PARTITA = 1 EFFETTUO LA DELETE DI TUTTI I RECORD CON ID_PARTITA = 1 (vedi file: 'seriea_trig_bfins_join_TEST-UTLITY.sql')

-- eseguo l'insert in quella partita con un valore casa_trasferta non accettato
INSERT INTO join_squadra_partita
SET id_partita = 1,
	codice_squadra ='JUV',
    casa_trasferta = 't',
    n_goal = 1,
    tiri_totali = 3,
    tiri_in_porta = 2,
    possesso_palla = 50,
    passaggi = 332,
    precisione_passaggi = 90,
    falli_commessi = 10,
    ammonizioni = 3,
    espulsioni = 0,
    fuorigioco = 9,
    calci_angolo = 1;
-- viene restituito errore: 'ERRORE! Il valore che si vuole inserire per casa_trasferta non è valido. Valori accettati: C e T.'

-- CASO DI INSERIMENTO CORRETTO
-- controllo quante squadre ho in una determinata partita (ossia 0)
SELECT *
FROM join_squadra_partita
WHERE id_partita = 1;
-- SE HO 1 o 2 RECORD CON ID_PARTITA = 1 EFFETTUO LA DELETE (vedi file: 'seriea_trig_bfins_join_TEST-UTLITY.sql')

-- eseguo l'insert in quella partita con un valore casa_trasferta accettato
INSERT INTO join_squadra_partita
SET id_partita = 1,
	codice_squadra ='JUV',
    casa_trasferta = 'C',
    n_goal = 1,
    tiri_totali =3,
    tiri_in_porta =2,
    possesso_palla =50,
    passaggi =332,
    precisione_passaggi =90,
    falli_commessi =10,
    ammonizioni =3,
    espulsioni =0,
    fuorigioco =9,
    calci_angolo =1;

-- qui l'insert è avvenuto con successo e visualizzo la tabella aggiornata
SELECT *
FROM join_squadra_partita
WHERE id_partita = 1;


-- CASO 2
-- ho 1 squadra con l'id_partita che sto inserendo

-- CASI DI INSERIMENTO SCORRETTI

-- CASO DI INSERIMENTO DI UNA SQUADRA IN CASA QUANDO NE ESISTE GIA' UNA CHE HA GIOCATO IN CASA

-- controllo quante squadre ho in una determinata partita (ossia 1, JUV-C)
SELECT *
FROM join_squadra_partita
WHERE id_partita = 1;

-- eseguo l'insert in quella partita
INSERT INTO join_squadra_partita
SET id_partita = 1,
	codice_squadra ='INT',
    casa_trasferta = 'C',
    n_goal = 1,
    tiri_totali =3,
    tiri_in_porta =2,
    possesso_palla =50,
    passaggi =332,
    precisione_passaggi =90,
    falli_commessi =10,
    ammonizioni =3,
    espulsioni =0,
    fuorigioco =9,
    calci_angolo =1;
-- viene dato errore: 'ERRORE! Esiste già una partita che ha giocato questa partita in casa.'
    
-- CASO DI INSERIMENTO DI UNA SQUADRA IN TRASFERTA QUANDO NE ESISTE GIA' UNA CHE HA GIOCATO IN TRASFERTA

-- eseguo l'update di JUV-C in JUV-T per poter effettuare il test (vedi file 'seriea_trig_bfins_join_TEST-UTILITY.sql')
-- controllo quante squadre ho in una determinata partita (ossia 1, JUV-T)
SELECT *
FROM join_squadra_partita
WHERE id_partita = 1;

-- eseguo l'insert in quella partita
-- viene dato errore: 'ERRORE! Esiste già una partita che ha giocato questa partita in trasferta.'
INSERT INTO join_squadra_partita
SET id_partita = 1,
	codice_squadra ='INT',
    casa_trasferta = 'T',
    n_goal = 1,
    tiri_totali =3,
    tiri_in_porta =2,
    possesso_palla =50,
    passaggi =332,
    precisione_passaggi =90,
    falli_commessi =10,
    ammonizioni =3,
    espulsioni =0,
    fuorigioco =9,
    calci_angolo =1;
    
-- CASO DI INSERIMENTO DI UNA SQUADRA CON VALORE CASA_TRASFERTA NON VALIDO

-- controllo quante squadre ho in una determinata partita (ossia 1, JUV-T)
SELECT *
FROM join_squadra_partita
WHERE id_partita = 1;

-- eseguo l'insert in quella partita con un valore casa_trasferta diverso da C e T
INSERT INTO join_squadra_partita
SET id_partita = 1,
	codice_squadra ='INT',
    casa_trasferta = 'c',
    n_goal = 1,
    tiri_totali =3,
    tiri_in_porta =2,
    possesso_palla =50,
    passaggi =332,
    precisione_passaggi =90,
    falli_commessi =10,
    ammonizioni =3,
    espulsioni =0,
    fuorigioco =9,
    calci_angolo =1;
-- viene dato errore: 'ERRORE! Il valore che si vuole inserire per casa_trasferta non è valido. Valori accettati: C e T.'

-- CASI DI INSERIMENTO CORRETTO

-- CASO DI INSERIMENTO DI UNA SQAUDRA IN CASA
-- controllo quante squadre ho in una determinata partita (ossia 1, JUV-T)
SELECT *
FROM join_squadra_partita
WHERE id_partita = 1;

-- eseguo l'insert in quella partita con un valore casa_trasferta accettato
INSERT INTO join_squadra_partita
SET id_partita = 1,
	codice_squadra ='INT',
    casa_trasferta = 'C',
    n_goal = 1,
    tiri_totali =3,
    tiri_in_porta =2,
    possesso_palla =50,
    passaggi =332,
    precisione_passaggi =90,
    falli_commessi =10,
    ammonizioni =3,
    espulsioni =0,
    fuorigioco =9,
    calci_angolo =1;

-- qui l'insert è avvenuto con successo e visualizzo la tabella aggiornata
SELECT *
FROM join_squadra_partita
WHERE id_partita = 1;

-- CASO DI INSERIMENTO DI UNA SQAUDRA IN TRASFERTA
-- eseguo la delete del record con id_partita = 1 e casa_trasferta = 'T'
-- eseguo l'update di INT-C in JUV-C per poter effettuare il test (vedi file 'seriea_trig_bfins_join_TEST-UTILITY.sql')
-- controllo quante squadre ho in una determinata partita (ossia 1, JUV-C)
SELECT *
FROM join_squadra_partita
WHERE id_partita = 1;

-- eseguo l'insert in quella partita con un valore casa_trasferta accettato
INSERT INTO join_squadra_partita
SET id_partita = 1,
	codice_squadra ='INT',
    casa_trasferta = 'T',
    n_goal = 1,
    tiri_totali =3,
    tiri_in_porta =2,
    possesso_palla =50,
    passaggi =332,
    precisione_passaggi =90,
    falli_commessi =10,
    ammonizioni =3,
    espulsioni =0,
    fuorigioco =9,
    calci_angolo =1;

-- qui l'insert è avvenuto con successo e visualizzo la tabella aggiornata
SELECT *
FROM join_squadra_partita
WHERE id_partita = 1;
    
-- CASO 3
-- ho 2 o più squadre nel db con quel id_partita

-- controllo quante squadre ho in una determinata partita (ossia 2, JUV-C e INT-T)
SELECT *
FROM join_squadra_partita
WHERE id_partita = 1;

-- eseguo l'insert in quella partita INSERT INTO join_squadra_partita
INSERT INTO join_squadra_partita
SET id_partita = 1,
	codice_squadra ='MIL',
    casa_trasferta = 'C',
    n_goal = 1,
    tiri_totali =3,
    tiri_in_porta =2,
    possesso_palla =50,
    passaggi =332,
    precisione_passaggi =90,
    falli_commessi =10,
    ammonizioni =3,
    espulsioni =0,
    fuorigioco =9,
    calci_angolo =1;
-- viene dato errore: 'ERRORE! Sono già state inserite due squadre per questa partita.'
