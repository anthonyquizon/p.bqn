•Show "--"
r←•MakeRand 10

# TODO growth range size
# TODO growth length size
# TODO growth range limit
# TODO growth length limit

# 𝕨 Q 𝔾 𝕩 → 𝕨: range, 𝕩: length
#Q_←{
#  
#}

gr←2 ⋄ gl←1.5⋄ sr←1⋄ sl←0.9 # sl: length shrink factor, gr: range factor, rs: shrink range factor, gl: length factor

_P←{ F _𝕣 𝕩:
  v←@⋄rs←1⋄i←0 ⋄ t←⍉>⟨0∾gr⋆↕10, 0∾⌊gl⋆↕10⟩ # rs: result

  •Show t
  # grow
  {𝕊: 
    x‿y←i⊏t ⋄ i↩i+1 ⋄ l‿h←x×¯1‿1
    •SHow y
    (i<≠t)∧rs↩F v↩l+y r.Range 1+h-l
  } •_while_ (0⊸≢) @

  j←10 # max tries
  # shrink
  {𝕊:
    v {𝕩↑˜⌊sl×≠𝕩}⍟(0.5<(r.Range 0)⋆1.2) ↩
    v {(⊣-sr⊸×∘×)⌾((⊑⍒|𝕩)⊸⊏) 𝕩}⍟(0⊸≠≠) ↩ # shrink lagrest delta from 0
    (j-⟜1↩)∧(F v)
  } •_while_ {(0≢𝕩)∧¬rs} @
}

{ 𝕊: •SHow 4||𝕩 ⋄ 10>≠|𝕩 } _P @

#¯1‿1 P 4
#¯5‿5 P 5
#¯10‿10 P 6
#¯20‿20 P 7
#¯15‿15 P 8
#10‿13 P 4
#10‿13 P 4
#10‿13 P 4
#10‿13 P 4
#10‿13 P 4
#10‿13 P 4
#10‿13 P 4
#10‿13 P 4
#10‿13 P 4
