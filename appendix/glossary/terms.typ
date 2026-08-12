#let glossary-terms = (
(
  key: "bi",
  short: [BI],
  long: [Business Intelligence],
  description: [Insieme di modelli, processi, competenze e tecnologie abilitanti volti a raccogliere, integrare, analizzare e trasformare i dati grezzi aziendali in informazioni strutturate e di valore strategico. Si focalizza primariamente sull'analisi descrittiva e diagnostica delle performance storiche e correnti dell'organizzazione. L'obiettivo fondamentale della BI è supportare i decisori aziendali (_stakeholder_) nel prendere decisioni strategiche e operative più rapide, efficaci e basate su evidenze oggettive (_data-driven_), riducendo i margini di incertezza e ottimizzando i processi di business.]
),
(
  key: "ba",
  short: [BA],
  long: [Business Analytics],
  description: [Insieme di metodologie, tecnologie statistico-matematiche e strumenti software focalizzati sull'esplorazione iterativa e sull'analisi quantitativa dei dati aziendali. Un approccio prevalentemente predittivo e prescrittivo. Attraverso l'applicazione di modelli statistici avanzati, algoritmi di Machine Learning, data mining e tecniche di simulazione, identifica pattern nascosti, prevede trend di mercato futuri e automatizza i processi decisionali, trasformando la conoscenza estratta dai dati in un vantaggio competitivo misurabile.]
),
(
  key: "poc",
  short: [PoC],
  long: [Proof of Concept],
  description: [Realizzazione preliminare, incompleta o in scala ridotta di un progetto software, di un algoritmo o di un'architettura tecnologica, sviluppata al fine di dimostrarne la fattibilità tecnica e la validità concettuale prima di procedere con l'effettiva implementazione su larga scala.]
),
(
  key: "dashboard",
  short: [dashboard],
  description: [
    Interfaccia grafica centralizzata che organizza, visualizza e presenta in modo sintetico e intuitivo le metriche chiave e le informazioni aziendali fondamentali per il monitoraggio di un determinato processo o business.
  ]
),
(
  key: "insight",
  short: [insight],
  long: [Data insight],
  description: [
    Comprensione profonda, chiara e precedentemente non evidente di uno specifico fenomeno o comportamento, ottenuta attraverso l'elaborazione, l'analisi e l'interpretazione di grandi volumi di dati. Nel contesto degli Advanced Analytics e del Machine Learning, la generazione di insight di valore è l'obiettivo fondamentale che permette di guidare le strategie prescrittive, come l'individuazione della Next Best Action ottimale.
  ]
),
(
  key: "clustering",
  short: [Clustering],
  description: [
    Tecnica di apprendimento non supervisionato (_Unsupervised Learning_) finalizzata al raggruppamento di un insieme di oggetti o record di un dataset in classi (dette cluster) omogenee.
  ]
),
(
  key: "forecasting",
  short: [Forecasting],
  long: [Analisi predittiva temporale],
  description: [
    Processo di stima e previsione dell'evoluzione futura di una specifica variabile quantitativa, basato sull'analisi storica di serie temporali e trend passati.
  ]
),
(
  key: "data-science",
  short: [Data-Science],
  description: [
    Disciplina interdisciplinare che combina metodi scientifici, processi statistico-matematici, algoritmi di Machine Learning e sistemi informatici al fine di estrarre conoscenza, pattern complessi e insight di valore da grandi volumi di dati strutturati e non strutturati.
  ]
),
(
  key: "data-visualization",
  short: [Data Visualization],
  description: [
    Insieme di tecniche, metodologie e strumenti grafici volti a rappresentare visivamente dati e informazioni complesse. Attraverso l'uso di elementi visivi come grafici, mappe, diagrammi e dashboard interattive, la Trasforma dati grezzi o output di modelli analitici in formati intuitivi e di immediata comprensione.
  ]
),
(
  key: "lakehouse",
  short: [Data Lakehouse],
  description: [
    Architettura di gestione dati che combina gli elementi chiave dei Data Lake (scalabilità, flessibilità e costi contenuti nel salvataggio di dati strutturati e non) con le funzionalità tipiche dei Data Warehouse (prestazioni elevate, consistenza delle transazioni ACID, supporto a query SQL e governance del dato). Consente di eseguire sia analisi di Business Intelligence sia flussi di Data Science e Machine Learning su un'unica piattaforma integrata.
  ]
),
(
  key: "lake",
  short: [Delta Lake],
  description: [
    Formato di archiviazione open-source basato su file Parquet che aggiunge un livello di affidabilità, governance e prestazioni ai Data Lake. Sviluppato da Databricks, abilita l'architettura Data Lakehouse introducendo il supporto alle transazioni ACID, l'applicazione rigida dello schema (schema enforcement), l'indicizzazione avanzata e il versionamento dei dati (time travel), consentendo di interrogare e ripristinare lo stato storico delle tabelle.
  ]
),
(
  key: "ml-flow",
  short: [MLFlow],
  description: [
    Piattaforma open-source per la gestione end-to-end del ciclo di vita dei modelli di Machine Learning. Sviluppata da Databricks, offre strumenti integrati per il tracciamento degli esperimenti e dei parametri (MLflow Tracking), la riproducibilità del codice (MLflow Projects), il salvataggio e la gestione dei formati di modello (MLflow Models) e un registro centralizzato per il versionamento e il deployment (MLflow Model Registry).
  ]
),
(
  key: "varianza",
  short: [varianza],
  description: [
    Misura statistica della dispersione dei dati rispetto alla loro media. Indica quanto, mediamente, i valori di un insieme di dati si discostano dalla media, considerando il quadrato degli scostamenti.
  ]
),
(
  key: "cl-gerarchico",
  short: [Clustering Gerarchico],
  description: [
    Tecnica di clustering che raggruppa progressivamente gli elementi in base alla loro similarità, creando una struttura gerarchica di gruppi (_cluster_).
    Il processo può partire da singoli elementi, che vengono via via uniti nei gruppi più simili, oppure da un unico gruppo che viene progressivamente suddiviso.
  ]
),
(
  key: "dbscan",
  short: [DBSCAN],
  description: [
    Algoritmo di clustering basato sulla densità che raggruppa gli elementi che si trovano in aree ad alta concentrazione e identifica come “rumore” o outlier gli elementi isolati.
    A differenza di altri metodi di clustering, non richiede di stabilire in anticipo il numero di cluster. È particolarmente utile per individuare gruppi di forma irregolare e dati anomali.
  ]
),
(
  key: "inerzia",
  short: [inerzia],
  description: [
    Misura della dispersione dei punti all’interno dei cluster rispetto al centroide del proprio cluster.
    Indica quanto gli elementi di ciascun gruppo sono vicini o lontani dal proprio centro. Un valore di WCSS più basso indica cluster più compatti e quindi, generalmente, una maggiore coesione interna.
  ]
),
(
  key: "gr-boosting",
  short: [Gradient Boosting],
  description: [
    Tecnica di machine learning che combina in modo sequenziale più modelli semplici, generalmente alberi decisionali, per costruire un modello predittivo più accurato.
    Ogni nuovo modello viene addestrato per correggere gli errori commessi dai modelli precedenti. Il risultato finale è quindi l’insieme dei contributi di tutti i modelli costruiti progressivamente.
  ]
),
(
  key: "stocastico",
  short: [stocastico],
  description: [
    Si dice di un processo, fenomeno o sistema il cui comportamento è governato da leggi probabilistiche e dal caso, invece che da regole deterministiche. In un processo stocastico, dato un determinato stato iniziale, non è possibile predire con certezza l'esito futuro, ma solo la probabilità con cui i diversi risultati si possono verificare.
  ]
),
(
  key: "one-hot-encoding",
  short: [One-Hot Encoding],
  description: [
    Tecnica di pre-elaborazione dei dati usata nel Machine Learning per convertire variabili categoriali in un formato numerico binario. Per ciascuna categoria unica della variabile viene creata una nuova colonna (chiamata _dummy variable_): la colonna assume valore 1 in corrispondenza della classe appartenente e 0 per tutte le altre, evitando di introdurre relazioni d'ordine artificiali tra le categorie.
  ]
),
(
  key: "label-encoding",
  short: [Label Encoding],
  description: [
    Tecnica di pre-elaborazione dei dati che converte ciascuna categoria unica di una variabile categoriale in un valore numerico intero (es. da 0 a $N-1$). A differenza del One-Hot Encoding, non crea nuove colonne, ma sostituisce direttamente le stringhe con numeri. 
  ]
),
(
  key: "recall",
  short: [Recall],
  description: [
    Metrica di valutazione delle performance di un modello di classificazione che misura la capacità dell'algoritmo di individuare tutti i casi reali appartenenti a una determinata classe. Corrisponde alla percentuale di veri positivi identificati rispetto al totale dei casi reali positivi ($"Veri Positivi" / ("Veri Positivi" + "Falsi Negativi")$). Risulta particolarmente critica in scenari in cui mancare un evento positivo comporta un costo elevato.
  ]
),
(
  key: "accuracy",
  short: [Accuracy],
  description: [
    Metrica di valutazione generale che misura la percentuale di predizioni corrette effettuate dal modello rispetto al totale delle osservazioni analizzate. Corrisponde al rapporto tra la somma di veri positivi e veri negativi e il numero totale di casi. Pur essendo immediata da interpretare, può risultare ingannevole in presenza di dataset fortemente sbilanciati, dove tende a sovrastimare le performance del modello se questo favorisce la classe maggioritaria.
  ]
),
)
