#import "../config/thesis-config.typ": glpl, gl,
#import "../config/variables.typ": myTutor
#import "data/milestones_list.typ": *
#pagebreak(to:"odd")

= Descrizione stage<cap:descrizione-stage>
#text(style: "italic", [
    In questo capitolo verr' approfondita l'organizzazione dello stage, il rapporto con l'azienda e l'analisi dei rischi associata.
])
#v(1em)

== Aspettative di apprendimento
Lo stage presenta un rilevante valore formativo perché consente di applicare conoscenze teoriche di analisi dei dati, statistica e machine learning a un caso reale in ambito aziendale.

In particolare, lo studente potrà sviluppare competenze su:

- modellazione statistica e machine learning applicati a dati comportamentali;
- tecniche di classificazione, clustering e regressione;
- feature engineering e costruzione di indicatori sintetici (es. Digital Attitude);
- valutazione delle performance dei modelli tramite metriche statistiche;
- interpretazione dei risultati in ottica business e marketing;
- utilizzo dei dati per la personalizzazione delle strategie omnicanale;
- integrazione di modelli analitici in contesti aziendali reali.

L’esperienza consentirà inoltre di acquisire maggiore autonomia nella strutturazione di un prototipo e nella presentazione dei risultati.


== Obiettivi del progetto
Lo stage prevede l’inserimento dello studente nell’area Business Intelligence, Advanced Analytics e AI, con coinvolgimento in un progetto orientato all’analisi del comportamento digitale degli utenti e all’ottimizzazione delle strategie omnicanale.

Il progetto prevede:

•	la costruzione di una Digital Attitude quantitativa, sintetica e interpretabile;
•	lo sviluppo di modelli di propensione all’utilizzo dei canali digitali;
•	la definizione di segmentazioni predittive utili per strategie di marketing personalizzato.

Gli obiettivi formativi del progetto sono:

•	analizzare dati anagrafici e comportamentali relativi alle interazioni digitali;
•	costruire variabili e indicatori utili alla definizione della Digital Attitude;
•	sviluppare modelli di classificazione (es. clustering, classificatori supervisionati) per segmentare gli utenti;
•	implementare modelli di regressione per stimare la probabilità di utilizzo dei diversi canali;
•	definire metriche di valutazione delle performance dei modelli (accuracy, precision, recall, AUC, ecc.);
•	confrontare diversi approcci modellistici e selezionare le soluzioni più efficaci;
•	analizzare l’impatto delle segmentazioni su strategie di marketing omnicanale;
•	supportare l’ottimizzazione delle campagne attraverso logiche data-driven.

=== Obiettivi fissati
*Notazione*
Si farà riferimento ai requisiti secondo le seguenti notazioni: 
•	O per i requisiti obbligatori, vincolanti in quanto obiettivo primario;
•	D per i requisiti desiderabili, non vincolanti o strettamente necessari, ma dal riconoscibile valore aggiunto.
Le sigle precedentemente indicate saranno seguite da una coppia sequenziale di numeri, identificativo del requisito.

#[
#show figure: set block(breakable: true)
#set table(
  align: (center+horizon, left+horizon, center+horizon),
  columns: (auto, 5fr, 1.5fr),
)
#v(1em)
#figure(
    table(
        table.header([*Codice*], [*Descrizione*], [*Fonti*]),
        ..getOO().flatten()
    ),
    caption: "Tracciamento degli Obiettivi Obbligatori",
)
<tab:requisiti-funzionali>

#v(2em)
#figure(
    table(
      align: (center+horizon, left+horizon, center+horizon),
      table.header([*Codice*], [*Descrizione*], [*Fonti*]),
      ..getOD().flatten()
    ),
    caption: "Tracciamento degli Obiettivi Desiderabili.",
)
<tab:requisiti-qualitativi>
]
•	Obbligatori:

-	O01: Comprensione e analisi dei dati comportamentali digitali
-	O02: Sviluppo di un modello di Digital Attitude
-	O03: Implementazione di modelli di classificazione e regressione
-	O04: Valutazione delle performance tramite metriche statistiche.
•	Desiderabili:

-	D01: Ottimizzazione dei modelli e miglioramento delle performance
-	D02: Definizione di segmentazioni utilizzabili per campagne omnicanale.


== Pianificazione
Totale 40 giorni, 320 ore
=== Pianificazione iniziale
=== Discostamenti dalla pianificazione
