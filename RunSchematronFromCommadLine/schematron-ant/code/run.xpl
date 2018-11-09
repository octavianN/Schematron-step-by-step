<?xml version="1.0" encoding="UTF-8"?>
    <!-- A simple version of ISO Schematron -->
<p:pipeline xmlns:p="http://www.w3.org/ns/xproc" name="schematron" version="1">

    <p:input port="instance"/>

    <p:input port="schema"/>



    <p:output port="svrl">

        <p:pipe step="validate" port="result"/>

    </p:output>



    <p:xslt version="2.0" name="include">

        <p:input port="source">

            <p:pipe step="schematron" port="schema"/>

        </p:input>

        <p:input port="stylesheet">

            <p:document href="iso_dsdl_include.xsl"/>

        </p:input>

    </p:xslt>





    <p:xslt version="2.0" name="expand">

        <p:input port="source">

            <p:pipe step="include" port="result"/>

        </p:input>

        <p:input port="stylesheet">

            <p:document href="iso_abstract_expand.xsl"/>

        </p:input>

    </p:xslt>





    <p:xslt version="2.0" name="compile">

        <p:input port="source">

            <p:pipe step="expand" port="result"/>

        </p:input>

        <p:input port="stylesheet">

            <p:document href="iso_svrl_for_xslt2.xsl"/>

        </p:input>

    </p:xslt>





    <p:xslt version="2.0" name="validate">

        <p:input port="source">

            <p:pipe step="schematron" port="instance"/>

        </p:input>

        <p:input port="stylesheet">

            <p:pipe step="compile" port="result"/>

        </p:input>

    </p:xslt>


</p:pipeline>
