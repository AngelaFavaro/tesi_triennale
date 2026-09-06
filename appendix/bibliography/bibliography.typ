#pagebreak()
// #pagebreak(to: "odd")

/*
Typst supporta due tipi di file per la bibliografia: 
- Bibtex: il classico formato preso da Latex 
- Hayagriva: nuovo formato basato su yaml molto più versatile
Per convertire da Bibtex a Hayagriva puoi usare https://jonasloos.github.io/bibtex-to-hayagriva-webapp/

Typst bibliography: https://typst.app/docs/reference/model/bibliography
Hayagriva format:   https://github.com/typst/hayagriva/blob/main/docs/file-format.md

Ci sono vari stili per fare le citazioni, come riportato nella documentazione. 
Quello di default è IEEE ma alla fine è preferenza tua o del relatore
*/
// Documentazioni e Guide Ufficiali
#cite(form: none, <catboost-doc>)
#cite(form: none, <python-doc>)
#cite(form: none, <pyspark-doc>)
#cite(form: none, <databricks-doc>)
#cite(form: none, <lightgbm-docs>)
#cite(form: none, <sklearn-kmeans-doc>)
#cite(form: none, <databricks-dashboards-doc>)

// Articoli Tecnici e Blog
#cite(form: none, <articolo-ibm>)
#cite(form: none, <lightgbm-explained-medium>)
#cite(form: none, <markov-chains-medium>)
#cite(form: none, <ai4business-markov>)

// Risorse su Clustering e Catene di Markov
#cite(form: none, <ibm-think-clustering>)
#cite(form: none, <ibm-think-kmeans>)
#cite(form: none, <wiki-markov-chain>)
#cite(form: none, <gemini-ai>)

#bibliography("bibliography.yml", style:"apa", title: "Sitografia") <bibliography>