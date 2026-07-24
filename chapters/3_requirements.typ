#import "../config/thesis-config.typ": glpl, gl, linkfn
#import "data/requirements_list.typ": *

#let logo-databricks = "../images/databricks_logo.svg"

#pagebreak(to:"odd")

= Svolgimento del Progetto<cap:svolgimento-progetto>

#text(style: "italic", [
    In questo capitolo verranno illustrate le tappe della costruzione del progetto e dei modelli correlati. \ Prtendo con la ricerca per poi passare allo sviluppo  di una dashboard esplicativa. 
])
#v(1em)

== Stack tecnologico ed ambiente di sviluppo
#figure(
  caption: [Logo di Databricks.],
  image(logo-databricks , width: 40%)
)
L'intero progetto è stato realizzato all'interno della piattaforma #linkfn("https://www.databricks.com")[*Databricks*], che ha fornito l'infrastruttura analitica e l'ambiente di sviluppo integrato.\ _Databricks_ è una piattaforma di analisi dati unificata su cloud che implementa l'architettura #gl("lakehouse"). Sviluppata dai creatori di #linkfn("https://spark.apache.org")[Apache Spark], la piattaforma consente di integrare in un unico ecosistema le attività di Data Engineering, Data Science e Business Intelligence. \ Grazie all'integrazione nativa con #gl("lake") (che garantisce la consistenza transazionale ACID e l'indicizzazione dei dati) e #gl("ml-flow") (per il tracciamento, la riproducibilità e il _deployment_ dei modelli di Machine Learning), Databricks permette di gestire l'intero ciclo di vita del dato: dall'ingestione e pulizia delle sorgenti grezze fino all'addestramento degli algoritmi predittivi e alla loro integrazione nei processi aziendali.

La parte di sviluppo è stata svolta utilizzando i *notebook* nativi di Databricks. \ In questo ambiente è possibile impiegare simultaneamente diversi linguaggi (sia di programmazione che di gestione dei dati). L'implementazione ha combinato l'uso dei linguaggi #linkfn("https://www.python.org")[*Python*] e #linkfn("https://it.wikipedia.org/wiki/Structured_Query_Language")[*SQL*] grazie all'integrazione fornita da #linkfn("https://docs.databricks.com/aws/en/pyspark")[PySpark], l'API Python per *Apache Spark*.

_Apache Spark_ rappresenta il motore open-source di calcolo distribuito sottostante, progettato per l'elaborazione ad altissime prestazioni di grandi volumi di dati (Big Data) in memoria. Sfruttando l'architettura di Spark attraverso _PySpark_, è stato possibile manipolare e interrogare la base dati in maniera fluida all'interno dello stesso notebook, convertendo in modo trasparente le strutture dati tra _Spark DataFrame_ e tabelle SQL temporanee in base alle specifiche esigenze analitiche.

Per automatizzare e rendere riproducibili le fasi di trasformazione del dato, sono state strutturate apposite *_pipeline_ di elaborazione*. Tali pipeline hanno lo scopo di gestire l'intero ciclo di vita del dato a supporto della modellazione: dalle procedure preliminari di pulizia del dato e pre-elaborazione (_preprocessing_) per l'alimentazione degli algoritmi, fino alle fasi di _post-processing_, necessarie per ricondurre gli output predittivi nel formato idoneo alla fruizione aziendale.

== Analisi ed esplorazione preliminare dei dati
All'interno del progetto sono state inizialmente analizzate quattro tabelle grezze. Da queste il passo iniziale è di leggerle, comprenderle ed estrapolarne le informazioni utili allo sviluppo dell'intero progetto.\ Si tratta quindi di un lavoro analitico di comprensione profonda e personale del dataset. \ È stato inotre necessario pulire le tabelle per poter comprendere meglio i dati a disposizione. 

=== Analisi delle tabelle
Le tabelle a disposizione si dividevano in due gruppi: anagrafica e tabelle delle azioni.

