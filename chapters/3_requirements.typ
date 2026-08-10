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
#let elbow = "../images/elbow.png"
#let heat-cluster = "../images/heat-cluster.png"
#let distrib-cluster = "../images/distrib-cluster.png"
#let feature-cluster = "../images/feature-imp.png"

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
Entrando nel vivo del progetto, si passa alla fase di profilazione degli HCP in base all'attitudine digitale degli stessi. \ A questo scopo la richiesta è stata di creare un algoritmo di Clustering che potesse supportare la richiesta.\
In accordo con le linee guida espresse dal team aziendale, l'algoritmo individuato per la profilazione è stato il *K-Means*. 

In accordo con il team aziendale, sono stati presi in considerazione più algoritmi di *Clustering* non supervisionato, valutandone l'applicabilità al caso di studio:
- *Clustering Gerarchico*: è stato immediatamente scartato a causa dell'elevata complessità computazionale ($cal(O)(n^3)$ nel caso generale o $cal(O)(n^2)$ nelle versioni ottimizzate). Rispetto a questo, il K-Means garantisce una complessità lineare $cal(O)(n dot k dot i dot d)$, risultando nettamente più efficiente e scalabile;
- *DBSCAN*: questo approccio basa la clusterizzazione sul concetto di _Nearest Neighbor_ e sulla densità locale, identificando i gruppi senza imporre un numero fisso di cluster e classificando i punti isolati come _outlier_. Tuttavia, per garantire la stabilità e la riuscita della segmentazione aziendale, si è preferito un modello basato su *centroidi* (K-Means). \ Di fatti il vero discriminante metodologico risiede nella possibilità di determinare e controllare preventivamente un numero di cluster $k$ "sicuro" e ben definito tramite l'esame dell'_Elbow Method_ (spiegato nella @cap:sviluppo-cluster). 
 
Queste motivazioni, unite alla necessità aziendale di assegnare ogni singolo HCP a un profilo e di disporre di una metodologia facilmente interpretabile, ha confermato il K-Means come la scelta ottimale per il progetto.

=== K-Means: Fondamenti Teorici
Il K-Means è un algoritmo di partizionamento non supervisionato che ha lo scopo di suddividere un insieme di $n$ osservazioni $X = {x_1, x_2, ..., x_n}$ in $k$ cluster distinti $C = {C_1, C_2, ..., C_k}$, dove *$k$ rappresenta un iperparametro prefissato*.

Matematicamente, l'algoritmo mira a minimizzare la varianza interna ai cluster, nota come _Within-Cluster Sum of Squares_ (WCSS) o *Inerzia*, definita dalla seguente funzione obiettivo:

$ J = sum_(i=1)^k sum_(x in C_i) || x - mu_i ||^2 $

dove $mu_i$ rappresenta il *centroide* (il punto medio) del cluster $C_i$, e $|| x - mu_i ||^2$ indica la distanza euclidea al quadrato tra l'osservazione $x$ e il centroide $mu_i$.

L'algoritmo opera attraverso un processo iterativo ben definito.

Nella fase iniziale di *inizializzazione*, vengono individuati $k$ punti nello spazio delle *feature* da assumere come centroidi di partenza $mu_1, ..., mu_k$.

Successivamente, nella fase di *assegnazione*, ciascuna osservazione $x_j$ viene associata al cluster il cui centroide risulta geometricamente più vicino secondo la distanza euclidea:

$ C_i = { x_j : || x_j - mu_i || <= || x_j - mu_l || quad forall l, 1 <= l <= k } $

A questo punto si passa alla fase di *aggiornamento*, in cui viene ricalcolata la posizione di ciascun centroide $mu_i$ come media aritmetica di tutte le osservazioni correntemente assegnate a quel determinato gruppo:

$ mu_i = 1 / (|C_i|) sum_(x in C_i) x $

Infine, nella fase di *convergenza*, i passaggi di assegnazione e aggiornamento vengono ripetuti ciclicamente fino a quando la posizione dei centroidi non varia più in modo significativo, ovvero fino a quando lo scostamento dell'inerzia $J$ scende sotto una soglia di tolleranza $epsilon$ prestabilita, o al raggiungimento del numero massimo di iterazioni consentite.


=== Feature Engineering per la misura dell'Attitudine Digitale

A partire dal dataset consolidato `clean_all_epi_it`, la fase di Feature Engineering è stata progettata per trasformare le interazioni puntuali degli HCP in variabili sintetiche relative a una finestra temporale recente di 120 giorni, questo per garantire che i cluster siano aggiornati relativamente agli ultimi atteggiamenti digitali degli HCP e non abbiano _bias_ relativi ai comportamenti molto vvecchi degli stesso. \ La finestra temporale, in ogni caso, può essere facilmente ampiata o diminuita. 

