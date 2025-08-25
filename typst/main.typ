#import "@preview/touying:0.6.1": *
#import "slides-utils.typ": *
#import themes.simple: *

#show: simple-theme.with(
  slides-from-headings: false,
  aspect-ratio: "16-9",
  header: none,
  header-ascent: 0%,
  header-right: none,
  footer: [Musiciens et Machines: quand l'IA entre en scène, V. Choqueuse],
  config-page(
    margin: (x: 2em, y: 2em),
    ),
  config-common(new-section-slide-fn: none),
  subslide-preamble: none,
)


#show heading.where(level: 1): it => [
  #set text(size: 24pt, font: "Montserrat", weight: 800)
  #upper(it)
]
#show heading.where(level: 2): set text(22pt)
#show heading.where(level: 3): set text(22pt)
#show heading.where(level: 4): set text(18pt)
#set text(font: "Inter", size: 18pt, fill: color-text )
#let strong(body) = text(fill: color-accent, weight: "bold")[#body]
#show figure: set text(size: 9pt, fill: color-muted)


#title-slide[
= Musiciens et machines: Quand l’IA entre en scène

#v(2em)

  V. Choqueuse #footnote[ENIB, Bretagne INP] #h(1em)

  25 août 2025
]


#let current-title = [Musiciens et machines: Quand l’IA entre en scène]

#slide[

  #icon-label("icons/play.svg", "Introduction", subtitle: current-title)

  === Pourquoi ce sujet ?

  En quelques mois, des millions de personnes ont adopté des IA génératives comme ChatGPT ou DALL·E.

  #pause
  ==== L’IA et l’humanité : un sujet clivant
  - #strong[Technopessimisme] : l’IA comme menace existentielle pour l’humanité,
  - #strong[Technopositivisme] : l’IA comme solution miracle à tous les problèmes de la société.  

  #pause
  ==== L’IA et les artistes
  - Les musiciens ne sont pas que des “victimes” de la technologie : ils inventent de nouveaux usages

]

#let current-title = [Du signal à l'objet sonore]

#slide[
  #icon-label("icons/wave-sine.svg", "Le signal sonore", subtitle: current-title)
  
  Musique / théorie de l'information: information transmise à une ou plusieurs personnes en utilisant des signaux sonores

  #grid(
    gutter: 10pt,
    columns: (2fr, 1fr),
    [
      === Dimension #strong[utilitariste] du signal sonore 
          #set text(size: 14pt)
          - Encodage et emission sous la forme d'un signal,
          - Transmission sur un canal bruité, 
          - Réception et décodage du signal.

      #align(horizon+center)[
          #figure(
          image("img/shannon.jpeg", width: 40%, alt: "Claude Shannon"),
          )
      ]
    #set text(size: 12pt)
    [SHA49] Claude E. Shannon & Warren Weaver, The Mathematical Theory of Communication, University of Illinois Press, 1949.
  ],
  [
    #align(horizon+center)[#image("img/diag_shannon.svg", width: 30%, alt: "Claude Shannon")]
  ]
  )
]



#slide[

    #icon-label("icons/wave-sine.svg", "L'objet sonore", subtitle: current-title)

    Vers un dimension #strong[esthetique] du signal sonore

    #grid(gutter: 10pt, columns: (2fr, 1fr),
    [
    === L'objet sonore

      #set text(size: 14pt)
        
      - Un objet sonore s'écoute pour lui-même, sans tenir compte de sa signification.

    #align(horizon+center)[
        #grid(
            columns: 3,     // 2 means 2 auto-sized columns
            gutter: 2mm,    // space between columns
            image("img/russolo.jpeg", width: 75%),
            image("img/cage.jpg", width: 75%),
            image("img/schaeffer.jpg", width: 75%),
        )
      ]
    ],
    [
    #align(horizon+center)[#image("img/diag_shannon2.svg", width: 30%)]
    ]
    )
]


#let current-title = [Les grandes (r)évolutions]

#slide[

  #icon-label("icons/gear-fine.svg", "Acoustique", subtitle: current-title)

  -40.000 av J.C - XIXᵉ: La musique se fabrique, se stocke et peut être reproduite.
  #v(1em)

#grid(
  gutter: 10pt,
  columns: (2fr, 1fr),
  [
    === Quelques Innovations
     #set text(size: 12pt)

        - Génération :
            - Instruments à vents, cordes, percussions.

        - Traitement:
            - résonateur et caisse de résonance

        - Stockage :
            - Symbolique : partition (IXᵉ s),
            - Mécanique : boîte à musique.
        
        - Canal :
            - intégration des aspects acoustiques dans la conception des ouvrages
    ],
  [#figure(
        image("img/story2.png", width: 60%),
        ) 
    ]
)
]

