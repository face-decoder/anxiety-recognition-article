// IJIES (International Journal of Intelligent Engineering and Systems) INASS Typst Template

#let ijies(
  title: "",
  authors: (),
  affiliations: (),
  abstract: [],
  keywords: (),
  paper-size: "a4",
  vol: "19",
  no: "1",
  year: "2026",
  doi: "10.22266/ijies.2026.0201.01",
  bibliography-file: none,
  body
) = {
  // Set document metadata
  set document(title: title, author: authors.map(a => a.name).join(", "))
  
  // Page setup
  set page(
    paper: paper-size,
    margin: (x: 18mm, top: 22mm, bottom: 22mm),
    // ponytail: temporarily removed IJIES headers
    header: none,
    footer: context {
      let page-num = counter(page).get().first()
      align(center)[
        #text(size: 9pt, font: "Liberation Serif")[#page-num]
      ]
    }
  )

  // Typography settings
  set text(font: "Liberation Serif", size: 10pt)
  set par(justify: true, leading: 0.55em, first-line-indent: (amount: 1.2em, all: true), spacing: 0.55em)
  set math.equation(numbering: "(1)")

  // Heading styling with Arabic numerals
  set heading(numbering: "1.1")
  show heading: it => {
    set text(font: "Liberation Serif")
    set par(first-line-indent: 0pt)
    if it.level == 1 {
      v(1.2em, weak: true)
      text(size: 11pt, weight: "bold")[
        #if it.numbering != none {
          counter(heading).display(it.numbering)
          h(0.5em)
        }
        #it.body
      ]
      v(0.6em, weak: true)
    } else if it.level == 2 {
      v(1em, weak: true)
      text(size: 10pt, weight: "bold")[
        #if it.numbering != none {
          counter(heading).display(it.numbering)
          h(0.5em)
        }
        #it.body
      ]
      v(0.5em, weak: true)
    } else {
      v(0.8em, weak: true)
      text(size: 10pt, weight: "bold", style: "italic")[
        #if it.numbering != none {
          counter(heading).display(it.numbering)
          h(0.5em)
        }
        #it.body
      ]
      v(0.4em, weak: true)
    }
  }

  // Figure & Table caption and layout styling
  show figure.where(kind: image): set figure(supplement: [Fig.])
  show figure.where(kind: table): set figure(supplement: [Table])
  show figure.where(kind: image): set figure(placement: auto)
  show figure.where(kind: table): set figure(placement: none)
  show figure: set block(breakable: true)
  
  show figure.caption: it => [
    #v(0.2em)
    #text(size: 8.5pt, weight: "bold")[#it.supplement #it.counter.display()#it.separator]
    #text(size: 8.5pt)[#it.body]
    #v(0.2em)
  ]

  // Compact table styling with previous grid border design
  show figure.where(kind: table): set text(size: 8.5pt)
  set table(
    stroke: 0.5pt + rgb("#000000"),
    fill: none,
    inset: (x: 4pt, y: 3.5pt),
  )

  // Top Title & Authors block (Single Column)
  align(center)[
    #v(0.5em)
    #text(size: 15pt, weight: "bold")[#title]
    #v(0.5em)
    
    // Authors
    #let author-nodes = authors.enumerate().map(((i, a)) => {
      let star = if a.at("corresponding", default: false) { "*" } else { "" }
      let aff-mark = a.at("aff", default: str(i + 1))
      [#a.name#super([#aff-mark#star])]
    })
    #text(size: 10.5pt, weight: "bold")[#author-nodes.join(", ")]

    // Affiliations
    #let aff-nodes = affiliations.enumerate().map(((aff-idx, aff)) => {
      let aff-key = str(aff-idx + 1)
      let matching-authors = if affiliations.len() == 1 {
        authors.enumerate().map(((i, a)) => str(i + 1))
      } else {
        authors.enumerate().filter(((i, a)) => {
          let a-aff = str(a.at("aff", default: str(i + 1)))
          a-aff == aff-key or a-aff.split(",").contains(aff-key)
        }).map(((i, a)) => str(i + 1))
      }
      
      let num-prefix = if matching-authors.len() > 0 {
        matching-authors.join(",")
      } else {
        aff-key
      }
      [#super([#num-prefix]) #aff]
    })
    #text(size: 9pt, style: "italic")[#aff-nodes.join("\n")]

    // Author emails (all authors)
    #let all-emails = authors.filter(a => a.at("email", default: "") != "").map(a => a.email)
    #if all-emails.len() > 0 {
      text(size: 8.5pt)[
        \* Email: #all-emails.join(", ")
      ]
    }
    #v(1.2em)
  ]

  // Abstract & Keywords (Single Column)
  block(
    width: 100%,
    inset: (x: 0pt, y: 4pt),
    [
      #set par(justify: true, first-line-indent: 0pt)
      #par[*Abstract:* #abstract]
      #v(0.6em)
      #par[*Keywords:* #keywords.join(", ")]
      #v(1em)
      #line(length: 100%, stroke: 0.5pt + rgb("#bbbbbb"))
      #v(0.8em)
    ]
  )

  // Two Column Body Layout
  columns(2, gutter: 18pt)[
    #body
    
    #if bibliography-file != none {
      v(1em)
      set heading(numbering: none)
      bibliography-file
    }
  ]
}