La logica implementata adotta un *approccio ibrido*: prima di somministrare i dati all'algoritmo di Machine Learning, si applica una segmentazione deterministica (_Rule-Based_) per escludere o etichettare le casistiche aziendali che non richiedono o non possono beneficiare dell'algoritmo di clustering e rischierebbero altrimenti di creare rumore all'interno del modello.

==== Regole Deterministiche

Tramite query SQL e metriche di *Recency* e *Frequency*, ciascun HCP viene analizzato e categorizzato in quattro gruppi principali:

- *_UNTOUCHED / NEW-EXPLORATION_*: identifica i medici mai contattati o per i quali non figura alcuna interazione registrata nello storico;
- *_INACTIVE / DORMANT_*: racchiude gli HCP che non hanno registrato alcuna attività negli ultimi 120 giorni;
- *_BOUNCED / INVALID_*: individua i contatti con problemi di raggiungibilità sul canale e-mail, definiti da una soglia critica di _bounce_ registrati nell'ultimo quadrimestre (`DEM_Bounce_120gg >= 5`);
- *_ELIGIBLE_FOR_ML_*: include tutti gli HCP attivi che non ricadono nelle categorie precedenti. #underline[Solo questa coorte] viene fatta proseguire verso la successiva fase di calcolo delle _feature_ ed elaborazione da parte del K-Means.

==== Ingegnerizzazione delle Feature per il Machine Learning

Per gli HCP appartenenti alla classe `ELIGIBLE_FOR_ML`, il codice calcola un set di *feature* derivate e normalizzate tramite funzioni PySpark. Tali variabili mirano a catturare l'intensità di ingaggio, la preferenza di canale e la reattività digitale e sono presentati in @tab:feature-clustering.

#set table(
  align: (center+horizon, center+horizon), 
)
#figure(
  caption: [Feature individuate per l'algoritmo di clustering.],
  table(
    columns: 2,
    table.header([*Feature*], [*Descrizione*]),
    [_*Monthly Interaction Intensity*_],[Volume medio mensile di interazioni totali sostenute dall'HCP (somma di contatti digitali e visite sul territorio, normalizzata sui 4 mesi della finestra analizzata).],
    [_*Digital Open Rate*_],[Percentuale di e-mail aperte rispetto al totale degli invii ricevuti. Per mitigare anomalie di tracciamento o aperture multiple, il valore viene limitato a un tetto massimo del 100% ($1.0$).],
    [_*Share of F2F*_],[Peso percentuale delle visite fisiche in presenza (_Face to Face_) sul totale delle interazioni svolte dai rappresentanti sul territorio.],
    [_*Share of Remote*_],[quota percentuale di visite effettuate a distanza via *Remote Call* sul totale delle visite territoriali.],
    [_*Digital Engagement Rate*_],[Qualità dell'interesse digitale dell'HCP, definita come la percentuale di e-mail che hanno generato un *click* sul totale delle e-mail effettivamente aperte.],
    [_*Share of Digital*_],[Inclinazione al macro-canale del medico, ovvero la percentuale di interazioni digitali (aperture DEM e RTE) sul totale complessivo delle interazioni ricevute (digitali + visite);],
    [_*RTE Preference Ratio*_],[Preferenza relativa all'interno del canale e-mail, misurando la quota di aperture di mail inviate direttamente dal REP (_Rep-Triggered Email_) rispetto al totale delle aperture digitali.],
  )
)<tab:feature-clustering>

#quote[
    _Nota metodologica sulla multicollinearità_: la quota delle chiamate telefoniche (_Phone Call_) non è stata inserita intenzionalmente come variabile indipendente per evitare problemi di multicollinearità perfetta nei modelli, essendo linearmente dipendente dalle altre due modalità sul territorio (_Face to face_ e _Remote Call_).
] 

Le variabili così ingegnerizzate vengono infine salvate in modalità nella tabella di _staging_ Delta `stg_segmentation_raw_features`, pronta per essere sottoposta alle successive fasi di scaling/standardizzazione e segmentazione via K-Means.

=== Implementazione, Addestramento e Valutazione del modello <cap:sviluppo-cluster>
==== Implementazione
La seconda macro-fase della pipeline riguarda l'addestramento dell'algoritmo di Clustering, la mappatura logico-commerciale dei gruppi ottenuti e il calcolo delle metriche di comportamento temporale (latenza).

I dati appartenenti alla coorte `ELIGIBLE_FOR_ML` vengono convertiti in ambiente Pandas per l'elaborazione vettoriale. Prima della somministrazione all'algoritmo, si procede alla normalizzazione tramite `StandardScaler`, la quale trasforma ciascuna variabile affinché abbia media nulla e varianza unitaria.

Successivamente, per rispondere a precise direttive di strategia _omnichannel_ è stata applicata una *pesatura differenziata* (+50%) su due variabili chiave:
- `Share_of_F2F`: incrementata del fattore $1.5$ per dare maggior risalto al canale in presenza;
- `Share_of_Digital`: incrementata del fattore $1.5$ per enfatizzare la reattività complessiva al canale digitale.

Tale pesatura consente di guidare lo spazio delle distanze euclidee, forzando l'algoritmo a separare in modo più netto i profili fisici da quelli digitali.

==== Addestramento
Prima di procedere all'addestramento, l'iperparametro $k$ (il numero finale di cluster) è stato individuato in modo analitico tramite l'*Elbow Method* (Metodo del Gomito) in @fig:elbow. 

#pad(left: 1em)[
  #quote[
  _Come funziona l'Elbow Method_: si esegue l'algoritmo K-Means per un intervallo di valori di $k$ (in questo caso da $1$ a $14$), calcolando per ciascuna iterazione l'Inerzia (WCSS), ovvero la somma delle distanze al quadrato tra ogni punto e il relativo centroide. 
  
  Graficando il valore del WCSS in funzione di $k$, la curva decresce monotonicamente: all'aumentare dei cluster, i punti sono più vicini ai centroidi. Il valore ottimale di $k$ corrisponde al punto di flesso della curva (il "gomito"), ovvero la soglia oltre la quale l'aggiunta di un ulteriore cluster porta a una riduzione trascurabile dell'inerzia, evitando sia il _underfitting_ sia il _overfitting_ della segmentazione.
  ]
]

