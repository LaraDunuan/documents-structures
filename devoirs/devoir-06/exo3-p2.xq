import module namespace local = "documents-structures-fonctions" at "partie3.xqm";

<dictionnaire>
{
let $xml :=
<mots>
<mot>chat</mot>
<mot>banane</mot>
<mot>pomme</mot>
<mot>le</mot>
<mot>le</mot>
<mot>pomme</mot>
<mot>le</mot>
<mot>chat</mot>
</mots>
return local:get-word-freq($xml)
}
</dictionnaire>


