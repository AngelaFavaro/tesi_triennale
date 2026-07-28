#import "../config/thesis-config.typ": glpl, gl, linkfn
#import "data/requirements_list.typ": *

#show figure: set block(breakable: true)
#show table: set block(breakable: true)
#show table.cell: set block(breakable: false)
#let logo-databricks = "../images/databricks_logo.svg"
#let segmentation = "../images/segmentation.png"
#let digital-attitude = "../images/digital_attitude.png"
#let specialty = "../images/specialty.png"
#let perc-azioni = "../images/perc-azioni.png"
#let distr-azioni = "../images/distr-azioni-tempo.png"
#let distr-azioni-web = "../images/ditribuzione-azioni.png"
#let distr-azioni-RTE = "../images/RTE-distr-azioni.png"
#let distr-azioni-DEM = "../images/DEM-distr-azioni.png"
#let distr-azioni-time-VISIT = "../images/visite-distr-azioni-tempo.png"
#let distr-azioni-VISIT = "../images/visit-distr-azioni.png"


#pagebreak(to:"odd")

= Svolgimento del Progetto<cap:svolgimento-progetto>

#text(style: "italic", [
    In questo capitolo verranno illustrate le tappe della costruzione del progetto e dei modelli correlati. \ Partendo con la ricerca per poi passare allo sviluppo  di una dashboard finale esplicativa. 
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

I dataset sorgente, resi disponibili come file `.csv`, sono stati importati nell'ambiente Databricks e convertiti in tabelle (Delta Table / tabelle di _metastore_). Questa operazione ha consentito di accedere ai dataset direttamente tramite query SQL ed ecosistema PySpark.

