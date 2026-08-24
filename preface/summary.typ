#import "../config/constants.typ": abstract
#import "../config/variables.typ": *
#import "../config/thesis-config.typ": glossary-style
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *
#pagebreak(to: "odd")
#v(4em)

#text(24pt, weight: "semibold", abstract)

#v(1em)
Il presente documento descrive il lavoro svolto durante il periodo di stage curricolare, della durata di circa trecentoventi ore, dal laureando #text(myName) presso l'azienda #text(myCompany). Lo stage è stato condotto sotto la supervisione del tutor aziendale #myTutor, mentre il prof. #text(myProf) ha ricoperto il ruolo di tutor accademico.
\ \
Il presente lavoro di tesi tratta la progettazione e lo sviluppo di modelli di clustering e di predizione Next Best Action a supporto di strategie di ingaggio omnicanale. L'obiettivo principale risiede nella realizzazione di una dashboard riassuntiva che, illustrando l'output e il funzionamento dei modelli, offra agli stakeholder una visione concreta delle potenzialità applicative dell'Intelligenza Artificiale e del Machine Learning.

#linebreak()
#text(24pt, weight: "semibold")[Organizzazione del testo]
#linebreak()
#v(1em)

/ #link(<cap:introduzione>)[Il primo capitolo]: introduce l'azienda, il progetto e le motivazioni che hanno portato a sceglierlo;
/ #link(<cap:desc-stage>)[Il secondo capitolo]: descrive l'azienda, il progetto e l'organizzazione del lavoro, definendo gli obiettivi e analizzando i rischi;
/ #link(<cap:svolgimento-progetto>)[Il terzo capitolo]: presenta nel dettaglio lo svolgimento del progetto ed i risultati ottenuti;
/ #link(<cap:conclusioni>)[Il quarto capitolo]: traccia una breve analisi conclusiva sul lavoro svolto.

#linebreak()
#text(24pt, weight: "semibold", "Convenzioni tipografiche")
#linebreak()
#v(1em)
Durante la stesura del testo sono state adottate le seguenti convenzioni tipografiche:

//Preferenze personali modificabili a discrezione tua o del relatore
- Gli acronimi, le abbreviazioni e i termini di uso non comune menzionati vengono definiti nel #link(<glossary>)[glossario], situato alla fine del documento (#link(<glossary>)[p. #context counter(page).at(<glossary>).at(0)]);
- Per la prima occorrenza dei termini riportati nel glossario viene utilizzata la seguente nomenclatura: #glossary-style[termine]\;
- I termini in lingua straniera non di uso comune o facenti parti del gergo tecnico sono evidenziati con il carattere _corsivo_;
- I nomi di funzioni o variabili appartenenti ad un linguaggio di programmazione vengono scritte con un carattere `monospaziato`;
- Le citazioni ad un libro, ad una risorsa presente nella #link(<bibliography>)[bibliografia] (#link(<bibliography>)[p. #context counter(page).at(<bibliography>).at(0)]) o i link di approfondimento o saranno affiancate dal rispettivo numero identificativo, es. $[1]$;
- I blocchi di codice sono rappresentati nel seguente modo
#linebreak()
#figure(caption: "Codice d'esempio.")[
```c
float Assegnazione ( float number ){
	float y;
	y  = number;
	return y;
}
```
]
