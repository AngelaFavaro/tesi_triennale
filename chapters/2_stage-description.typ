#import "../config/thesis-config.typ": glpl, gl,
#import "../config/variables.typ": myTutor
#import "data/milestones_list.typ": *
#pagebreak(to:"odd")

#show figure: set block(breakable: true)
#show table: set block(breakable: true)
#show table.cell: set block(breakable: false)

= Descrizione stage<cap:descrizione-stage>
#text(style: "italic", [
    In questo capitolo verrà approfondita l'organizzazione dello stage, le aspettative, gli obiettivi prefissati e il discostamento effettivo dall'organizzazione a monte.
])
#v(1em)

== Aspettative di apprendimento
Lo stage presenta un rilevante valore formativo perché consente di applicare conoscenze teoriche di analisi dei dati, statistica e machine learning a un caso reale in ambito aziendale.

*Dal punto di vista strettamente tecnico e metodologico*, le principali aspettative, come accennato nella @cap:desc-prog, le principali aspettative di apprendimento e consolidamento riguardano:

_Modellazione statistica e machine learning_ su dati comportamentali; \ apprendere a gestire dati reali e complessi legati alle interazioni umane, traducendo eventi qualitativi e temporali in variabili per un'analisi predittiva;

_Tecniche di classificazione, clustering e regressione_; \ approfondire l'uso degli algoritmi non supervisionati per l'identificazione di gruppi omogenei di utenti (profilazione della _Digital Attitude_) e di quelli supervisionati per la raccomandazione della _Next Best Action_;

_Feature engineering e costruzione di indicatori sintetici_; \ sviluppare la capacità di trasformare dati grezzi di tracciamento in variabili ad alto valore informativo, capaci di sintetizzare in modo efficace lo storico comunicativo degli HCP;

_Valutazione delle performance dei modelli_; \ acquisire rigore nell'uso di metriche quantitative e metodologie di validazione per misurare l'accuratezza, la robustezza e la capacità di generalizzazione degli algoritmi sviluppati;

_Interpretazione dei risultati (Data Visualization)_; \ apprendere le tecniche di rappresentazione grafica dei dati, indispensabili per tradurre gli output analitici in report e _dashboard_ chiare, rendendo i pattern emersi e le raccomandazioni logiche facilmente intellegibili anche a utenti non tecnici (ad esempio gli utenti);

_Integrazione di modelli analitici in contesti aziendali reali_;\ comprendere come un modello teorico possa trasformarsi in uno strumento operativo utilizzabile all'interno dei processi decisionali del cliente, rispettando vincoli di business e requisiti di efficienza.

A fianco dell'innalzamento delle competenze tecniche, un'aspettativa rilevante è rappresentata dalla *comprensione del contesto aziendale*. Il tirocinio costituisce un'opportunità preziosa per confrontarsi con l'organizzazione del lavoro in un'azienda di consulenza, apprendere le logiche della gestione dei progetti per obiettivi e comprendere come le esigenze dei clienti e degli utenti finali guidino ogni scelta architetturale e modellistica.\ Questa esperienza si propone dunque di affinare anche la capacità di comunicazione interpersonale, il lavoro in team e la flessibilità operativa necessarie per muoversi nel mondo professionale.

== Obiettivi del progetto
Lo stage vuole fare da tramite come l'introduzione alla Business Intelligence, Advanced Analytics e AI, grazie al coinvolgimento in un progetto orientato all’analisi del comportamento digitale degli utenti e all’ottimizzazione delle strategie omnicanale.

Il progetto prevede:

- la costruzione di una Digital Attitude quantitativa, sintetica e interpretabile;
- lo sviluppo di modelli di propensione all’utilizzo dei canali digitali;
- la definizione di segmentazioni predittive utili per strategie di marketing personalizzato.

Gli obiettivi formativi del progetto sono:

_Analizzare dati anagrafici e comportamentali_ sulle alle interazioni digitali;

_Costruire variabili e indicatori utili_ alla definizione della Digital Attitude;

_Sviluppare modelli di classificazione_ (es. clustering, classificatori supervisionati) per segmentare gli utenti;

_Implementare modelli di regressione_ per stimare la probabilità di utilizzo dei diversi canali;

_Definire metriche di valutazione delle performance dei modelli_ (accuracy, precision, recall, AUC, ecc.);

_Confrontare diversi approcci modellistici e selezionare le soluzioni più efficaci_;

_Supportare l’ottimizzazione delle campagne attraverso logiche data-driven_.

