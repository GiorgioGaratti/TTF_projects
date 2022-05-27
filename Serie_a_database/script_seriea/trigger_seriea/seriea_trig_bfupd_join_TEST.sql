-- CASO A
-- modifico un record e ne cambio l'id_partita con un valore nuovo per la tabella join_squadra_partita

-- PRIMA DI INIZIARE CONTROLLO QUANTE SQUADRE HO IN UNA DETERMINATA PARTITA
select * 
from join_squadra_partita
where id_partita = 3;
-- SE NE HO 1 o 2 ELIMINO TUTTI I RECORD CON QUEL DETERMINATO ID_PARTITA (VEDI FILE: 'seriea_trig_bfupd_join_TEST-UTILITY.sql')

-- CASO DI UPDATE SCORRETTO (VALORE CASA_TRASFERTA NON ACCETTATO)
-- controllo quante squadre ho in una determinata partita (ossia 0) 
select * 
from join_squadra_partita
where id_partita = 3;

-- verifico la presenza del record che voglio modificare
select *
from join_squadra_partita
where id_partita = 4;
-- SE NON E' PRESENTE ESEGUO L'INSERT CON ID_PARTITA = 4, CODICE_SQUADRA = 'LAZ', CASA_TRASFERTA = 'T' (VEDI FILE: 'seriea_trig_bfupd_join_TEST-UTILITY.sql')

-- provo ad eseguire l'update inserendo un valore diverso da quelli validi ('C' e 'T')
update join_squadra_partita 
set id_partita = 3, casa_trasferta = 'c' 
where id_partita = 4 and codice_squadra = 'LAZ';
-- errore: 'ERRORE! Non è possibile aggiornare casa_trasferta con un valore diverso da C o T.'

-- CASO DI UPDATE CORRETTO
-- controllo quante squadre ho in una determinata partita (ossia 0)
select * 
from join_squadra_partita
where id_partita = 3;

-- verifico la presenza del record che voglio modificare
select *
from join_squadra_partita
where id_partita = 4;

-- eseguo l'update inserendo un valore valido per il campo casa_trasferta ('C' o 'T')
update join_squadra_partita
set id_partita = 3, casa_trasferta = 'C'
where id_partita = 4 and codice_squadra = 'LAZ';

-- qui l'update è avvenuto con successo e ne verifico il risultato
select *
from join_squadra_partita
where id_partita = 3;

-- CASO B
-- modifico il campo casa_trasferta di un record che è il solo ad avere quel id_partita

-- PRIMA DI INIZIARE CONTROLLO QUANTE SQUADRE HO IN UNA DETERMINATA PARTITA
select * 
from join_squadra_partita
where id_partita = 3;
-- SE NE HO 0 o 2 INSERISCO IL RECORD DESIGNATO PER IL TEST/ELIMINO UN RECORD (VEDI FILE: 'seriea_trig_bfupd_join_TEST-UTILITY.sql')

-- CASO DI UPDATE SCORRETTO (VALORE CASA_TRASFERTA NON ACCETTATO)
-- controllo quante squadre ho in una determinata partita (ossia 1) e verifico la presenza del record che voglio modificare
select * 
from join_squadra_partita
where id_partita = 3;

-- provo ad eseguire l'update inserendo un valore diverso da quelli validi ('C' e 'T')
update join_squadra_partita 
set casa_trasferta = 't' 
where id_partita = 3 and codice_squadra = 'LAZ';
-- errore: 'ERRORE! Non è possibile aggiornare casa_trasferta con un valore diverso da C o T.'

-- CASO DI UPDATE CORRETTO
-- controllo quante squadre ho in una determinata partita (ossia 1) e verifico la presenza del record che voglio modificare
select * 
from join_squadra_partita
where id_partita = 3;

-- eseguo l'update inserendo un valore valido per il campo casa_trasferta ('C' o 'T')
update join_squadra_partita
set casa_trasferta = 'T'
where id_partita = 3 and codice_squadra = 'LAZ';

