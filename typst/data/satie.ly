% Lily was here -- automatically converted by midi2ly from ./data/satie.mid
\version "2.14.0"

\layout {
  \context {
    \Voice
    \remove Note_heads_engraver
    \consists Completion_heads_engraver
    \remove Rest_engraver
    \consists Completion_rest_engraver
  }
}

trackAchannelA = {
  
  \set Staff.instrumentName = "PIANO"
  
  \time 3/4 
  
  \time 3/4 
  \skip 4*45037/96 
}

trackAchannelB = \relative c {
  \voiceOne
  g64*13 r4*98/96 fis''4*409/96 r4*136/96 cis4*409/96 r16*7 d4*446/96 
  r4*121/96 fis4*445/96 r4*158/96 fis'4*182/96 r4*161/96 g4*191/96 
  r128*51 cis,4*169/96 r64 g,,4*74/96 r4*92/96 cis'' r4*86/96 d16 
  r4*151/96 a128*207 r128*55 b,4*26/96 
}

trackAchannelBvoiceB = \relative c {
  \voiceTwo
  r4*178/96 b'4*80/96 r128*95 d,,4*55/96 r128*41 fis''4*425/96 
  r4*152/96 fis16*19 r4*113/96 a,4*26/96 r4*398/96 g,4*67/96 r4*115/96 fis''32*7 
  r128*27 a'128*67 r128*47 fis4*188/96 r4*155/96 b,4*185/96 r128*115 d,,,4*77/96 
  r128*33 fis''4*89/96 r4*332/96 g,,4*83/96 
}

trackAchannelBvoiceC = \relative c {
  r4*178/96 d'64*67 r4*142/96 a4*34/96 r128*123 g,4*85/96 r64*15 b'16 
  r4*362/96 d,,4*82/96 r4*100/96 cis''128*137 r4*196/96 b4*121/96 
  r16*9 d,,64*9 r4*119/96 fis''4*50/96 r4*464/96 fis128*13 r4*493/96 cis128*11 
  r128*129 fis64*23 
}

trackAchannelBvoiceD = \relative c {
  \voiceThree
  r64*413 d'4*124/96 r4*386/96 cis4*31/96 r4*5 b4*58/96 r4*475/96 a4*40/96 
}

trackAchannelBvoiceE = \relative c {
  \voiceFour
  r128*997 a'4*44/96 r4*466/96 d128*13 
}

trackA = <<
  \context Voice = voiceA \trackAchannelA
  \context Voice = voiceB \trackAchannelB
  \context Voice = voiceC \trackAchannelBvoiceB
  \context Voice = voiceD \trackAchannelBvoiceC
  \context Voice = voiceE \trackAchannelBvoiceD
  \context Voice = voiceF \trackAchannelBvoiceE
>>


\score {
  <<
    \context Staff=trackA \trackA
  >>
  \layout {}
  \midi {}
}
