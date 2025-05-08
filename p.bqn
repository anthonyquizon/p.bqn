•Show "--"
r←•MakeRand 10

gr←2 ⋄ gl←1.5⋄ sr←1⋄ sl←0.9 # sl: length shrink factor, gr: range factor, rs: shrink range factor, gl: length factor

# TODO incrementally minimise grow and shrink values if failure or success is found
_P_←{ F _𝕣_ G 𝕩:
  v←@⋄rs←1⋄i←0 ⋄ t←⍉>⟨0∾gr⋆↕10, 0∾⌊gl⋆↕10⟩ # rs: result
  m←(≠t)⍟(≡⟜@) 𝕩

  {𝕊: # grow
    x‿y←i⊏t ⋄ i↩i+1 ⋄ l‿h←x×¯1‿1 ⋄
    (i<m)∧rs↩G F v↩l+y r.Range 1+h-l
  } •_while_ (0⊸≢) @

  p↩v 
  j←10 # max tries
  {𝕊: # shrink
    v {𝕩↑˜⌊sl×≠𝕩}⍟(0.5<(r.Range 0)⋆1.2) ↩ # shrink length
    v {(⊣-sr⊸×∘×)⌾((⊑⍒|𝕩)⊸⊏) 𝕩}⍟(0⊸≠≠) ↩ # shrink lagrest delta from 0
    (j-⟜1↩)∧(1≡(G⟜F)⍟(≢⟜p) v)
  } •_while_ {(0≢𝕩)∧¬rs} @

  Err ←{𝕊: •Out¨"Counter example:"‿(•Fmt F p) }
  Succ←{𝕊: •Out "Ok" }

  ⊢◶Err‿Succ rs
}

#{ (↕≠𝕩)∾˘(≠𝕩)||𝕩 } _P_ {10>≠𝕩} 10

# graph tests
# find all subgraphs A in graph G that match graph B
  
# TODO duplicate subgraph n times and attach → must find at least n graphs
{ 
  g←(↕≠𝕩)∾˘(≠𝕩)||𝕩
  # TODO take subsamples of graph G
  •SHow ⟨g,(⌈2÷˜≠g)↑g⟩

} _P_ {
  
  # 
  10>≠𝕩

} 5
