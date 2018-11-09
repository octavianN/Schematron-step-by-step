<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process" xml:lang="en">
    <sch:title>Example of Multi-Lingual Schema</sch:title>
    <sch:pattern>
        <sch:rule context="dog">
            <sch:assert test="bone" diagnostics="dog_en dog_de dog_fr dog_ja">
                A dog should have a bone.</sch:assert>
        </sch:rule>
        
        <sch:rule context="cat">
            <sch:assert test="fish" diagnostics="cat_en cat_de cat_fr cat_ja">
                A cat should have a fish.</sch:assert>
        </sch:rule>
        
        <sch:rule context="rabbit">
            <sch:assert test="carrot" diagnostics="rabbit_en rabbit_de rabbit_fr rabbit_ja">
                A rabbit should have a carrot.</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:include href="msg_en.sch"/>
    <sch:include href="msg_fr.sch"/>
    <sch:include href="msg_de.sch"/>
    <sch:include href="msg_ja.sch"/>
</sch:schema>