#slide[

#icon-label("icons/circuitry.svg", "Electronique", subtitle: current-title)

1900 – 1970s: La musique est amplifiée, modifiée et diffusée à grande échelle.

#v(1em)
#grid(
  gutter: 10pt,
  columns: (2fr, 1fr),
  [
    === Quelques Innovations
     #set text(size: 12pt)
        - Génération :
            - Instruments électriques (guitare, piano, orgue),
            - Synthétiseurs électronique,
            - Échantillonneurs électromécaniques.

        - Traitement :
            - Effets (reverberation, delay, distorsion),
            - Djing.

        - Stockage de l'information
            - Phonographe d'Edison,
            - Disques vinyles / Cassette audio.
        
        - Canal:
            - Transmission hertzienne (radio FM/AM).
  ],
  [#figure(
        image("img/story3.png", width: 60%),
        ) 
    ]
)
]


#slide[

#icon-label("icons/cpu.svg", "Numérique", subtitle: current-title)

1980s – : La musique devient infiniment duplicable, transformable et partageable.
#v(1em)

#grid(
  gutter: 10pt,
  columns: (2fr, 1fr),
  [
    === Quelques Innovations
     #set text(size: 12pt)

        - Génération :
            - Synthetiseurs et échantillonneurs numériques (DX7, MPC, Elektron, Maschine, ...),
            - Contrôleur MIDI,
            - Instruments virtuels (rebirth, VSTi, ...)

        - Traitement : 
            - Séquenceur Audio / Midi software (Cubase, Ableton, ...),
            - effets numériques (autotune, time-stretching, ...)
            - Controleurs numériques DJ (Denon, Native Inst.)

        - Stockage :
            - Fichiers audio numériques (1979: CD, mp3, ...)
            - stockage local ou distribué (cloud). 

        - Canal :
            - Communications numériques / Internet
  ],
  [#figure(
        image("img/story4.png", width: 60%),
        ) 
    ]
)
]

= l'IA entre en scène


#slide[
  #icon-label("icons/chart-scatter.svg", "L’IA entre en scène", subtitle: current-title)

  #v(1em)

  == Une nouvelle “révolution technologique”...après l'acoustique, l’électricité et le numérique

  == Mais… qu’est-ce que ça veut dire ?

  - Une machine qui apprend à reconnaître, prédire, inventer.
  - Un nouvel instrument : sans cordes ni clavier, mais fait de données.

  == Deux questions pour la suite :

  - Demystification de l'IA: Comment ça marche ?
  - Comment l'utiliser pour faire de la musique ?
]



#let current-title = [De la droite à ChatGPT]

#slide[

  #icon-label("icons/chart-scatter.svg", "Regression Linéaire", subtitle: current-title)
    
    Estimer les #strong[paramètres] d'une droite à partir d'une base de #strong[données d'apprentissage].

    #v(1em)

#grid(
  gutter: 10pt,
  columns: (1.5fr, 1fr),
  [
    === Modèle mathématique

        #equation-block[$ y=f(x; bold(theta))=a x+b $]

        - Paramètres $bold(theta)$:
            - $a$: pente,
            - $b$: valeur à l'orgine

        - Base d'apprentissage: $(x_1,y_1), (x_2, y_2), ..., (x_(N), y_(N))$


  ],
    illustration-block(title:"Exemple visuel", icon: "icons/chart-line.svg")[
        #figure(
            image("img/data.svg", width: 60%),
            caption: [Données d'apprentissage]
            ) 

        #figure(
            image("img/lines.svg", width: 60%),
            caption: [Allure de différentes droites]
            ) 
        ]   
)
]

#slide[

  #icon-label("icons/chart-scatter.svg", "Regression Linéaire", subtitle: current-title)
    
  Estimer les paramètres d'une droite à partir d'une base de données d'apprentissage.

  #v(1em)