Le tabelle a disposizione si dividevano in due macro-gruppi: la tabella anagrafica e le tabelle delle azioni.
=== Analisi Tabella Anagrafica <cap:analisi-tab-anagrafica>
La tabella, denominata "`hcp_epi_in_scope_it`", raccoglie le informazioni relative agli HCP (_Healthcare Professional_) coinvolti nel progetto. Nello specifico, non è stata resa disponibile l'intera anagrafica aziendale, ma soltanto un sottoinsieme riferito a una determinata campagna omnicanale svolta in precedenza sull'epilessia (da cui l'acronimo `epi` nel nome della tabella). Il campione comprende all'circa 800 HCP. Sulla tabella sono state condotte le prime attività di pulizia e analisi esplorativa.

*Prima fase: pulizia e selezione delle colonne*\
In seguito a una prima analisi della struttura dati, lo studio si è focalizzato sulla comprensione del significato di ciascun campo, avvalendosi del supporto dei referenti aziendali. Una volta definiti i significati delle singole variabili, si è proceduto con una prima scrematura dei campi non rilevanti ai fini della modellazione.

Di conseguenza a questa selezione iniziale, sono state mantenute le variabili riportate nella @tab:hcp.

#set table(
  align: (center+horizon, center+horizon), 
)
#figure(
  caption: [Campi della tabella `hcp_epi_in_scope_it`.],
  table(
    columns: 2,
    table.header([*Campo*], [*Spiegazione*]),
    [CONTACT_ID],[Codice identificativo unico alfanumerico del singolo HCP, strutturato su cinque blocchi separati da trattini (es. CN60556O-8V51-4667-9436-R7E5446799U9). Rappresenta la chiave primaria della tabella.],
    [NAME],[Nome e cognome del professionista sanitario (unificati in un unico campo).],
    [EMAIL],[Indirizzo di posta elettronica dell'HCP.],
    [DIGITAL_ATTITUDE],[Indice del comportamento e della propensione digitale dell'HCP tracciato dall'azienda nel 2023. Sebbene la variabile non presenti aggiornamenti recenti, è stata mantenuta come potenziale feature per le analisi successive.],
    [SEGMENTATION],[Classificazione del valore strategico dell'HCP per l'azienda farmaceutica, suddivisa nei seguenti target:
    - _A_: HCP di primaria importanza ed elevato potenziale strategico.
    - _B_: HCP di rilevanza medio-alta.
    - _C_: HCP a medio-basso potenziale o con interazioni limitate.
    - _D_: HCP a basso valore prioritario per la campagna.],
    [ SPECIALTY_ONEKEY_1_DESC ],[Descrizione della specializzazione clinica primaria dell'HCP.],
    [REP_ID],[Codice identificativo del REP (rappresentante) assegnato alla gestione dell'HCP per la specifica campagna.],
    [ADOPTION_LADDER],[Indicatore dello stadio di adozione del farmaco o del brand da parte del medico (scala di adozione), categorizzato in:
    - _Tiralist_: HCP che ha iniziato a prescrivere o testare il farmaco/prodotto su un numero limitato di pazienti.
    - _Regular User_: HCP prescritore abituale che ha consolidato l'uso del prodotto nella propria pratica clinica.
    - _Non User_: HCP che non prescrive o non ha ancora adottato il prodotto.],
    [COUNTRY_ID],[Codice identificativo della nazione in cui l'HCP opera nell'ambito della campagna.],
    [REGION],[Regione di appartenenza della struttura di operatività dell'HCP.],
    [CITY],[Città in cui si trova la sede operativa dell'HCP per la campagna di riferimento.],
    [BRICK],[Codice/denominazione della micro-area geografica o sotto-distretto di vendita in cui è suddiviso il territorio aziendale (es. PAVIA 03).],
  )
)<tab:hcp>

*Seconda fase: pulizia dati mancanti o ridonanti* \
Successivamente alla selezione dei campi di interesse, l'analisi si è focalizzata sullo studio puntuale dei record all'interno della tabella.  \ 
Prima di procedere con la modellazione, si è reso necessario effettuare un'operazione di pulizia per garantire l'integrità dei dati, verificando la presenza di record duplicati e di valori nulli (`NULL`).

Dall'analisi esplorativa è emerso che, in diversi campi, i valori mancanti non erano rappresentati dal classico `NULL` di sistema, bensì dal carattere speciale "`?`". Questa anomalia avrebbe compromesso sia la correttezza delle query SQL (invalidando le funzioni native di gestione dei valori nulli), sia la logica stessa dell'analisi, poiché il simbolo `?` viene interpretato come una stringa valida e non vuota.

Il controllo prioritario è stato eseguito sul campo `CONTACT_ID`: trattandosi della *chiave primaria*, è stato fondamentale assicurarsi che non vi fossero identificativi nulli o ridondanti. Eventuali record duplicati o privi di chiave primaria sono stati eliminati.

Per quanto riguarda i valori mancanti riscontrati in altri campi, si è deciso di non rimuoverli immediatamente, ma di conservarli temporaneamente per valutarne l'impatto e la gestione ottimale durante le successive fasi di _feature engineering_.

#linebreak()
#figure(caption: "Pulizia tabella anagrafica.")[
```SQL
CREATE OR REPLACE TABLE clean_hcp_epi_in_scope_it AS
SELECT 
    CONTACT_ID,
    NULLIF(DIGITAL_ATTITUDE, '?') AS DIGITAL_ATTITUDE,
    NULLIF(SEGMENTATION, '?') AS SEGMENTATION,
    SPECIALTY_ONEKEY_1_DESC
FROM hcp_epi_in_scope_it
WHERE CONTACT_ID IS NOT NULL 
  AND CONTACT_ID != '?';
}
```
]

*Terza fase: studio della tabella pulita* \
L'ultimo passaggio ha riguardato l'analisi descrittiva dei singoli campi che componevano la tabella. Per ciascuna colonna sono state eseguite operazioni di aggregazione (`GROUP BY`) e conteggio dei valori distinti, al fine di valutarne la distribuzione e la rilevanza analitica. 

A tal fine, dello strumento di data visualization interattiva #linkfn("https://docs.databricks.com/aws/en/genie")[*Databricks Genie*] che opera all'interno delle _dashboard_ native in Databricks.\ L'impiego dei grafici si è rivelato fondamentale per comprendere la struttura del dataset, evidenziando trend, polarizzazioni e livelli di eterogeneità tra i gruppi di professionisti sanitari.

Dall'analisi esplorativa sono emerse le seguenti considerazioni sintetiche:
- DIGITAL_ATTITUDE: come evidenziato nella @fig:digital-attitude, il parametro presenta una buona variabilità tra gli HCP, confermandosi una variabile importante da considerare nelle analisi successive;
- SEGMENTATION: la @fig:segmentation mostra una discreta distribuzione ed eterogeneità tra le classi, rendendo la variabile utile per l'addestramento dei modelli;
- SPECIALTY_ONEKEY_1_DESC: la @fig:specialty evidenzia una forte polarizzazione delle specializzazioni, legata alla natura specifica della campagna incentrata sull'epilessia;
- ADOPTION_LADDER: presenta una distribuzione equilibrata tra i vari stadi di adozione del farmaco;
- COUNTRY_ID: privo di valore informativo ai fini della modellazione, in quanto costante su un unico Paese (Italia);
- REGION, CITY, BRICK: mostrano una buona distribuzione geografica, rivelandosi campi promettenti per le successive fasi di _feature engineering_.

#figure(
  caption: [Analisi distribuzione della _DIGITAL ATTITUDE_.],
  image(digital-attitude)
)<fig:digital-attitude>

#figure(
  caption: [Analisi distribuzione della _SEGMENTATION_.],
  image(segmentation)
)<fig:segmentation>

#figure(
  caption: [Analisi distribuzione della _SPECIALTY_.],
  image(specialty)
)<fig:specialty>

