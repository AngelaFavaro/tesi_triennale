#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *
#import "../config/thesis-config.typ": gl, glpl, glossary-style, linkfn

#let logo-bluebi = "../images/logo-blue-bi.png"

= Introduzione <cap:introduzione>
#text(style: "italic", [
    Questo capitolo darà una panoramica descrittiva dell'azienda Blue BI. Verrà presentato il progetto proposto dall'azienda e verranno infine esposte le motivazioni che hanno portato alla scelta di collaborazione al progetto.
])
#v(1em)

== L'azienda
#align(center, image(logo-bluebi, width: 35%))

*Blue BI* è una società specializzata nel campo della Business Intelligence e Analytics con una consolidata esperienza nel disegno, implementazione e gestione di sistemi di analisi delle performance. 

Opera sul territorio nazionale attraverso cinque sedi operative situate a Milano, Roma, Torino, Vicenza e Cesena. \ Le collaborazioni con i partner e i clienti si estendono su molteplici settori industriali, tra cui Fashion e Lusso, Media e Comunicazioni, Farmaceutica, Consulenza Business, Servizi Professionali, Assicurazioni e Banche, Trasporti e Logistica, Manifattura industriale e Hospitality.

L'azione e la cultura di Blue BI si fondano su un insieme di *valori portanti*. L'attività quotidiana è guidata da elevati standard di _eccellenza e integrità_ professionale, supportati da un costante impegno nell'_apprendimento continuo_ per rispondere con prontezza alle evoluzioni del mercato. L'ambiente di lavoro promuove il _rispetto reciproco e l'inclusione_, incoraggiando la _collaborazione_ per garantire un clima collettivo sereno e gratificante. Infine, l'azienda individua nella _resilienza_ e nella _crescita individuale_ i motori fondamentali per lo sviluppo del talento, dell'imprenditorialità e il raggiungimento di traguardi comuni.


Il portafoglio dei *servizi offerti* si articola principalmente su tre direttrici strategiche:
+ _Consulenza_ \ attività che spaziano dalla realizzazione di Proof of Concept (PoC) alla selezione del software più idoneo, passando per il BI Assessment e la gestione del cambiamento tecnologico (_Change Management_).
+ _Implementazione del sistema_ \ progettazione e sviluppo di architetture di Business Intelligence & Analytics, con un focus sulla rapidità di implementazione tramite soluzioni proprietarie e sul coordinamento di progetti di _roll-out_ internazionali.
+ _Mantenimento e Infrastruttura_\ erogazione di servizi di assistenza continua e manutenzione applicativa, affiancati da soluzioni in ambienti _Cloud Computing_ e _Software as a Service_ (SaaS).


L'azienda inoltre *investe nell'esplorazione di tecnologie emergenti* per anticipare le esigenze del mercato. Le principali linee di ricerca interne includono:
- Mixed Reality: studio dell'integrazione di report e grafici 2D/3D all'interno di ambienti di realtà aumentata e virtuale (AR/VR), con l'obiettivo di abilitare l'ancoraggio spaziale dei dati e migliorare l'interattività delle dashboard.
- Integrazione Chatbot: sviluppo di interfacce conversazionali avanzate con comandi vocali per rendere l'accesso ai dati aziendali e alla business intelligence più immediato e accessibile.
- GenAI: implementazione di use cases aziendali basati sui più recenti _Foundation Models_, sfruttando le API di ChatGPT e i servizi _cloud-native_ per l'estrazione di conoscenza.
- Analisi predittive: applicazione di algoritmi di Machine Learning, alberi decisionali e reti neurali per l'analisi predittiva e la modellazione statistica dei dati storici dei clienti.

In quest'ottica, sono in atto *collaborazioni* strategiche con _OpenAI_, _Amazon Web Services (AWS)_ e _Databricks_: tre piattaforme leader nel settore cloud-native che mettono a disposizione dell'azienda le tecnologie e l'infrastruttura necessarie per lo sviluppo, l'elaborazione dei dati e l'implementazione di applicazioni intelligenti di ultima generazione.

L'*obiettivo strategico* aziendale risiede proprio nel capitalizzare questi investimenti per trasformare i dati in valore reale. \ L'estrazione di _insight_ accurati e la proposta di soluzioni fortemente innovative permettono infatti ai clienti di ottimizzare i processi interni, prosperare nel proprio settore e mantenere un solido vantaggio competitivo sul mercato.

== Il progetto - ML per Campagne Omnicanale
=== Contesto
Uno specifico ambito in cui l'azienda opera è quello delle campagne di *marketing omnicanale*, che si riferisce all'uso integrato di diversi canali di comunicazione per interagire con i clienti in modo coerente e personalizzato.\ Blue BI sta sviluppando soluzioni di gestione ed analisi dei dati per questo tipo di campagne che soddisfino le esigenze del mercato moderno.

Il progetto proposto dall'azienda si concentra sull'applicazione di tecniche di Machine Learning per migliorare l'efficacia delle campagne di marketing omnicanale sul singolo.\ L'*obiettivo principale* è sviluppare modelli predittivi che consentano di segmentare gli utenti in base al loro comportamento digitale e alle loro preferenze, al fine di personalizzare le strategie di marketing e ottimizzare le interazioni con i clienti.

Il concetto chiave della predizione è quello di *_Next Best Action_ (NBA)*. \ La NBA rappresenta l'azione più appropriata da intraprendere per un determinato utente in un dato momento. \ L'implementazione di questo modello predittivo deve consentire di analizzare i dati storici degli utenti, identificare pattern comportamentali e prevedere l'azione futura che più probabilmente verrà intrapresa.

