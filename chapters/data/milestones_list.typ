// Obiettivi obbligatori
#let getOO(getLen: bool) = {
  let OO = ()
  let m = "OO"
  let mandatory = 0
  
  mandatory+=1
  OO.push((
    (m + str(mandatory)), [L'utente non autenticato deve poter effettuare il login inserendo mail e password.],[]
  ))
  
  mandatory+=1
  OO.push((
    (m + str(mandatory)), [L'utente non autenticato deve poter inserire una mail e una password per potersi registrare.],[]
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
  
  desirable+=1
  OD.push((
    (d + str(desirable)), [L'utente non autenticato deve poter effettuare il login inserendo mail e password.],[]
  ))
  
  if getLen == true {
    return (desirable)
  }
  return OD
}