-- qui l'update è avvenuto con successo e ne verifico il risultato
select *
from join_squadra_partita
where id_partita = 3;

-- CASO C
-- modifico il campo casa_trasferta e l'id_partita di un record che avrebbe come new.id_partita un valore già presente in un altro record

-- PRIMA DI INIZIARE CONTROLLO QUANTE SQUADRE HO IN UNA DETERMINATA PARTITA
select * 
from join_squadra_partita
where id_partita = 3;
-- SE NE HO 0 o 2 ELIMINO/INSERISCO IL RECORD DESIGNATO PER IL TEST (VEDI FILE: 'seriea_trig_bfupd_join_TEST-UTILITY.sql')

-- CASO DI UPDATE SCORRETTO 

-- CASO C.1 (VALORE CASA_TRASFERTA NON ACCETTATO)
-- controllo quante squadre ho in una determinata partita (ossia 1)
select * 
from join_squadra_partita
where id_partita = 3;

-- verifico la presenza del record che voglio modificare
select *
from join_squadra_partita
where id_partita = 4;
-- SE NON E' PRESENTE ESEGUO L'INSERT CON ID_PARTITA = 4, CODICE_SQUADRA = 'ATA', CASA_TRASFERTA = 'C'  (VEDI FILE: 'seriea_trig_bfupd_join_TEST-UTILITY.sql')

-- provo ad eseguire l'update inserendo un valore diverso da quelli validi ('C' e 'T')
update join_squadra_partita 
set id_partita = 3, casa_trasferta = 'c' 
where id_partita = 4 and codice_squadra = 'ATA';
-- errore: 'ERRORE! Non è possibile aggiornare casa_trasferta con un valore diverso da C o T.'

-- CASO C.2 (LA COPPIA DI VALORI ID_PARTITA E CASA_TRASFERTA SAREBBE DUPLICATA)
-- controllo quante squadre ho in una determinata partita (ossia 1)
select * 
from join_squadra_partita
where id_partita = 3;

-- verifico la presenza del record che voglio modificare
select *
from join_squadra_partita
where id_partita = 4;
-- SE NON E' PRESENTE ESEGUO L'INSERT CON ID_PARTITA = 4, CODICE_SQUADRA = 'ATA', CASA_TRASFERTA = 'C'  (VEDI FILE: 'seriea_trig_bfupd_join_TEST-UTILITY.sql')

-- provo ad eseguire l'update inserendo valori per id_partita e casa_trasferta uguali al record già presente nella table
update join_squadra_partita 
set id_partita = 3, casa_trasferta = 'T' 
where id_partita = 4 and codice_squadra = 'ATA';
-- errore: 'ERRORE! E'' già presente un record con questo id_partita e il valore casa_trasferta che è stato inserito.'

-- CASO DI UPDATE CORRETTO

-- CASO C.1
-- controllo quante squadre ho in una determinata partita (ossia 1)
select * 
from join_squadra_partita
where id_partita = 3;

-- verifico la presenza del record che voglio modificare
select *
from join_squadra_partita
where id_partita = 4;
-- SE NON E' PRESENTE ESEGUO L'INSERT CON ID_PARTITA = 4, CODICE_SQUADRA = 'ATA', CASA_TRASFERTA = 'C'  (VEDI FILE: 'seriea_trig_bfupd_join_TEST-UTILITY.sql')

-- eseguo l'update inserendo un valore valido per il campo casa_trasferta ('C' o 'T')
update join_squadra_partita
set id_partita = 3, casa_trasferta = 'C'
where id_partita = 4 and codice_squadra = 'ATA';

-- qui l'update è avvenuto con successo e ne verifico il risultato
select *
from join_squadra_partita
where id_partita = 3;


-- CASO C.2
-- controllo quante squadre ho in una determinata partita (ossia 1)
select * 
from join_squadra_partita
where id_partita = 3;
-- SE NE HO 0 o 2 INSERISCO IL RECORD DESIGNATO PER IL TEST/ELIMINO UN RECORD PER AVERE SOLO QUELLO CON CODICE_SQUADRA = 'LAZ' (VEDI FILE: 'seriea_trig_bfupd_join_TEST-UTILITY.sql')

