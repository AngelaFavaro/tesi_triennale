#import "data/requirements_list.typ": *
#import "../config/variables.typ": *
#pagebreak(to:"odd")
#show figure: set block(breakable: true)
#show table: set block(breakable: true)
#show table.cell: set block(breakable: false)

= Conclusioni<cap:conclusioni>
#text(style: "italic", [
    In questo capitolo verranno tratte alcune considerazioni finali sull'attività svolta.
])
#v(1em)
== Consuntivo finale
Una volta terminato il progetto è stato redatto il consuntivo orario finale (in @fig:tabella-calcolo-ore) che suddivide in maniera approssimata le ore dedicate alle varie fasi.
#v(1em)
#set table(
  align: (center+horizon, center+horizon), 
)
#figure(
  caption: [Consuntivo orario finale.],
  table(
    columns: 2,
    table.header([*Fase*], [*Ore*]),
    [_Onboarding_ del progetto.],[8],
    [Periodo di apprendimento\ dello stack tecnologico.],[32],
    [Studio e sperimentazione\ _Clustering_.],[40],
    [Produzione algoritmo di\ _Clustering_.], [40],
    [Studio e sperimentazioni\ algoritmi predittivi.],[120],
    [Produzione algoritmo\ predittivo.],[40],
    [Produzione documentazione e\ dasboard rappresentativa.],[40],
    [*Totale*],[320]
  )
)<fig:tabella-calcolo-ore>
#v(1em)

== Raggiungimento degli obiettivi

Al termine del progetto sono stati raggiunti la maggior parte degli obiettivi prefissati. Come su può notare in @tab:requisiti-soddisfatti in riferimento alla @cap:obiettivi.
#v(1em)
#set table(
  align: (center+horizon, center+horizon, center+horizon), 
)
#figure(
  caption: [Obiettivi raggiunti.],
  table(
    columns: 3,
    table.header([*Codice*], [*Descrizione*] , [*Soddisfatto*]),
    [OO1],[Comprensione e analisi dei dati comportamentali digitali], [Sì],
    [OO2],[Sviluppo di un modello di Digital Attitude], [Sì],
    [OO3],[Implementazione di modelli di classificazione e regressione], [Sì],
    [OO4], [Valutazione delle performance tramite metriche statistiche.], [Sì],
    [OD1],[Ottimizzazione dei modelli e miglioramento delle performance.], [No],
    [OD2],[Definizione di segmentazioni utilizzabili per campagne omnicanale.], [Sì],
  )
)<tab:requisiti-soddisfatti>

== Rischi occorsi e mitigati
I rischi emersi durante lo stage e la rispettiva mitigazione sono riportati in @fig:rischi-occorsi.\
#v(1em)
#figure(
  caption: [Rischi occorsi e loro mitigazione.],
  table(
    columns: 2,
    table.header([*Descrizione*],[*Mitigazione*]),
[*R1 -- Anomalie silenti nei dati:* presenza di errori non evidenti o disallineamenti nelle tabelle di staging.], [Sessioni periodiche di revisione e controllo dei dati con i referenti aziendali.],    [*R2 -- Asimmetria nelle competenze tecniche:* gap iniziale di conoscenza sullo stack tecnologico aziendale.], [Pianificazione di una fase di _onboarding_ con l'ausilio della formazione aziendale dedicata.],
[*R3 -- Polarizzazione del modello da sbilanciamento:* tendenza dell'algoritmo a predire quasi esclusivamente i canali storicamente dominanti.], [Adozione della strategia di pesatura dinamica in fase di addestramento per penalizzare gli errori sui canali meno frequenti e preservare l'approccio omnicanale.],
[*R4 -- Disallineamento tra output algoritmico e logiche di ingaggio:* generazione di raccomandazioni teoricamente ottimali per il modello, ma potenzialmente inefficaci o controproducenti sul piano commerciale.], [Sviluppo di un motore di _post-processing_ basato su regole deterministiche e soglie di business per contestualizzare e guidare le predizioni.]
 )
)<fig:rischi-occorsi>
#v(1em)
== Valutazione personale
L'esperienza di tirocinio e lo sviluppo di questo progetto si sono rivelati altamente formativi, superando il solo valore dell'acquisizione tecnica e teorica legata agli algoritmi e alle architetture di _Machine Learning_. 

Un aspetto di valore è stato l'approccio ad una metodologia di lavoro: comprendere come strutturare un progetto, definire gli step propedeutici e orientare costantemente l'analisi verso un obiettivo di business concreto. Particolarmente istruttiva è stata la gestione delle fasi di sperimentazione meno fruttuose; il riscontro di performance non ottimali in alcuni algoritmi non è stato accolto come fallimento, bensì come passaggio per affinare la comprensione del dominio di progetto e guidare le successive scelte. 

Infine, il progetto ha offerto una panoramica altamente stimolante sulle reali applicazioni della _Data Science_ in ambito aziendale, delineando con maggiore nitidezza i possibili sviluppi e gli sbocchi professionali futuri.