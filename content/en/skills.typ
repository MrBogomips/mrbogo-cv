// Skills (English)
// Exports functions that render skill sections for the sidebar

#import "../../templates/cv.typ": item-with-level, side-block
#import "labels.typ": *

#let skills-mischief = {
  side-block(label-mischief, first: true)[
    #item-with-level("Prank Execution", 5)
    #item-with-level("Slingshot Accuracy", 5)
    #item-with-level("Crank Calls", 4)
    #item-with-level("Graffiti Art", 4)
    #item-with-level("Excuse Generation", 5)
  ]
}

#let skills-survival = {
  side-block(label-survival)[
    #item-with-level("Detention Endurance", 5)
    #item-with-level("Authority Evasion", 5)
    #item-with-level("Sibling Negotiation", 4)
    #item-with-level("Snack Acquisition", 5)
  ]
}

#let skills-creative = {
  side-block(label-creative)[
    #item-with-level("Skateboarding", 5)
    #item-with-level("Chalkboard Writing", 4)
    #item-with-level("Comic Book Analysis", 4)
  ]
}

#let skills-languages-spoken = {
  block(breakable: false, above: 0.8em)[
    = #label-spoken-languages
    #item-with-level(lang-english, 4)
    #item-with-level(lang-spanish, 2)
  ]
}
