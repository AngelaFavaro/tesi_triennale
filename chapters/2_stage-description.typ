#import "../config/thesis-config.typ": glpl, gl, linkfn
#import "../config/variables.typ": myTutor
#import "data/milestones_list.typ": *
#pagebreak(to:"odd")

#show figure: set block(breakable: true)
#show table: set block(breakable: true)
#show table.cell: set block(breakable: false)

= Descrizione stage<cap:desc-stage>
#text(style: "italic", [
    In questo capitolo verrà approfondita l'organizzazione dello stage, le aspettative, gli obiettivi prefissati e il discostamento effettivo dall'organizzazione a monte.
])
#v(1em)

== Aspettative di apprendimento
Lo stage presenta un rilevante valore formativo perché consente di applicare conoscenze teoriche di analisi dei dati, statistica e machine learning a un caso reale in ambito aziendale.

*Dal punto di vista strettamente tecnico e metodologico*, come accennato nella @cap:desc-prog, le principali aspettative di apprendimento e consolidamento riguardano:

_Modellazione statistica e machine learning_ su dati comportamentali; \ apprendere a gestire dati reali e complessi legati alle interazioni umane, traducendo eventi qualitativi e temporali in variabili per un'analisi predittiva;

_Tecniche di classificazione, clustering e regressione_; \ approfondire l'uso degli algoritmi non supervisionati per l'identificazione di gruppi omogenei di utenti e di quelli supervisionati;

_Feature engineering e costruzione di indicatori sintetici_; \ sviluppare la capacità di trasformare dati grezzi di tracciamento in variabili ad alto valore informativo, capaci di sintetizzare in modo efficace un dataset;

_Valutazione delle performance dei modelli_; \ acquisire rigore nell'uso di metriche quantitative e metodologie di validazione per misurare l'accuratezza, la robustezza e la capacità di generalizzazione degli algoritmi sviluppati;

_Interpretazione dei risultati (#gl("data-visualization"))_; \ apprendere le tecniche di rappresentazione grafica dei dati, indispensabili per tradurre gli output analitici in report e _dashboard_ chiare, rendendo i pattern emersi e le raccomandazioni logiche facilmente intellegibili anche a utenti non tecnici (ad esempio gli utenti);

_Integrazione di modelli analitici in contesti aziendali reali_;\ comprendere come un modello teorico possa trasformarsi in uno strumento operativo utilizzabile all'interno dei processi decisionali del cliente, rispettando vincoli di business e requisiti di efficienza.

A fianco dell'innalzamento delle competenze tecniche, un'aspettativa rilevante è rappresentata dalla *comprensione del contesto aziendale*. Il tirocinio costituisce un'opportunità preziosa per confrontarsi con l'organizzazione del lavoro in un'azienda di consulenza, apprendere le logiche della gestione dei progetti per obiettivi e comprendere come le esigenze dei clienti e degli utenti finali guidino ogni scelta architetturale e modellistica.\ Questa esperienza si propone dunque di affinare anche la capacità di comunicazione interpersonale, il lavoro in team e la flessibilità operativa necessarie per muoversi nel mondo professionale.

== Obiettivi del progetto
Il percorso di stage si propone di introdurre e applicare le principali metodologie in uso negli ambiti della Business Intelligence e dell'Intelligenza Artificiale, attraverso lo sviluppo di un progetto orientato all'analisi del comportamento digitale degli utenti e all'ottimizzazione delle strategie omnicanale.

Per raggiungere questo traguardo le attività progettuali sono volte all'ingegnerizzazione di un ciclo di vita del dato, che parte dalla fase di acquisizione e pre-elaborazione delle interazioni storiche degli HCP fino all'addestramento e alla validazione di algoritmi predittivi basati sul concetto di _Next Best Action_ (NBA). 

In questo contesto, il lavoro da svolgere è stato strutturato attorno a tre macroaree operative, che delineano gli obiettivi tecnici e metodologici del progetto:

*1. Ingegnerizzazione dei dati e Feature Engineering* \
Il primo obiettivo riguarda la preparazione della base informativa. Questa fase prevede l'estrazione e l'integrazione dei dati storici relativi alle interazioni multi-canale, tra cui visite F2F, chiamate telefoniche, video call ed email (DEM e RTE). A seguito di un'accurata fase di pre-elaborazione orientata alla gestione dei dati mancanti, al trattamento degli outlier e alla normalizzazione delle variabili temporali e frequenziali. L'attività si concentra poi sulla costruzione di un set di feature aggregate e indicatori sintetici.

*2. Modellazione analitica e Machine Learning*\
La seconda macroarea costituisce il cuore algoritmico del progetto e si focalizza sullo sviluppo dei modelli analitici. In un primo momento, vengono applicate tecniche di apprendimento non supervisionato per analizzare i pattern comportamentali ed effettuare una segmentazione targettizzata degli HCP. Successivamente, la conoscenza estratta viene integrata all'interno di classificatori supervisionati e modelli di propensione, con il fine di stimare la probabilità di conversione sui diversi canali digitali e definire l'architettura predittiva in grado di raccomandare la _Next Best Action_ più efficace.

*3. Validazione e valutazione delle performance* \
L'ultima macroarea è dedicata alla verifica e all'ottimizzazione della soluzione modellata, garantendo il rigore scientifico del lavoro svolto. A seguito di uno studio preventivo delle possibili architetture analitiche che ha condotto alla scelta del modello più idoneo al contesto applicativo, viene definito un quadro metodologico di valutazione basato su metriche quantitative specifiche per il tipo di algoritmo adottato. L'analisi continua delle metriche di performance permette così di guidare il processo iterativo di perfezionamento e taratura dei parametri del modello, garantendone la massima efficacia operativa.

Al fine di acquisire le competenze verticali necessarie all'utilizzo dello stack tecnologico di progetto, la fase iniziale prevede un percorso di formazione e autoapprendimento. Tale attività si è avvalsa della piattaforma #linkfn("https://business.udemy.com/it")[Udemy], messa a disposizione dall'azienda.

=== Obiettivi fissati <cap:obiettivi>
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
        table.header([*Codice*], [*Descrizione*], [*Origine*]),
        ..getOO().flatten()
    ),
    caption: "Tracciamento degli Obiettivi Obbligatori",
)
<tab:obiettivi-obbligatori>