_Tabella anagrafica:_ nominata "`hcp_epi_in_scope_it`" presenta i dati sensibili degli HCP presenti, nello specifico non è stata resa disponibile l'anagrafica completa, ma solamente in riferimento ad una specifica campagna omnicanale (da qui `epi` nel titolo della tabella sta per '_epilessia_') già eseguita dall'azienda. Il riferimento è all'incirca a 700 HCP. \ La tabella anagrafica contiene all'interno i seguenti campi: 

=== Pulizia preliminare

== Profilazione della Digital Attitude tramite Clustering

=== Feature Engineering per la misura dell'attitudine digitale

=== Sviluppo, addestramento e valutazione del modello

== Modellazione predittiva per la Next Best Action (NBA)

=== Ingegnerizzazione delle variabili

=== Addestramento del classificatore e taratura dei parametri

=== Valutazione delle performance

== Caso d'uso applicativo ed integrazione nei processi aziendali

Ad ogni requisito è associato un codice costruito in base alle sue caratteristiche:
#v(1em)
#align(center)[*(F/Q/C)(M/D/O)R*]
#v(1em)
#set list(marker: none)
- F (_Functional_): definisce una funzione di un sistema o dei suoi componenti;
- Q (_Qualitative_): rappresentano come il sistema deve essere per soddisfare i requisiti dello stakeholder;
- C (_Constraint_): rappresentano dei vincoli o dei limiti che il sistema deve rispettare;
#v(0.5em)
- M (_Mandatory_): irrinunciabili per qualcuno degli stakeholder;
- D (_Desirable_): non strettamente necessari ma a valore aggiunto riconoscibile;
- O (_Optional_): relativamente utili oppure contrattabili anche in fasi avanzate del progetto;
#v(0.3em)
- R (_Requirement_): requisito
#v(1em)
In e @tab:requisiti-vincolo sono riassunti i requisiti e il loro tracciamento con gli use case delineati in fase di analisi.
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
        ..getFR().flatten()
    ),
    caption: "Tracciamento dei requisiti funzionali.",
)
<tab:requisiti-funzionali>

#v(2em)
#figure(
    table(
      align: (center+horizon, left+horizon, center+horizon),
      table.header([*Codice*], [*Descrizione*], [*Fonti*]),
      ..getQR().flatten()
    ),
    caption: "Tracciamento dei requisiti di qualità.",
)
<tab:requisiti-qualitativi>

#v(2em)
#figure(
    table(
      align: (center+horizon, left+horizon, center+horizon),
      table.header([*Codice*], [*Descrizione*], [*Fonti*]),
      ..getCR().flatten()
    ),
    caption: "Tracciamento dei requisiti di vincolo.",
)
<tab:requisiti-vincolo>

#v(2em)
Di seguito, nella @tab:riepilogo-requisiti ho inserito il riepilogo dei requisiti, suddivisi per tipologia e necessità.
#v(1em)
#show figure: set block(breakable: false)
#figure(
  table(
    columns: (auto, 1fr, 1fr, auto, auto),
    table.header([*Tipo*], [*Mandatory*], [*Desirable*],[*Optional*], [*Somma*]),
    [Functional], [#getFR(getLen: true).at(0)], [#getFR(getLen: true).at(1)], [#getFR(getLen: true).at(2)], [#getFR(getLen: true).sum()],
    [Qualitative], [#getQR(getLen: true).at(0)], [#getQR(getLen: true).at(1)], [#getQR(getLen: true).at(2)], [#getQR(getLen: true).sum()],
    [Constraint], [#getCR(getLen: true).at(0)], [#getCR(getLen: true).at(1)], [#getCR(getLen: true).at(2)], [#getCR(getLen: true).sum()],
    [*Totale*],
      [*#{getFR(getLen: true).at(0)+getQR(getLen: true).at(0)+getCR(getLen: true).at(0)}*],
      [*#{getFR(getLen: true).at(1)+getQR(getLen: true).at(1)+getCR(getLen: true).at(1)}*],
      [*#{getFR(getLen: true).at(2)+getQR(getLen: true).at(2)+getCR(getLen: true).at(2)}*],
      [*#{getFR(getLen: true).sum()+getQR(getLen: true).sum()+getCR(getLen: true).sum()}*],
    align: (center+horizon)
  ),
  caption: "Riepilogo dei requisiti."
)<tab:riepilogo-requisiti>
]
