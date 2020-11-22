<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <sch:pattern>
        <sch:rule context="teiHeader">
            <sch:assert test="self::*">Le document contient <sch:name/>.</sch:assert>
        </sch:rule>
        <sch:rule context="text">
            <sch:assert test="self::*">Le document contient <sch:name/>.</sch:assert>
        </sch:rule>
        
        <sch:rule abstract="true" id="contient-p">
            <sch:assert test="self::*[child::p]">L'élément <sch:name/> contient toujours un enfant paragraphe.</sch:assert>
        </sch:rule>
        
        <sch:rule context="sp">
            <sch:extends rule="contient-p"/>
        </sch:rule>
        
        <sch:rule context="projectDesc">
            <sch:extends rule="contient-p"/>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern abstract="true" id="structure-minimale">
        <sch:rule context="$element">
            <sch:assert test="self::*[@type='act'] and self::*[child::head]">L'élément <sch:name/> qui sont des actes contiennent un élément head.</sch:assert>
            <sch:assert test="count(self::*[child::div][$attrib='scene']) > 1">L'élément <sch:name/> doit contenir plusieurs scènes.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern is-a="structure-minimale" id="div">
        <sch:param name="element" value="div"/>
        <sch:param name="attrib" value="@type"/>
    </sch:pattern>

</sch:schema>