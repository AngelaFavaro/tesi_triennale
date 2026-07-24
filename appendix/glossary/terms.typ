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
)
)
