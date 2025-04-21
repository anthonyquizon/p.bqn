# TODO for all imports

preproc_out←"PREPROC_OUT←{ f 𝕊 v: •Out f ⋄ •Show v }"
Proc←{ f 𝕊 c:
  n←r←@ 
  c↩c/˜0=+`c='#' # remove comment sections
  c↩c/˜¬c∊" "    # remove whitespace
  a←c∊'a'+↕26    #.
  b←c∊"←↩"       #.
  r↩a∧1+`<⟜«a    # extract names
  n↩1↓c⊔˜r

  n↩{'"'∾𝕩∾" "∾f∾'"'∾" PREPROC_OUT " ∾ 𝕩 }¨n
  s←∾"⋄"⊸∾¨n
  s∾˜⊑𝕩⊔˜+`𝕩='#' 
}

f←⊑•args
out←("_out/"∾f)
•SH "mkdir"‿"-p"‿"_out"
l←•FLines f
m←∨´¨∊⟜"#."¨l
fn←(f∾":")⊸∾¨•Fmt¨↕≠l

o←fn Proc¨⌾(m⊸/) l
out •Flines ⟨preproc_out⟩ ∾ o

•Out out