=== Analisi Tabelle delle Azioni
Sono state esaminate tre tabelle contenenti lo storico delle diverse interazioni e azioni svolte con i professionisti sanitari:
+ `visit_epi_it`. raccoglie lo storico completo delle visite svolte dai rappresentanti verso gli HCP presenti nella tabella anaagrafica;
+ `dem_epi_it`. In cui sono presenti tutti gli invii di comunicazioni DEM (_Direct Email Marketing_) e le relative interazioni effettuate da e verso gli HCP (es. aperture, click ecc.);
+ `rte_epi_it`. Analogamente al punto precedente traccia  le comunicazioni di tipo RTE (_Real-Time Email_) ovvero le e-mail inviate direttamente dai rappresentanti farmaceutici.
Anche per questo gruppo di tabelle, le attività di pulizia e l'analisi esplorativa è stata suddivisa su più fasi.

*Prima fase: comprensione del dominio e selezione delle colonne*\
L'attenzione si è inizialmente concentrata sulla comprensione del dominio concettuale dei singoli campi, avvalendosi del supporto e confronto con i referenti aziendali.

Una volta chiarita la semantica delle variabili, si è proceduto alla rimozione dei campi non rilevanti o ridondanti ai fini della modellazione. Le variabili selezionate per le tre tabelle sono riportate dettagliatamente nelle @tab:visit e @tab:dem-rte.
#set table(
  align: (center+horizon, center+horizon), 
)
#figure(
  caption: [Campi della tabella `visit_epi_it`.],
  table(
    columns: 2,
    table.header([*Campo*], [*Spiegazione*]),
    [SLICE],[
    Tipologia di interazione tracciata nel record (per questa tabella assume valore costante "`VISIT`").],
    [KEY_COUNTRY_CONTACT],[
    Chiave composta (prefisso `COUNTRY_ID` e `CONTACT_ID`) che costituisce la *chiave esterna* per collegare l'azione all'anagrafica dell'HCP.],
    [DATE_SQL],[Data e ora in cui è stata eseguita la visita.],
    [CALL_TYPE],[Il tipo di visita eseguita. Che si suddivide tra:
    - "_VisitF2F_": interazione in presenza (Face-to-Face;
    - "_PhoneCall_": contatto o colloquio telefonico;
    - "_VideoCall_": interazione da remoto o in videoconferenza. ],
    [HAS_CLM],[Flag binaria che indica l'impiego di CLM (_Closed-Loop Marketing_), ossia presentazioni digitali interattive a supporto del rappresentante:
      - `1`: utilizzo di materiale CLM durante la visita;
      - `0`: visita effettuata senza ausilio di CLM.],
    [KEY_MESSAGES], [Messaggi chiave presentati durante l'uso del CLM:
    - #underline[nel caso di utilizzo di CLM] specifica il dettaglio della pagina/diapositiva mostrata (generando un record per ciascuna pagina vista);
    - #underline[altrimenti] riporta il valore "`-1`" ]
  )
)<tab:visit>

#set table(
  align: (center+horizon, center+horizon), 
)
#figure(
  caption: [Campi delle tabelle `dem_epi_it` e `rte_epi_it`.],
  table(
    columns: 2,
    table.header([*Campo*], [*Spiegazione*]),
    [SLICE],[
    Canale di comunicazione a cui si riferisce il record (rispettivamente `"DEM"` o `"RTE"`).],
    [KEY_COUNTRY_CONTACT],[*Chiave esterna* di collegamento con la tabella anagrafica degli HCP.],
    [ACTION],[Tipologia di interazione registrata sulla comunicazione e-mail, l'interazione può essere:
    - "_SENT_": mail inviata con successo all'HCP;
    - "_OPEN_": mail aperta dal destinatario;
    - "_CLICK_": interazione con i link o contenuti presenti nel corpo della mail.
    #underline[Solo per le comunicazioni RTE]:
    - "_BOUNCED_": nmancata consegna della mail (indirizzo non valido o errore di recapito).],
    [DATE_SQL],[Data e ora in cui si è verificata la specifica azione ("_ACTION_").]
  )
)<tab:dem-rte>
*Seconda fase: pulizia dati*\
In questa fase sono stati condotti controlli analoghi a quelli descritti per la tabella anagrafica (@cap:analisi-tab-anagrafica), procedendo alla bonifica dei valori nulli e anomali.