=== Obiettivi fissati
*Notazione*\
Si farà riferimento agli obiettivi secondo le seguenti notazioni: 
- #underline[_OO_ per gli obiettivi obbligatori], vincolanti in quanto obiettivo primario; sono presenti in @tab:obiettivi-obbligatori.
- #underline[_OD_ per i obiettivi desiderabili], non vincolanti o strettamente necessari, ma dal riconoscibile valore aggiunto; sono presenti in @tab:obiettivi-desiderabili.
Le sigle precedentemente indicate saranno seguite da dei numeri, identificativi del requisito.

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
<tab:obiettivi-obbligatori>

#v(2em)
#figure(
    table(
      align: (center+horizon, left+horizon, center+horizon),
      table.header([*Codice*], [*Descrizione*], [*Fonti*]),
      ..getOD().flatten()
    ),
    caption: "Tracciamento degli Obiettivi Desiderabili.",
)
<tab:obiettivi-desiderabili>
]


== Pianificazione
Lo stage è pensato con una durata complessiva di quaranta giorni; in totale trecentoventi ore. \

Il lavoro è stato svolto a stretto contatto con il referente aziendale e colleghi del team di soluzione presso la sede di Blue BI di Vicenza.

=== Pianificazione iniziale <cap:piano-iniziale>

#v(1em)
#set table(
  align: (center+horizon, center+horizon, center+horizon), 
)
#figure(
  caption: [Pianificazione del lavoro.],
  table(
    columns: 4,
    table.header([N°\ attività], [*Giorno*], [*Durata\ giorni*], [*Descrizione*]),
    [*1*],[18 maggio - \ 25 maggio],[sei], [#underline[Formazione e contestualizzazione]. Introduzione al contesto omnicanale e al comportamento digitale degli utenti. Analisi dei dataset disponibili.],
    [*2*],[26 maggio - \ 9 giugno],[dieci], [#underline[Analisi esplorativa] dei dati. Studio delle variabili comportamentali e costruzione della Digital Attitude. Identificazione delle feature rilevanti],
    [*3*],[10 giugno - \ 29 giugno], [quattordici], [#underline[Sviluppo modelli]. Implementazione di modelli di classificazione e regressione per segmentazione e propensione ai canali],
    [*4*],[30 giugno - \ 8 luglio],[sette], [#underline[Validazione] modelli. #underline[Valutazione] performance, confronto approcci e interpretazione risultati in ottica business],
    [*5*],[9 luglio - \ 13 luglio], [tre], [#underline[Documentazione e presentazione finale]. Redazione della documentazione tecnica e funzionale. Sintesi dei risultati ottenuti. Preparazione della presentazione finale del lavoro svolto.]
  )
)<fig:pianificazione-iniziale>
#v(1em)
=== Discostamenti dalla pianificazione
#v(1em)
_Le attività che hanno subito *discostamenti sostanziali* rispetto alla programmazione inziale presentano un "\*" in apice al 'N° attività' in @fig:pianificazione-effettiva. _ \
_Le attività che hanno subito *variazioni temporali* rispetto a quanto preventivato a monte presentano un "\*" in apice alla 'Durata giorni' in @fig:pianificazione-effettiva. _
#set table(
  align: (center+horizon, center+horizon, center+horizon), 
)
#figure(
  caption: [Svolgimento effettivo del lavoro.],
  table(
    columns: 4,
    table.header([N°\ attività], [*Giorno*], [*Durata\ giorni*], [*Descrizione*]),
    [*1*],[18 maggio - \ 25 maggio],[sei], [#underline[Formazione e contestualizzazione]. Introduzione al contesto omnicanale e al comportamento digitale degli utenti. Analisi dei dataset.],
    [*2*],[26 maggio - \ 28 maggio],[tre\*], [#underline[Analisi esplorativa] dei dati. Studio delle variabili comportamentali. Identificazione delle feature rilevanti],
    [*3*\*],[29 maggio - \ 12 giugno], [undici\*], [#underline[Costruzione della Digital Attitude]. Sviluppo modello di clustering. Confronto e studio approcci teorici, validazione; valutazione delle performance, intepretazione dei risultati in ottica business.],
    [*4*\*],[15 giugno - \ 30 gugno],[dodici\*], [#underline[Sviluppo modelli per Next Best Action]. Confronto e studio approcci, valiazione, valutazione delle performance, intepretazione di risultati in ottica business],
    [*5*\*], [1 luglio - 3 luglio], [tre\*], [#underline[Preparazione della dashboard di esposizione dei risultati.]],
    [*6*],[6 luglio - \ 13 luglio], [sei\*], [#underline[Documentazione e presentazione finale].  Redazione della documentazione tecnica e funzionale.],
  )
)<fig:pianificazione-effettiva>
#v(1em)