#figure(
  caption: [Analisi sulla scelta di _k_ utilizzando l'_Elbow Method_.],
  image(elbow)
)<fig:elbow>

La scelta è confluita in *$k = 8$*, sia grazie all'analisi del grafico dell'Elbow Method (@fig:elbow) sia perché, in un'ottica aziendale, questo numero di segmenti è risultato il più fluido e gestibile per le strategie di business.

Il modello K-Means viene addestrato sulle *feature* scalate e pesate attraverso il l'algoritmo di Clustering (@cod:clustering). 
#figure(caption: "Codice del modello K-Means utilizzato.")[
```python
from sklearn.cluster import KMeans

# Definizione del numero di cluster ottimale
k_ottimale = 8

# Inizializzazione e addestramento del modello K-Means
kmeans_final = KMeans(
    n_clusters=k_ottimale, 
    random_state=42, 
    n_init=10
)

# Assegnazione dei cluster ai dati scalati e pesati
pdf_features['ML_Cluster_Raw'] = kmeans_final.fit_predict(X_scaled_final)
```
]<cod:clustering>

==== Risultati del Modello
I cluster numerici generati dal modello ($0 dots 7$) sono stati sottoposti ad un processo di *mappatura supervisionata*, volto a tradurre le proprietà matematiche dei gruppi in segmenti commerciali e operativi. 

A tal fine, sono state calcolate le medie reali delle *feature* (i *centroidi*) per ciascuno degli 8 cluster attivi, la cui distribuzione percentuale (relativa a metriche quali `Digital_Open_Rate`, `Share_of_F2F` e `RTE_Preference_Ratio`) è stata visualizzata graficamente tramite la heatmap comportamentale (@fig:heat-cluster), generata in Python mediante le librerie `seaborn` e `matplotlib`.

Questa rappresentazione a matrice consente di identificare a colpo d'occhio i tratti distintivi di ciascun gruppo, garantendo al contempo la validazione della segmentazione attraverso la verifica dell'assenza di sovrapposizioni o ridondanze tra i profili creati.

#figure(
  caption: [Heatmap derivata dall'algoritmo k-Means.],
  image(heat-cluster)
)<fig:heat-cluster>

L'esame incrociato delle metriche percentuali ha permesso di definire l'identità operativa di ciascun gruppo. I dettagli e le descrizioni operative dei segmenti individuati sono riassunti nella @tab:clusters.

