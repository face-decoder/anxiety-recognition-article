#import "src/template/ijies.typ": ijies
#import "src/sections/abstract.typ": abstract_text, keywords

#show: ijies.with(
  title: [Real-Time Anxiety Recognition through Optical-Flow Based Apex-Phase Spotting and Deep Learning],
  authors: (
    (
      name: "Aji Hamdani Ahmad",
      aff: "1",
      corresponding: true,
      email: "2241720155@student.polinema.ac.id",
    ),
    (
      name: "Cahya Rahmad",
      aff: "2",
      corresponding: false,
      email: "cahya.rahmad@polinema.ac.id",
    ),
    (
      name: "Ulla Delfana Rosiani",
      aff: "3",
      corresponding: false,
      email: "rosiani@polinema.ac.id",
    ),
  ),
  affiliations: (
    [Department of Technology Information, Politeknik Negeri Malang, Indonesia],
  ),
  abstract: abstract_text,
  keywords: keywords,
  bibliography-file: bibliography("refs.bib", style: "ieee", title: "References"),
)

#include "src/sections/introduction.typ"
#include "src/sections/related_works.typ"
#include "src/sections/methodology.typ"
#include "src/sections/experiments.typ"
#include "src/sections/conclusion.typ"
