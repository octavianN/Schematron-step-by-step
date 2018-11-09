<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process" xml:lang="en">
    <sch:title>Example of Multi-Lingual Schema</sch:title>
    <sch:pattern>
        <sch:rule context="dog">
            <sch:assert test="bone" diagnostics="d_de d_fr d_ja"> A dog should have a bone. </sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:diagnostics>
        <sch:diagnostic id="d_de" xml:lang="de"> Ein Hund sollte ein Bein haben. </sch:diagnostic>
        <sch:diagnostic id="d_fr" xml:lang="fr"> Un chien doit avoir un os. </sch:diagnostic>
        <sch:diagnostic id="d_ja" xml:lang="ja"> 犬は骨を持っている必要があります。 </sch:diagnostic>
    </sch:diagnostics>
</sch:schema>