#set table(
  align: (center+horizon, center+horizon), 
)
#figure(
  caption: [Cluster individuati dal k-Means.],
  table(
    columns: 3,
    table.header([*N°\ Cluster*], [*Cluster*], [*Descrizione*]),
    [0],[*Omnichannel VIPs*],[Elevatissima ricettività digitale con un _Digital Open Rate_ pari al $96\%$, abbinata a un solido ingaggio sul territorio (_Share of F2F_ al $78\%$) e a una marcata quota digitale complessiva ($59\%$).],
    [1],[*Traditional F2F*],[Profilo puramente fisico, dominato da una _Share of F2F_ del $94\%$ e tassi di ingaggio digitale prossimi allo $0\%$.],
    [2],[*Digital-First \ /Mail-Only*],[Nettissima prevalenza del canale digitale (_Share of Digital_ al $92\%$) e un'ottima apertura e-mail ($65\%$), in totale assenza di interazioni in presenza ($0\%$ F2F).],
    [3],[*Science-Oriented\ (Passive)*],[Bilanciamento tra visite fisiche ($92\%$ F2F) e comunicazioni e-mail fortemente orientate ai contenuti scientifici d'informazione scientifica remota (_RTE Preference Ratio_ al $94\%$)],
    [4],[*Promo-Oriented\ (Passive)*],[Elevato ingaggio sul territorio ($99\%$ F2F) unito a una spiccata propensione all'apertura delle e-mail di prodotto o promozionali ($75\%$ Open Rate, con bassa preferenza RTE).],
    [5],[*Digital Advocates\ (Top Responders)*],[ Il segmento a più alto valore qualitativo sul digitale, registrando l'unico valore di _Digital Engagement Rate_ (click) rilevante dell'intero campione ($91\%$), unito a un'alta preferenza per comunicazioni scientifiche ($88\%$);],
    [6],[*Phone-Centric*],[Profili con valori mediamente bassi o moderati su tutti i canali principali, gestiti prevalentemente tramite contatto telefonico;],
    [7],[*Virtual-Friendly\ (Video-Call Lovers)*],[Si distingue nettamente da tutti gli altri gruppi per l'eccezionale concentrazione di visite via _Remote Call_ (_Share of Remote_ al $71\%$).],
  )
)<tab:clusters>

Parallelamente, i dati relativi ai medici precedentemente esclusi dal Machine Learning vengono recuperati e ricondotti a tre segmenti statici di business: *Onboarding (Exploration)* per i nuovi o non contattati, *Unreachable / Tech Issue* per i contatti con problemi di recapito (_bounced_), e *Dormant* per i medici inattivi negli ultimi 120 giorni.

Il dataset completo viene consolidato e persistito nella tabella Delta `hcp_final_segmentation`.

Infine, gli oggetti di trasformazione e modellazione (`StandardScaler` e il modello `KMeans` addestrato) vengono serializzati e salvati nei _Volumes_ di _Unity Catalog_. Tale approccio garantisce la #underline[riproducibilità] e la #underline[_governance_ dei modelli], consentendo di riutilizzarli in fase di _inference_ su nuovi dati senza dover riaddestrare la rete.

=== Valutazione dei Risultati
Per interpretare la rilevanza delle singole variabili nelle decisioni di partizione del K-Means, è stato addestrato un modello surrogato _Random Forest Classifier_ sugli stessi dati di input.\ L'#underline[analisi dell'indice di importanza delle _feature_] (in @fig:feature-cluster) rivela che:

- _Share of Digital_ (circa $18\%$), _RTE Preference Ratio_ (circa $17\%$) e _Monthly Interaction Intensity_ (circa $17\%$) rappresentano i #underline[tre fattori di maggior peso] decisionale. La marcata rilevanza di _Share of Digital_ valida l'efficacia della pesatura strategica (+50%) applicata in fase di pre-elaborazione;
- _Share of F2F_ ($17\%$) e _Digital Open Rate_ ($15.5\%$) forniscono un contributo determinante nel separare i medici a vocazione prevalentemente fisica da quelli ricettivi via mail;
- _Digital Engagement Rate ($8.7\%$)_ e _Share of Remote_ ($3.3\%$) agiscono come _feature_ di affinamento per isolare nicchie specifiche (come i _Digital Advocates_ o i _Video-Call Lovers_).

L'analisi quantitativa condotta sul campione totale di 702 HCP (comprendente gli 8 cluster dinamici da K-Means e le categorie statiche) evidenzia una struttura di popolazione estremamente bilanciata e coerente con la realtà di mercato, si può leggere in @fig:distrib-cluster.

Il core della popolazione aziendale è costituito dai segmenti _Science-Oriented (Passive)_ ($25.6\%$), _Traditional F2F_ ($22.8\%$) e _Promo-Oriented (Passive)_ ($19.8\%$). \
Gli _Omnichannel VIPs_ rappresentano un gruppo ad alto valore strategico ($12.7\%$).\
I segmenti digitali avanzati o di nicchia comprendono i _Digital Advocates_, i _Phone-Centric_, i _Digital-First / Mail-Only_ e i _Virtual-Friendly_.
Infine, i gruppi statici di esclusione contano _Dormant_ e _Unreachable_.

#figure(
  caption: [Importanza delle feature usate dall'algoritmo k-Means],
  image(feature-cluster,)
)<fig:feature-cluster>

#figure(
  caption: [Distribuzione dei cluster sul dataset],
  image(distrib-cluster)
)<fig:distrib-cluster>

== Modellazione predittiva per la Next Best Action (NBA)

Per la generazione dei suggerimenti relativi all'azione ottimale da intraprendere nei confronti di ciascun HCP (*_Next Best Action_*), è stato condotto uno studio e sperimentazione sulle metodologie disponibili.

Inizialmente, l'obiettivo si è focalizzato sulla valorizzazione dei segmenti comportamentali appena individuati, valutando la possibilità di riutilizzare il set di _feature_ ingegnerizzate per la profilazione anche ai fini della predizione della Next Best Action. 

In questo contesto preliminare, l'esplorazione si è sviluppata lungo due direttrici metodologiche principali:
- Catene di Markov (_Markov Chains_);
- Algoritmi basati su _Gradient Boosting_ (_CatBoost_ e _LightGBM_);

Di seguito vengono analizzate nel dettaglio le due famiglie di algoritmi, illustrando le criticità teoriche e pratiche emerse dai primi test che ne hanno determinato lo scarto nella loro formulazione iniziale, ponendo le basi per la re-ingegnerizzazione del problema e la scelta della soluzione finale basata su *_Gradient Boosting_ con LightGBM*.
=== Algoritmi scartati
==== _Markov Chains_
Nel primo esperimento applicativo, si è tentato di modellare la generazione della Next Best Action attraverso un sistema stocastico basato sulle Catene di Markov (Markov Chains).

Nel contesto del progetto, si è pensato di adattare questo quadro teorico definendo uno spazio degli stati finito $S$ corrispondente alle tipologie di azione eseguibili nei confronti dell'HCP:
$ S = \{"Face to Face", "Video Call", "Phone Call", "Send DEM", "Send RTE"\} $

Per ciascuno degli 8 cluster identificati nella fase di _clustering_, si è pensato di costruire una specifica #underline[matrice di transizione delle probabilità] $P^{(k)}$, derivata dalla distribuzione empirica delle _feature_ comportamentali. 

Per rendere la rete maggiormente dinamica e aderente al contesto aziendale, si voleva integrare il modello con:
1. *Moltiplicatori di peso* basati sull'attitudine digitale dell'utente (`DIGITAL_ATTITUDE`);
2. Una funzione di *Reward* (ricompensa) calibrata sulla segmentazione di business dell'HCP;
3. Un'estensione dell'ordine della catena (*High-Order Markov Chain*), configurata per considerare gli ultimi 3 stati storici registrati dall'HCP ($S_{t-2}, S_{t-1}, S_t$), al fine di guidare la decisione della transizione successiva $S_{t+1}$.

Nonostante i tentativi di arricchimento contestuale, *l'approccio è stato formalmente scartato* in accordo con i referenti aziendali, per le seguenti motivazioni:

- #underline[Natura eccessivamente stocastica/probabilistica]: la matrice di transizione tendeva a suggerire azioni basate su frequenze statistiche aggregate, faticando a catturare i pattern individuali o le anomalie comportamentali del singolo medico;
- #underline[Limite strutturale della Proprietà di Markov]: sebbene l'estensione ad un ordine superiore ($p=3$) tentasse di mitigare l'assenza di memoria, la natura essenzialmente "locale" del modello si è dimostrata un limite invalidante. L'evoluzione della relazione tra l'ISF e l'HCP richiede la valutazione dell'intero storico longitudinale del contatto (es. latenze sul lungo periodo, stagionalità, trend di reattività);
- #underline[Incapacità di generalizzazione]: il modello risultava rigido e poco incline ad adattarsi rapidamente a repentini cambi di ingaggio dell'HCP senza dover ricalcolare interamente le matrici di probabilità.

Si è dunque deciso di abbandonare i modelli stocastici di transizione in favor di un approccio di Machine Learning classico con apprendimento supervisionato.
==== _Gradient Boosting_ con _CatBoost_

=== Predizione NBA: _Gradient Boosting_ con _LightGBM_
==== Ingegnerizzazione delle variabili

==== Addestramento del classificatore e taratura dei parametri

==== Valutazione delle performance

== Caso d'uso applicativo ed integrazione nei processi aziendali