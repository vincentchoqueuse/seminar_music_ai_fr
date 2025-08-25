#import "@preview/touying:0.6.1": *


#let color-primary = rgb("#1E293B")     // bleu profond
#let color-secondary = rgb("#3F7D66")  // bleu vif
#let color-accent = rgb("#10B981")     // orange contraste
#let color-bg-light = rgb("#F7F7F8")   // gris clair
#let color-text = rgb("#111827")       // presque noir
#let color-muted = rgb("#202123")      // gris moyen
#let color-line = rgb("#D1D5DB")       // gris clair

#let icon-label(icon, title, subtitle: none, text-size: 22pt) = block[
  #grid(
    columns: (1fr, auto),
    gutter: 2em,
    [
      // --- colonne gauche : ton bloc existant ---
      #grid(
        columns: (auto, auto),
        gutter: 10pt,
        row-gutter: 2em,
        [
          #box(
            width: 2.5em,
            height: 2.5em,
            fill: color-bg-light,
            radius: 50%,
          )[
            #align(center + horizon)[
              #image(icon, width: 1.2em)
            ]
          ]
        ],
        align(horizon)[
          #grid(
            align: left,
            gutter: 10pt,
            columns: 1,
            [
              #text(
                fill: color-secondary,
                size: text-size,
                font: "Montserrat",
                weight: 700
              )[ #title ]
            ],
            [
              #text(fill: color-muted, size: 12pt)[ #subtitle ]
            ]
          )
        ]
      )
    ],
    [
      // --- colonne droite : logo optionnel ---
      #align(right + horizon)[
        #image("img/enib_bw.png", width: 4em)
      ]
    ]
  )
]



#let illustration-block(body, title: "Illustration", icon: none) = block[
  #rect(
    width: 100%,
    height: auto,
    fill: color-bg-light,
    radius: 10pt,
    inset: 1em,
    [
      #text(size: 14pt, weight: 600)[#title]
      #v(0.5em)

      #body
    ]
  )
]
#let equation-block(body) = [
  #v(0.8em)
  #body
  #v(0.8em)
]

#let keyquote(body) = block[
  #box(
    radius: 5%, 
    inset: (x: 20pt, y: 0pt),
    stroke: (left: 5pt + color-secondary),  // 👈 ligne verticale colorée
  )[
    #text(size: 16pt, weight: 600)[#body]
  ]
]