#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *
#import "../config/thesis-config.typ": gl, glpl, glossary-style, linkfn

#let logo-bluebi = "../images/logo-blue-bi.png"

= Introduzione <cap:introduzione>
#text(style: "italic", [
    Il presente capitolo è dedicato alla contestualizzazione della realtà aziendale e del progetto. Viene delineato il profilo di Blue BI. Segue una descrizione approfondita della proposta progettuale, per poi concludere con l'analisi delle motivazioni che hanno indirizzato alla scelta del progetto.
])
#v(1em)

== L'azienda
#figure(
  caption: [Logo dell'azienda Blue Bi.],
  image(logo-bluebi , width: 40%)
)

*Blue BI* è una società specializzata nel campo della #gl("bi", long: true) e #gl("ba", long: true) con una consolidata esperienza nel disegno, implementazione e gestione di sistemi di analisi delle performance. 

Opera sul territorio nazionale attraverso cinque sedi operative situate a Milano, Roma, Torino, Vicenza e Cesena. \ Le collaborazioni con i partner e i clienti si estendono su molteplici settori industriali, tra cui Fashion e Lusso, Media e Comunicazioni, Farmaceutica, Consulenza Business, Servizi Professionali, Assicurazioni e Banche, Trasporti e Logistica, Manifattura industriale e Hospitality.

L'azione e la cultura di Blue BI si fondano su un insieme di *valori portanti*. L'attività quotidiana è guidata da elevati standard di _eccellenza e integrità_ professionale, supportati da un costante impegno nell'_apprendimento continuo_ per rispondere con prontezza alle evoluzioni del mercato. L'ambiente di lavoro promuove il _rispetto reciproco e l'inclusione_, incoraggiando la _collaborazione_ per garantire un clima collettivo sereno e gratificante. Infine, l'azienda individua nella _resilienza_ e nella _crescita individuale_ i motori fondamentali per lo sviluppo del talento, dell'imprenditorialità e il raggiungimento di traguardi comuni.


Il portafoglio dei *servizi offerti* si articola principalmente su tre direttrici strategiche:
+ _Consulenza_ \ attività che spaziano dalla realizzazione di #gl("poc", long: true) alla selezione del software più idoneo, passando per il _BI Assessment_ e la gestione del cambiamento tecnologico (_Change Management_).
+ _Implementazione del sistema_ \ progettazione e sviluppo di architetture di _Business Intelligence & Analytics_, con un focus sulla rapidità di implementazione tramite soluzioni proprietarie e sul coordinamento di progetti di _roll-out_ internazionali.
+ _Mantenimento e Infrastruttura_\ erogazione di servizi di assistenza continua e manutenzione applicativa, affiancati da soluzioni in ambienti _Cloud Computing_ e _Software as a Service_ (SaaS).


L'azienda inoltre *investe nell'esplorazione di tecnologie emergenti* per anticipare le esigenze del mercato. Le principali linee di ricerca interne includono:
- _Mixed Reality_: studio dell'integrazione di report e grafici 2D/3D all'interno di ambienti di realtà aumentata e virtuale (AR/VR), con l'obiettivo di abilitare l'ancoraggio spaziale dei dati e migliorare l'interattività delle #gl("dashboard").
- Integrazione _Chatbot_: sviluppo di interfacce conversazionali avanzate con comandi vocali per rendere l'accesso ai dati aziendali e alla _business intelligence_ più immediato e accessibile.
- GenAI: implementazione di use cases aziendali basati sui più recenti _Foundation Models_, sfruttando le API di ChatGPT e i servizi _cloud-native_ per l'estrazione di conoscenza.
- Analisi predittive: applicazione di algoritmi di Machine Learning, alberi decisionali e reti neurali per l'analisi predittiva e la modellazione statistica dei dati storici dei clienti.

In quest'ottica, sono in atto *collaborazioni* strategiche con _OpenAI_, _Amazon Web Services (AWS)_ e _Databricks_: tre piattaforme leader nel settore cloud-native che mettono a disposizione dell'azienda le tecnologie e l'infrastruttura necessarie per lo sviluppo, l'elaborazione dei dati e l'implementazione di applicazioni intelligenti di ultima generazione.

