// Competenze (Italiano)
// Esporta funzioni che renderizzano le sezioni competenze per la sidebar

#import "../../templates/cv.typ": item-with-level, side-block
#import "labels.typ": *

#let skills-mischief = {
  side-block(label-mischief, first: true)[
    #item-with-level("Esecuzione Scherzi", 5)
    #item-with-level("Precisione Fionda", 5)
    #item-with-level("Telefonate Scherzose", 4)
    #item-with-level("Arte dei Graffiti", 4)
    #item-with-level("Generazione Scuse", 5)
  ]
}

#let skills-survival = {
  side-block(label-survival)[
    #item-with-level("Resistenza Punizioni", 5)
    #item-with-level("Elusione Autorità", 5)
    #item-with-level("Negoziazione Fratelli", 4)
    #item-with-level("Acquisizione Snack", 5)
  ]
}

#let skills-creative = {
  side-block(label-creative)[
    #item-with-level("Skateboard", 5)
    #item-with-level("Scrittura Lavagna", 4)
    #item-with-level("Analisi Fumetti", 4)
  ]
}

#let skills-languages-spoken = {
  block(breakable: false, above: 0.8em)[
    = #label-spoken-languages
    #item-with-level(lang-english, 4)
    #item-with-level(lang-spanish, 2)
  ]
}
