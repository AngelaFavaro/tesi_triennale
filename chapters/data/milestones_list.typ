// Obiettivi obbligatori
#let getOO(getLen: bool) = {
  let OO = ()
  let m = "OO"
  let mandatory = 0
  let fonte = "Tutor aziendale"
  
  mandatory+=1
  OO.push((
    (m + str(mandatory)), [Comprensione e analisi dei dati comportamentali digitali],[#fonte]
  ))
  
  mandatory+=1
  OO.push((
    (m + str(mandatory)), [Sviluppo di un modello di Digital Attitude],[#fonte]
  ))

  mandatory+=1
  OO.push((
    (m + str(mandatory)), [Implementazione di modelli di classificazione e regressione],[#fonte]
  ))

  mandatory+=1
  OO.push((
    (m + str(mandatory)), [Valutazione delle performance tramite metriche statistiche.],[#fonte]
  ))
  
  if getLen == true {
    return (mandatory)
  }
  return OO
}

// Obiettivi desiderabili
#let getOD(getLen: bool) = {
  let OD = ()
  let d = "OD"
  let desirable = 0
  let fonte = "Tutor aziendale"
  
  desirable+=1
  OD.push((
    (d + str(desirable)), [Ottimizzazione dei modelli e miglioramento delle performance.],[#fonte]
  ))

  desirable+=1
  OD.push((
    (d + str(desirable)), [Definizione di segmentazioni utilizzabili per campagne omnicanale.],[#fonte]
  ))
  
  if getLen == true {
    return (desirable)
  }
  return OD
}