L'*obiettivo strategico* aziendale risiede proprio nel capitalizzare questi investimenti per trasformare i dati in valore reale. \ L'estrazione di #gl("insight") accurati e la proposta di soluzioni fortemente innovative permettono infatti ai clienti di ottimizzare i processi interni, prosperare nel proprio settore e mantenere un solido vantaggio competitivo sul mercato.

== Il progetto <cap:desc-prog>
=== Contesto
Uno specifico ambito in cui l'azienda opera è quello delle campagne di *marketing farmaceutico omnicanale*, strategia che prevede l'uso integrato e sinergico di diversi canali di comunicazione per interagire con i clienti in modo coerente e personalizzato.\ Blue BI sta sviluppando soluzioni di gestione ed analisi dei dati per rispondere alle esigenze odierne del mercato.

Il progetto di tesi si concentra sull'applicazione di tecniche di Machine Learning per massimizzare l'efficacia delle campagne di marketing omnicanale sul singolo.\ L'*obiettivo principale* risiede nello sviluppo di modelli predittivi che consentano di segmentare i destinatari in base al loro comportamento digitale e alle preferenze manifestate, al fine di personalizzare le strategie di comunicazione e ottimizzare le interazioni complessive.

Il fulcro logico dell'attività predittiva è rappresentato dal concetto di *_Next Best Action_ (NBA)*. \ La NBA identifica l'azione o il canale di comunicazione più appropriato da proporre ad un determinato utente in un dato momento. \ L'implementazione di tale modello predittivo si basa sull'analisi approfondita dei dati storici, finalizzata ad identificare pattern comportamentali ricorrenti e prevedere l'interazione futura con la maggiore probabilità di successo.

*Gli utenti finali* per i quali il progetto è stato pensato sono i *Rappresentanti Farmaceutici (REP)* o _Sales Representatives_.\ Figure professionali che interagiscono con i professionisti del settore sanitario per svolgere attività di informazione scientifica e presentare i prodotti dell'azienda farmaceutica per cui operano.

*I destinatari* dell'attività dei REP vengono chiamati *Health Care Professionals (HCP)*. Rappresentano una categoria di professionisti che opera nel settore sanitario (medici, farmacisti, ecc.) e che interagisce con le campagne di marketing delle aziende farmaceutiche. \ Il modello predittivo analizza e intepreta i comportamenti multi-canale di questi ultimi al fine di suggerire al rappresentante l'azione statisticamente più efficace da intraprendere nella fase successiva dall'ultimo contatto, massimizzando così il livello di _engagement_ dell'HCP.

=== I Canali
Le interazioni che i rappresentanti possono avere con gli HCP si articolano tra due principali macroaree: _visite dirette_ e _comunicazioni digitali_.

*Le visite dirette* costituiscono il canale di interazione frontale tra il REP e il professionista sanitario. \ Questa categoria si suddivide a sua volta in tre specifici sottocanali:
- *Visite F2F (_Face to Face)_*: rappresentano i colloqui in presenza, durante i quali il REP incontra fisicamente l'HCP. \ In questa sede, un rappresentante può supportare la conversazione attraverso strategie di _*CLM (Closed-Loop Marketing)*_, avvalendosi di dispositivi digitali per presentare contenuti multimediali o di supporto alla conversazione. L'utilizzo del CLM è molto importante, permette infatti di registrare in background dati dettagliati sulle reazioni e sugli interessi dell'HCP; offrno una base informativa preziosa per personalizzare ulteriormente le future interazioni.
- *_Phone Call_*: rappresentano le interazioni telefoniche tra il REP ed il professionista sanitario.
- *_Video Call_*: colloqui da remoto tramite piattaforme di videoconferenza, costituiscono un indicatore rilevante del livello di digitalizzazione e della disponibilità dell'HCP all'uso di canali virtuali.

