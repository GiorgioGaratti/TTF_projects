-- UTILITY PER TEST TRIGGER BEFORE UPDATE "JOIN_SQUADRA_PARTITA" --

-- DELETE tutti i record con un determinato id_partita
delete from join_squadra_partita where id_partita = 3;

-- DELETE un determinato record
delete from join_squadra_partita where id_partita = 3 and codice_squadra = 'ATA';

-- INSERT per popolare la table (modificabile all'occorrenza)
insert into join_squadra_partita
set
id_partita = 4,
codice_squadra = 'ATA',
casa_trasferta = 'C',
n_goal = 0,
tiri_totali = 9,
tiri_in_porta = 7,
possesso_palla = 40,
passaggi = 333,
precisione_passaggi = 89,
falli_commessi = 3,
ammonizioni = 3,
espulsioni = 0,
fuorigioco = 9,
calci_angolo = 0;