#grid(
  gutter: 10pt,
  columns: (1.5fr, 1fr),
  [
    === Estimation des paramètres

        #equation-block[$ hat(bold(theta)) = arg min_(bold(theta) in R^2) L(bold(theta)) $]

        
        - Métrique : $L(theta)=frac(1,N) sum_(n=1)^(N) (y_n-f(x_n;theta))^2$

        #v(1em)

        #align(center)[
        _-> Minimisation d'un critère de distante : la #strong[métrique]_
        ]
  ],
  illustration-block(title:"Exemple visuel", icon: "icons/chart-line.svg")[

    #figure(
        image("img/data_with_lines.svg", width: 65%),
        caption: [Comment choisir la meilleur droite ?]
        ) 

    #set align(center)
    #box(width: 70%)[
    #set text(size: 8pt, fill: color-muted)
        #table(
            fill: rgb("#EEEEEE"),
            stroke: none,
            columns: (1fr,1fr, 1fr, 1fr),
            table.header(
                [],
                [$a$],
                [$b$],
                [$L(bold(theta))$]
            ),
            [#strong[Droite 1]],
            [2],
            [4],
            [11.20],
            [#strong[Droite 2]],
            [1],
            [2],
            [29.12],
            [#strong[Droite 3]],
            [3],
            [0.5],
            [29.89]
            ),
      ] 
 ]

)
]



#slide[

  #icon-label("icons/chart-scatter.svg", "Regression Linéaire", subtitle: current-title)
    
  Estimer les paramètres d'une droite à partir d'une base d'apprentissage

  #v(1em)

#grid(
  gutter: 10pt,
  columns: (1.5fr, 1fr),
  [
    === Optimisation des paramètres

    #equation-block[$ bold(theta)_(l+1) = bold(theta)_(l) - eta ∇L(bold(theta)_(l)) $]

    - Algorithme d'#strong[optimisation] basé sur la descente de gradient (à moins de connaître la solution analytique 😅)


    #align(center)[
    _🎶 Il descend de la montagne à cheval 🎶_
    ]
  ],
  illustration-block(title:"Exemple visuel", icon: "icons/chart-line.svg")[

    #figure(
        image("img/cost_surface_with_gd_path.svg", width: 40%),
        ) 
    #figure(
        image("img/data_with_optimal_line.svg", width: 55%),
        caption: [Droite "optimale"]
    ) 
  ]
)
]

#slide[
  #icon-label("icons/chart-scatter.svg", "Regression Linéaire", subtitle: current-title)
  #v(1em)
  #grid(
    gutter: 10pt,
    columns: (1.5fr, 1fr),
    [
      === Et l'intelligence dans tout ca ? 

      - Prédiction de nouvelles valeurs,
      - Débruitage de valeurs,
      - Génération de nouvelles valeurs possibles (génératif)

      === De la regression linéaire ... à ChatGPT

      - Même logique … mais à une échelle plus grande 🤯
        - 2 -> $approx$ 50000000000000 de paramètres
    ],
    illustration-block(title:"IA = modèle + metrique + optimisation")[

    #figure(
          image("img/data_pred.svg", width: 60%),
          caption: [Prediction"]
      ) 

      #figure(
          image("img/data_denoise.svg", width: 60%),
          caption: [Debruitage]
      ) 

      #figure(
          image("img/data_gen.svg", width: 60%),
          caption: [Generation]
      )     
    ]
  )
]


#slide[
  #icon-label("icons/image.svg", "Génération et traitement d’images", subtitle: current-title)
  #v(1em)

  == Classification d'images

  #v(1em)

  #grid(
  gutter: 20pt,
  columns: (1fr, 1fr, 1fr),
  align(right + horizon)[   
    #figure(image("img/homer.jpg", width: 70%)) 
  ],
  align(center + horizon)[   
    #figure(image("img/modele.svg", width: 200pt))
  ],
  align(left + horizon)[   
    - Charlie: 0.05
    - #strong[Homer: 0.91]
    - Cartman: 0.03
    - Tintin: 0.01
  ]
  )
]


#slide[
  #icon-label("icons/image.svg", "Génération et traitement d’images", subtitle: current-title)

  #v(1em)

  == Détection / localisation d'objets

  #v(1em)

  #grid(
  gutter: 20pt,
  columns: (1fr, 1fr, 1fr),
  align(right + horizon)[   
    #figure(image("img/waldo.jpeg", width: 100%)) 
  ],
  align(center + horizon)[   
    #figure(image("img/modele.svg", width: 200pt))
  ],
  align(left + horizon)[   
    #figure(image("img/waldo2.jpg", width: 100%)) 
  ]
  )
]


