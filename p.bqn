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

# TODO incrementally minimise grow and shrink values if failure or success is found
_P_←{ F _𝕣_ G 𝕩:
  v←@⋄rs←1⋄i←0 ⋄ t←⍉>⟨0∾gr⋆↕10, 0∾⌊gl⋆↕10⟩ # rs: result
  {𝕊: # grow
    x‿y←i⊏t ⋄ i↩i+1 ⋄ l‿h←x×¯1‿1
    (i<≠t)∧rs↩G F v↩l+y r.Range 1+h-l
  } •_while_ (0⊸≢) @

  j←10 # max tries
  {𝕊: # shrink
    p↩v 
    v {𝕩↑˜⌊sl×≠𝕩}⍟(0.5<(r.Range 0)⋆1.2) ↩ # shrink length
    v {(⊣-sr⊸×∘×)⌾((⊑⍒|𝕩)⊸⊏) 𝕩}⍟(0⊸≠≠) ↩ # shrink lagrest delta from 0
    (j-⟜1↩)∧(¬G⟜F⍟≢⟜p v)
  } •_while_ {(0≢𝕩)∧¬rs} @

  •Out "Counter example:"
  •Out •Fmt F p
}

{ 4||𝕩 } _P_ {12>≠𝕩} @
