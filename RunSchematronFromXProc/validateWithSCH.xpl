<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0" name="Schematron">
    <p:input port="source">
        <p:document href="DogSample/dog.xml"/>
    </p:input>
    <p:output port="report" primary="true"/>
    <p:group>
        <p:validate-with-schematron assert-valid="false" name="SchematronExample">
            <p:log port="report" href="result.svrl"/>
            <p:input port="schema">
                <p:document href="DogSample/dog.sch"/>
            </p:input>
            <p:input port="parameters">
                <p:empty/>
            </p:input>
        </p:validate-with-schematron>
    </p:group>
</p:declare-step>