#v(2em)
#figure(
    table(
      align: (center+horizon, left+horizon, center+horizon),
      table.header([*Codice*], [*Descrizione*], [*Origine*]),
      ..getOD().flatten()
    ),
    caption: "Tracciamento degli Obiettivi Desiderabili.",
)
<tab:obiettivi-desiderabili>
]


== Pianificazione
Lo stage è stato strutturato con una durata complessiva di quaranta giotrnate lavorative; per un totale di 320 ore. \

Il lavoro è stato svolto a stretto contatto con il referente aziendale e con i colleghi del team di soluzione presso la sede di Blue BI di Vicenza.

=== Pianificazione iniziale <cap:piano-iniziale>

#v(1em)
#set table(
  align: (center+horizon, center+horizon, center+horizon), 
)
#figure(
  caption: [Pianificazione del lavoro.],
  table(
    columns: 4,
    table.header([N°\ attività], [*Giorno*], [*Durata\ (giorni)*], [*Descrizione*]),
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
Nella @fig:pianificazione-effettiva, l'utilizzo dell'asterisco ($*$) in apice specifica le modifiche riorganizzative apportate rispetto al piano iniziale:
- In corrispondenza del *N° attività*, indica una variazione sostanziale nella natura o nella struttura dell'attività;
- In corrispondenza della *Durata (giorni)*, evidenzia una revisione della tempistica preventivata a monte.
#set table(
  align: (center+horizon, center+horizon, center+horizon), 
)
#figure(
  caption: [Svolgimento effettivo del lavoro.],
  table(
    columns: 4,
    table.header([N°\ attività], [*Giorno*], [*Durata\ (giorni)*], [*Descrizione*]),
    [*1*],[18 maggio - \ 25 maggio],[sei], [#underline[Formazione e contestualizzazione]. Introduzione al contesto omnicanale e al comportamento digitale degli utenti. Analisi dei dataset.],
    [*2*],[26 maggio - \ 28 maggio],[tre\*], [#underline[Analisi esplorativa] dei dati. Studio delle variabili comportamentali. Identificazione delle feature rilevanti],
    [*3.1*\*],[29 maggio - \ 12 giugno], [undici\*], [#underline[Costruzione della Digital Attitude]. Sviluppo modello di clustering. Confronto e studio dei vari approcci con validazione finale. Valutazione delle performance e intepretazione dei risultati in ottica business.],
    [*3.2*\*],[15 giugno - \ 30 gugno],[dodici\*], [#underline[Sviluppo modelli per Next Best Action]. Confronto e studio dei vari approcci con valiazione finale. Valutazione delle performance e intepretazione di risultati in ottica business],
    [*4*\*], [1 luglio - 3 luglio], [tre\*], [#underline[Preparazione della dashboard di esposizione dei risultati.]],
    [*5*],[6 luglio - \ 13 luglio], [sei\*], [#underline[Documentazione e presentazione finale].  Redazione della documentazione tecnica e funzionale.],
  )
)<fig:pianificazione-effettiva>
#v(1em)