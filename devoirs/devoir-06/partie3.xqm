module namespace local = "documents-structures-fonctions";

declare function local:normalise-texte($texte as xs:string) as xs:string* {
let $ponctuations := "?!;.,'"
return translate($texte, $ponctuations, "") => lower-case() => tokenize(' ')
};

declare function local:get-texte() as xs:string* {
let $directory := "/Users/Lara/Desktop/M2S1/DocumentsStructures/documents-structures/07-XQuery"
let $filename := "apollinaire.txt"
let $data := unparsed-text($directory || '/' || $filename)
return $data
};

declare function local:get-word-freq($xml as node()) as node()* {
let $toks := $xml//text()/fn:tokenize(fn:normalize-space(.),'\s')
for $t in distinct-values($toks)
    let $count := count($toks[. = $t])
    return <mot frequence="{$count}">
        {
            $t
        }  
        </mot>
};