#slide[
  #icon-label("icons/image.svg", "Génération et traitement d’images", subtitle: current-title)

  #v(1em)

  == Segmentation d'images

  #v(1em)

  #grid(
  gutter: 20pt,
  columns: (1fr, 1fr, 1fr),
  align(right + horizon)[   
    #figure(image("img/waldo.jpeg", width: 100%)) 
  ],
  align(center + horizon)[   
    #figure(image("img/modele.svg", width: 200pt))
  ],
  align(left + horizon)[   
    #figure(image("img/waldo3.png", width: 100%)) 
  ]
  )
]

#slide[
  #icon-label("icons/image.svg", "Génération et traitement d’images", subtitle: current-title)

  #v(1em)

  == Génération d'images (ex: DALL-E, MidJourney)

  #v(1em)

  #grid(
  gutter: 20pt,
  columns: (1fr, 1fr, 1fr),
  align(right + horizon)[   
    Charlie au Minou
  ],
  align(center + horizon)[   
    #figure(image("img/modele.svg", width: 200pt))
  ],
  align(left + horizon)[   
    #figure(image("img/waldo5.png", width: 50%)) 
  ]
  )
]


#slide[
  #icon-label("icons/clock.svg", "L'évolution de l'IA ", subtitle: current-title)
  #v(1em)
  #figure(
        image("img/ia.svg", width: 78%),
    ) 
]


= Les Applications Musicales

#let current-title = [De ChatGPT aux futurs Daft Punk]



#slide[
  #icon-label("icons/music-notes.svg", "Les signaux audio", subtitle: current-title)

  #v(1em)

  == Représentation du signal (ex: Satie - Gymnopédies / Piano)

  #grid(
    gutter: 20pt,
    columns: (1fr, 1fr, 1fr),
    align(right + horizon)[   
      #figure(
        image("img/time.png", width: 200pt),
        caption: "Représentation Brute\n(échantillons sonores)"
        )
    ],
    align(center + horizon)[   
      #figure(
        image("img/spectrogram.png", width: 200pt),
        caption: "Représentation Parcimonieuse\n(spectrogramme)"
        )
    ],
    align(left + horizon)[   
      #figure(
        image("img/piano_roll.png", width: 200pt),
        caption: "Représentation Symbolique\n(piano Roll)"
        )
    ]
  )

  - Format Audio: Stéréo, Echantillonnage 44100 Hz, Quantification: 16 bit
    - Environ 800 Mo pour 80 minutes d'audio.
  
]

/*
= Partie 2: l'IA entre en scène

  == Musique et Technologie

  === Cadre général

  ==== Objectif du « musicien »
  - transmettre un message à un auditeur en transmettant des ondes acoustiques

  ==== Une Chaîne d'information [Shannon 1948]
  - Génération
  - Modification
  - Stockage / Transmission
  - Restitution


= Musique & technologies

== Musique et Technologie

=== Cadre Général

==== Objectif du "Musicien"

- transmettre un message à un auditeur en transmettant des ondes acoustiques

==== Une Chaine d'information [Shannon 1948]
- Génération,
- Modification,
- Stockage / Transmission,
- Restitution.

---

= Génération
- Orgues de barbarie, pianos mécaniques
- Synthétiseurs (Theremin, Moog)
- Logiciels de MAO

---

= Modification
- Effets (distorsion, autotune)
- Samplers, séquenceurs
- Édition numérique

---

= Stockage & transmission
- Du rouleau au vinyle, cassette, CD
- MP3 → Streaming
- Impact sur diffusion & économie musicale

---

= Restitution
- Concerts amplifiés
- Haute-fidélité
- Playlists algorithmiques

---

= IA en bref
- 1950s : premiers algorithmes
- 2012 : AlexNet + GPU
- 2017 : Transformers
- 2020s : IA générative (texte, image, son)

---

= IA & Musique
== Grand public
- Suno, Udio, Stable Audio
- “Texte → musique”
- Accessibilité massive

---

= IA & Musique
== Pour musiciens
- Wavenet, DDSP
- MusicGen, Magenta
- Clonage vocal
- Séparation de sources
- Composition assistée

---

= Opportunités
- Nouveaux outils créatifs
- Accessibilité & démocratisation
- Exploration sonore

---

= Risques
- Droits d’auteur & propriété
- Biais esthétiques
- Inondation du marché
- Valeur du travail humain

---

= Conclusion
- Les artistes se sont toujours emparés des nouvelles technologies
- Pas “bien” ou “mal” → des outils
- Question centrale :  
*Comment voulons-nous vivre la musique avec l’IA ?*

---

= Merci !

== 🎶 Discussion / Questions

*/