*Le comunicazioni digitali* si configurano come punti di contatto (_touchpoint_) indiretti. Principalmente veicolati tramite posta elettronica.\ Questi contatti sono tracciati ed il tracciamento è cruciale per misurare il livello di coinvolgimento (_engagement_) del singolo professionista sia all'interno della campagna, che per valutarne il grado di maturità digitale.\ All'interno di questa macroarea si distinguono:
- *DEM (_Direct Email Marketing_)*: comunicazioni inviate su scala ampia, pianificate centralmente dal reparto marketing e indirizzate a specifici segmenti di target per supportare il lancio di prodotti o la diffusione di informative scientifiche. 
- *RTE (_Real-Time Email_)*: comunicazioni elettroniche inviate in modo mirato e personalizzato al singolo HCP. Questa tipologia viene utilizzata proattivamente dal REP, solitamente a seguito di un incontro frontale (F2F o _Video Call_), per fornire materiali di approfondimento su richiesta o per dare continuità alla relazione informativa innescata dal contatto diretto.
=== Costruzione del Progetto
Il progetto si articola in due macrofasi sequenziali di ricerca tecnologica e sviluppo.

*_Prima fase: #gl("clustering") e profilazione comportamentale_*\ In un primo momento, l'attività si concentra sull'analisi esplorativa dei dati storici al fine di identificare pattern comportamentali e segmentare gli utenti in gruppi (o _cluster_) omogenei. \ L'obiettivo di questa fase è lo sviluppo di un modello di _clustering_ capace di mappare e misurare la _*Digital Attitude*_ (attitudine digitale) di ogni singolo HCP. \ Tale metrica consente al rappresentante di comprendere preventivamente il grado di ricettività digitale dell'HCP durante lo svolgimento delle campagne marketing.

*_Seconda fase: modellazione predittiva per la Next Best Action_* \ Una volta assegnato ciascun target a uno specifico profilo comportamentale, la conoscenza estratta viene utilizzata come base di partenza per la fase predittiva.\ L'obiettivo di questo secondo passo è l'implementazione di un modello di _Machine Learining_ che proponga un'azione da eseguire verso ogni HCP. Il sistema elabora una raccomandazione dinamica analizzando la sequenza cronologica delle ultime interazioni effettuate verso il medico e il rispettivo livello di risposta manifestato dal professionista a quegli specifici stimoli. 


== Motivazioni di scelta del progetto
La scelta del progetto è stata determinata da una combinazione di fattori legati sia dal contesto applicativo che dall'alto valore formativo della proposta aziendale. 

Una prima motivazione risiede nell'interesse verso il mondo della #gl("data-science") e dell'analisi dei dati. \ Sebbene il percorso di studi triennale fornisca solide basi metodologiche incentrate principalmente sulla progettazione e sulla costruzione di sistemi software tradizionali, lo studio dei dati rappresenta uno stimolante completamento del profilo accademico. \ La prospettiva di approfondire le metodologie di estrazione del valore dai dati ha trovato una corrispondenza nelle proposte progettuali offerte dall'azienda.

In seconda battuta l'integrazione del progetto con le tecnolgie di _Machine Learning_ costituisce un'opportunità formativa irrinunciabile. Nel panorama informatico contemporaneo, la comprensione di questi paradigmi non è più un elemento opzionale, ma uno strumento fondamentale per affrontare problemi complessi.

Ulteriori elementi di forte interesse sono emersi dall'analisi del contesto applicativo.\ L'elaborazione di modelli basati sulle interazioni umane e comportamentali, in contrasto con le più lineari analisi di mercato quantitative, ha aumentato la curiosità e introdotto una sfida stimolante. \ L'adozione del paradigma di _Next Best Action_ (NBA) permette di estendere il raggio d'azione della classica analisi predittiva (#gl("forecasting")). Non ci si limita a prevedere un trend futuro passivo, ma si identifica dinamicamente l'azione ottimale per guidare l'operato umano.

Infine, un ruolo determinante è stato ricoperto dal dialogo costruttivo instauratosi con i referenti aziendali. L'apertura, la disponibilità e la chiarezza dimostrate nell'esposizione degli obiettivi hanno confermato la validità dell'azienda per lo svolgimento del tirocinio, distinguendosi rispetto ad altre realtà pur parimenti stimolanti.

Il punto di forza del progetto è che si differenzia dalle classiche esperienze di sviluppo software. L'obiettivo finale non risiede nella codifica di un sistema applicativo gestionale, bensì nell'attività di ricerca, addestramento e validazione di modelli statistici e predittivi, destinati a essere integrati nei processi interni dell'azienda o nei servizi offerti ai clienti.