Inoltre, si è resa necessaria una trasformazione specifica sulla chiave esterna `KEY_COUNTRY_CONTACT`. Per agevolare le successive operazioni di congiunzione (`JOIN`) tra le tabelle delle azioni e la tabella anagrafica, la colonna è stata ridenominata in `CONTACT_ID` e opportunamente manipolata tramite una stringa di taglio (@cod:trim).

Originalmente, la variabile `KEY_COUNTRY_CONTACT` conteneva un prefisso numerico relativo al Paese, concatenato all'identificativo del contatto tramite un carattere di *underscore* (ad esempio, `3000008_CN60556O-8V51-4667-9436-R7E5446799U9`). L'anagrafica riportava invece il solo codice `CONTACT_ID` (es. `CN60556O-8V51-4667-9436-R7E5446799U9`). Si è pertanto estratta esclusivamente la componente alfanumerica successiva al separatore, garantendo la perfetta corrispondenza tra le chiavi.

#linebreak()
#figure(caption: "Trim su `KEY_COUNTRY_CONTACT`.")[
```SQL
TRIM(SUBSTRING(KEY_COUNTRY_CONTACT FROM POSITION('_' IN KEY_COUNTRY_CONTACT) + 1)) AS CONTACT_ID, 
```
]<cod:trim>

È stato inoltre riscontrato un disallineamento nei tipi di dato del campo `DATE_SQL`: in alcune tabelle la variabile era memorizzata sotto forma di stringa (sebbene rispettasse il formato temporale), mentre in altre era già definita come tipo di dato temporale. Si è quindi proceduto preventivamente alla loro uniformazione, convertendo tutte le colonne al tipo `TIMESTAMP`.

Successivamente, si è scelta la rimozione dell'informazione relativa all'orario, mantenendo la sola componente della data (`DATE`). Questa decisione è stata guidata da due considerazioni principali:
- *Assenza di valore informativo sulle visite*: dall'analisi esplorativa è emerso che tutti i record della tabella `visit_epi_it` riportavano come orario la mezzanotte precisa (`00:00:00`), segnaposto predefinito al momento della registrazione del dato;
- *Riduzione del rumore*: per le tabelle delle e-mail (`dem_epi_it` e `rte_epi_it`), data la quantità complessiva di record a disposizione, un livello di granularità orario avrebbe introdotto un'eccessiva varianza, fungendo da rumore nei modelli di apprendimento.
È opportuno precisare che la rinuncia al dettaglio orario rappresenta una scelta metodologica legata agli obiettivi e alla dimensione del dataset attuale; l'informazione oraria rimane un elemento potenzialmente utile per sviluppi futuri e modelli con una maggiore precisione.

In ultima battuta, si è deciso di unificare le tre tabelle delle azioni (`rte_epi_it`, `dem_epi_it` e `visit_epi_it`) all'interno di un unico dataset consolidato. Le colonne non presenti in tutte le tabelle sorgente sono state conservate nello schema finale, popolandole con valori `NULL` per le tipologie di azione in cui non trovarono applicazione.

La scelta dell'unione è stata guidata da una motivazione metodologica: tutte e tre le sorgenti tracciano interazioni ed eventi direttamente afferenti al singolo HCP. Per poter studiare in modo organico l'attitudine del professionista sanitario e valutare la risposta alle diverse sollecitazioni, si è rivelato fondamentale disporre di una visione d'insieme dell'intero storico omnicanale.

