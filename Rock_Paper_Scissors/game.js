var punteggio = {
    puntiUtente: 0,
    puntiComputer: 0
}
var utenteScelta;
var pcScelta;
var opzioni = [
    {
        nome: "Rock",
        immagine: "assets/fist.png"
    },
    {
        nome: "Paper",
        immagine: "assets/airplane.png"
    },
    {
        nome: "Scissors",
        immagine: "assets/scissors.png"
    },
]
var possibiliScelteGiocatore = document.getElementsByClassName("user-choice"); //ritorna un array con le scelte del giocatore
for (var i = 0; i < possibiliScelteGiocatore.length; i++) {
    possibiliScelteGiocatore[i].addEventListener('click', onSceltaUtente);
}

function onSceltaUtente() {
    utenteScelta = this.dataset.name;
    sceltaCasuale();
    var pcImmagine = "<img src='" + pcScelta.immagine + "' />";
    var pcTesto = "<h3>" + pcScelta.nome + "</h3>";
    document.getElementById("computer-choice").innerHTML = pcImmagine + pcTesto;
    document.getElementById("result").innerHTML = controllaChiVince();
    document.getElementById("player-score").innerHTML = punteggio.puntiUtente;
    document.getElementById("cpu-score").innerHTML = punteggio.puntiComputer;
}

function sceltaCasuale() {
    pcScelta = opzioni[Math.floor(Math.random() * opzioni.length)];
} 

sceltaCasuale();

function controllaChiVince() {
    if (utenteScelta == pcScelta.nome) {
        return "Draw";
    } else {
        if (utenteScelta == "Rock") {
            if (pcScelta.nome == "Scissors") {
                punteggio.puntiUtente++;
                return "You win!";
            } else {
                punteggio.puntiComputer++;
                return "You lose...";
            }
        }
        if (utenteScelta == "Paper") {
            if (pcScelta.nome == "Rock") {
                punteggio.puntiUtente++;
                return "You win!";
            } else {
                punteggio.puntiComputer++;
                return "You lose...";
            }
        }
        if (utenteScelta == "Scissors") {
            if (pcScelta.nome == "Paper") {
                punteggio.puntiUtente++;
                return "You win!";
            } else {
                punteggio.puntiComputer++;
                return "You lose...";
            }
        }
    }
}