*Gli utenti* per i quali il progetto è stato pensato sono i *Rappresentati Farmaceutici (REP)* o _Sales Representatives_.\ I REP interagiscono con i professionisti del settore santario per promuovere i prodotti e fornire informazioni sui farmaci dell'azienda par la quale lavorano.

*I target* dei REP vengono chiamati *Health Care Professionals (HCP)*. Rappresentano una categoria di professionisti che opera nel settore sanitario (medici, farmacisti, ecc.) e che interagisce con le campagne di marketing delle aziende farmaceutiche. \ I comportamenti di questi professionisti tra i vari canali di comunicazione disponibili andranno studiati e compresi dal modello, al fine di presentare al REP l'azione statisticamente più efficace da intraprendere in quel determinato istante per massimizzare l'engagemente dell'HCP.

=== I Canali
Le interazioni che i REP possono avere con gli HCP si articolano tra due principali macroaree: _visite_ e _comunicazioni digitali_.

*Le visite* rappresentano l'interazione diretta tra il REP e l'HCP. \ Le visite a loro volta sono suddivise in ulteriori sottocanali quali:
- *Visite F2F (_Face to Face)_*: sono le visite in presenza, durante le quali il REP incontra fisicamente l'HCP per discutere dei prodotti e fornire informazioni dettagliate in base alla campagna di marketing in corso. \ Un REP durante la visita ad un HCP può scegliere di utilizzare strategie _*CLM (Closed-Loop Marketing)*_, in cui viene utilizzato un dispositivo digitale per presentare contenuti multimediali o di supporto alla conversazione. Le strategie CLM sono molto importanti, permettono di raccogliere dati più specifici e dettagliati sul comportamento e interazione dell'HCP consentendo di personalizzare ulteriormente le future interazioni.
- *_Phone Call_*: rappresentano le interazioni telefoniche tra il REP e l'HCP.
- *_Video Call_*: interazioni tramite videochiamata, anch'esse segnale importante del livello di digitalizzazione dell'HCP in studio.

*Le comunicazioni digitali* sono i contatti (_touch point_) attraverso canali indiretti. Principalmente tramite mail. Questi contatti sono tutti tracciati e sono fondamentali per comprendere l'engagement del singolo, sia all'interno della campagna, sia per lo studio sulla digitalizzazione dello stesso. Anche in questo caso ci sono delle divisioni interne tra le comunicazioni digitali:
- *DEM (Direct Email Marketing)*: sono le mail di campagna inviate ai vari HCP. Senza personalizzazione e spesso inviate a più target contemporaneamente. 
- *RTP (Real-Time Personalization)*: mail personalizzate per il singolo HCP. Spesso utilizzate a supporto a seguito di un contatto diretto, per fornire informazioni aggiuntive. Non sono inviate a più target contemporaneamente, ma al singolo.
=== Costruzione del Progetto
Il progetto è stato pensato in due macrofasi di ricerca tecnologica e sviluppo.

*_Prima fase: clustering_*\ In un primo momento il progetto si concentra sull'analisi dei dati storici, al fine di identificare pattern comportamentali e segmentare gli utenti in cluster (gruppi) omogenei. \ La richiesta è lo sviluppo di un modello di clustering che consenta il raggruppamento. \ Questo serve a misurare la _Digital Attitude_ di ogni HCP, ed è una misurazione fondamentale da dare ai REP durante le campagne.

*_Seconda fase: predizione_* \ I taget ora appartengono ad uno specifico cluster, si parte dunque da una base comune per tutti.\ La richiesta è la produzione di un modello predittivo che proponga un azione da eseguire verso quell'HCP in base alle ultime azioni intraprese verso lo stesso e alla risposta che il soggetto ha avuto a quelle. 


== Motivazioni di scelta del progetto
La scelta del progetto è stata ponderata sia dal contesto applicativo che da quello aziendale. 

Una prima motivazione è la curiosità per il mondo dell'analisi dei dati che, ragionevolmente, viene meno approfondito durante il percorso triennale rispetto alla classica costruzione di sistemi software. \ Essendo un aspetto interessante e da prendere in considerazione per un eventuale completamentento del percorso accademico, ha agevolato l'approfondimento sull'azienda e le proposte di progetto che essa offre.

In seconda battuta l'integrazione con le tecnolgie di Machine Learning la cui conoscenza, ad oggi, risulta irrinunciabile per un informatico. E quindi la possibilità formativa su questo campo che il progetto avrebbe potuto lasciare era un aspetto degno di considerazione. 

Ulteriormente, il contesto applicativo, e quindi il lavoro su un progetto che introduceva la difficoltà dell'interazione umana e non di semplici dati e analisi sul mercato ha aumentato la curiosità. Oltretutto il nuovo concetto di _Next Best Action_ che espande il campo della semplice predizione (_forecasting_) a quello di una specifica azione da predirre è indubbiamente curioso.

Infine, il contatto e il dialogo creatosi con i referenti aziendali nell'approfondimento della proposta è stato il tassello fondamentale. \ L'apertura e disponibilità che gli stessi hanno avuto ha facilitato la scelta di questo determinato progetto in quell'azienda a discapito di altre realtà disponibili e comunque stimolanti.  

Di fatto il progetto si differenzia considerevolmente da altri presi in considerazione nella forma e nella richiesta finale. \ Non un sistema applicativo ma la creazione di singoli modelli da studiare ed eventualmente utilizzare internamente o con i clienti del settore.