-- verifico la presenza del record che voglio modificare
select *
from join_squadra_partita
where id_partita = 4;
-- SE NON E' PRESENTE ESEGUO L'INSERT CON ID_PARTITA = 4, CODICE_SQUADRA = 'ATA', CASA_TRASFERTA = 'C'  (VEDI FILE: 'seriea_trig_bfupd_join_TEST-UTILITY.sql')

-- eseguo l'update inserendo un valore valido per il campo casa_trasferta ('C' o 'T')
update join_squadra_partita
set id_partita = 3, casa_trasferta = 'C'
where id_partita = 4 and codice_squadra = 'ATA';

-- qui l'update è avvenuto con successo e ne verifico il risultato
select *
from join_squadra_partita
where id_partita = 3;

-- CASO D
-- modifico un record con un id_partita che presenta già due occorrenze nella table

-- PRIMA DI INIZIARE CONTROLLO QUANTE SQUADRE HO IN UNA DETERMINATA PARTITA
select * 
from join_squadra_partita
where id_partita = 3;
-- SE NE HO 0 o 1 INSERISCO I/IL RECORD DESIGNATO PER IL TEST (VEDI FILE: 'seriea_trig_bfupd_join_TEST-UTILITY.sql')

-- CASO D.1

-- CASO DI UPDATE SCORRETTO (IL VALORE NEW.ID_PARTITA HA GIA' DUE OCCORRENZE NELLA TABLE)
-- controllo quante squadre ho in una determinata partita (ossia 2)
select * 
from join_squadra_partita
where id_partita = 3;

-- verifico la presenza del record che voglio modificare
select *
from join_squadra_partita
where id_partita = 1;
-- SE NE HO 0 o 1 INSERISCO I/IL RECORD PER IL TEST IN MODO TALE CHE ALMENO UNO ABBIA ID_PARTITA = 1 E CODICE_SQUADRA = 'INT' (VEDI FILE: 'seriea_trig_bfupd_join_TEST-UTILITY.sql')

-- provo ad eseguire l'update cambiando l'id_partita al mio record designato
update join_squadra_partita 
set id_partita = 3
where id_partita = 1 and codice_squadra = 'INT';
-- errore: 'ERRORE! Sono già presenti due record con l''id_partita che è stato inserito per l' aggiornamento.'
-- IN QUESTO CASO NON POSSO MAI ESEGUIRE L'UPDATE

-- CASO D.2

-- CASO DI UPDATE SCORRETTO (VOGLIO MODIFICARE O CODICE_SQUADRA O CASA_TRASFERTA)
-- controllo quante squadre ho in una determinata partita (ossia 2) e verifico la presenza del record che voglio modificare
select * 
from join_squadra_partita
where id_partita = 1;
-- SE NE HO 0 o 1 INSERISCO I/IL RECORD PER IL TEST IN MODO TALE CHE ALMENO UNO ABBIA ID_PARTITA = 1 E CODICE_SQUADRA = 'INT' (VEDI FILE: 'seriea_trig_bfupd_join_TEST-UTILITY.sql')


-- provo ad eseguire l'update cambiando il campo casa_trasferta al mio record designato
update join_squadra_partita 
set casa_trasferta = 'T'
where id_partita = 1 and codice_squadra = 'INT';
-- errore: 'ERRORE! Impossibile effettuare l''update, effettuare la cancellazione e poi inserimento del record.'

-- provo ad eseguire l'update cambiando il campo codice_squadra al mio record designato
update join_squadra_partita 
set codice_squadra = 'ATA'
where id_partita = 1 and codice_squadra = 'INT';
-- errore: 'ERRORE! Impossibile effettuare l''update, effettuare la cancellazione e poi inserimento del record.'
-- IN QUESTO CASO NON E' MAI POSSIBILE ESEGUIRE L'UPDATE