A tale scopo è stata creata la tabella `clean_all_epi_it`, che accentra l'insieme delle interazioni svolte e costituisce la base dati primaria per la successiva fase di modellazione.


*Terza fase: analisi esplorativa del dataset unificato (`clean_all_epi_it`)*\
Analogamente a quanto fatto per la tabella anagrafica, l'analisi esplorativa è stata condotta integrando i notebook di Databricks con gli strumenti di _Data Visualization_ aziendali.

Dallo studio delle interazioni sono emerse le seguenti considerazioni sintetiche:
- *Sbilanciamento del canale RTE*: le comunicazioni di tipo *RTE* rappresentano soltanto il 6,84% del totale delle azioni (@fig:perc-azioni). Pur riflettendo la realtà operativa (in cui gli invii personalizzati dei REP sono quantitativamente inferiori alle campagne massive), questo #underline[sproporzionato volume (_class imbalance_) costituisce una criticità per i futuri algoritmi di Machine Learning], che potrebbero faticare a trarre pattern significativi o scartare la variabile;
- *Polarizzazione delle interazioni e-mail*: come evidenziato nella @fig:distr-azioni-web, #underline[le azioni sulle mail sono polarizzate sullo stadio di invio (`SENT`)]. Si riscontra inoltre la presenza di un #underline[numero non trascurabile di eventi `BOUNCED`] (indirizzi non raggiungibili). Confrontando le campagne *DEM* (@fig:distr-azioni-DEM) e *RTE* (@fig:distr-azioni-RTE), il trend rimane analogo (prevalenza di `SENT`), ad eccezione del #underline[tasso di `CLICK`, proporzionalmente più elevato negli RTE]: questo comportamento rispecchia la natura personalizzata del canale diretto;
- *Predominanza e disallineamento temporale delle visite*: le visite tradizionali (@fig:distr-azioni-VISIT) mostrano una #underline[marcata preferenza per la modalità in presenza (*Face-to-Face*)], la quale copre circa l'87,80% delle 42.392 interazioni registrate. Tuttavia, dall'analisi temporale (@fig:distr-azioni-time-VISIT) emerge un disallineamento strutturale: i dati sulle visite in presenza partono da inizio 2019, mentre le altre tipologie di visita registrano eventi solo a partire da fine 2019 / inizio 2020;
- *Disallineamento temporale macro-canale (Digital vs F2F)*: il divario temporale appare ancora più evidente nell'analisi aggregata delle macro-azioni (@fig:distr-azioni). Mentre lo storico delle visite gestite dagli ISF copre l'intero intervallo a partire dal 2019, i canali digitali (DEM e RTE) presentano volumi solo a partire da metà 2022. Questa asimmetria di circa due anni e mezzo attribuisce un peso sproporzionato al canale fisico rispetto a quello digitale, #underline[potendo introdurre un _bias_ nelle analisi storiche di ingaggio].

#figure(
  caption: [Analisi distribuzione delle possibili azioni.],
  image(perc-azioni, height: 30%, width: 60%)
)<fig:perc-azioni>

#figure(
  caption: [Analisi distribuzione delle azioni digitali.],
  image(distr-azioni-web)
)<fig:distr-azioni-web>

#figure(
  caption: [Analisi distribuzione delle azioni tra le visite.],
  image(distr-azioni-VISIT, width: 90%)
)<fig:distr-azioni-VISIT>

#figure(
  caption: [Analisi distribuzione delle azioni tra gli RTE nel tempo.],
  image(distr-azioni-RTE)
)<fig:distr-azioni-RTE>

#figure(
  caption: [Analisi distribuzione delle azioni tra i DEM nel tempo.],
  image(distr-azioni-DEM)
)<fig:distr-azioni-DEM>

#figure(
  caption: [Analisi distribuzione delle azioni tra le visite nel tempo.],
  image(distr-azioni-time-VISIT)
)<fig:distr-azioni-time-VISIT>

#figure(
  caption: [Analisi distribuzione delle azioni nel tempo.],
  image(distr-azioni)
)<fig:distr-azioni>

== Profilazione della Digital Attitude tramite Clustering
Entrando nel vivo del progetto, bisogna ora passare alla fase di profilazione degli HCP in base all'attitudine digitale degli stessi
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
