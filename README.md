Tutorial

# Step-By-Step Guide to Developing Schematron Rules

Octavian Nadolu, Syncro Soft

[![Step-By-Step Guide to Developing Schematron Rules](https://img.youtube.com/vi/w4jtBsSIiyw/0.jpg "Step-By-Step Guide to Developing Schematron Rules")]https://www.youtube.com/watch?v=w4jtBsSIiyw)



Schematron is a very simple and powerful language. It is used in various domains (financial, insurance, government, and technical publishing sectors) for quality assurance, validating business rules, constraint checking, or data reporting. During the presentation, I will show you how to create Schematron rules step-by-step, apply the rules over one or multiple documents, and also how to integrate Schematron rules in your development process.

Schematron is a rule-based validation language for making assertions about presence or absence of certain patterns in XML documents. With Schematron, you can express constraints in a way that you cannot perform with other schemas (like XSD, RNG, or DTD). XSD, RNG, and DTD schemas define structural aspects and data types of the XML documents and can be used to check big things, such as if an element is allowed in a specific context, or if an attribute is allowed for an element. But with Schematron, you can create your custom rules specific to your project, and check things such as if the text from an element respects a particular constraint, or verify data inter-dependencies such as if a start date from an attribute value is set before the end date attribute value.

In a Schematron document, you can add a collection of rules that contain tests. The Schematron content is written as an XML document using a small number of elements, and this makes it easy to understand and write, even for people that are not programmers.

When a document is validated with a Schematron schema, for each rule from the schema, the following steps are performed:

- First, it is determined the context on which the rule is applied. That can be an element, or an attribute, or maybe a text fragment. The context is expressed using an XPath expression.
- Next, it checks if the assertions from the rule are evaluated to true or false. Depending on the evaluation result, the assertion message is displayed. The assertions are also expressed using XPath expressions that are evaluated to _true_ or _false_.


## Schematron Structure

Basically, the most important components of a Schematron schema are the tests. The tests are defined in the **assert** and **report** elements. An **assert** generates a message when a test statement evaluates to **false**. A **report** generates a message when a test statement evaluate to **true**. The generated messages are defined in the **assert** and **report** elements. Actually, the Schematron developer writes his own messages, making them understandable to anyone who needs to see the messages.

_Example 1: An assert that tests if the price is greater that 10_


```
 <assert test="@price > 10">The price is too small</assert>
```

Tests that are executed in the same context can be grouped in a **rule** element. A **rule** defines a context on which a list of assertions will be tested, and is comprised of one or more **assert** or **report** elements.

_Example 2: A set of tests for the book element_
```
<rule context="book">
    <assert test="@price > 10">The price is too small</assert>
    <assert test="@isbn">The book ISBN is missing</assert>
</rule>
```

A set of rules that are related in some way can be grouped in a **pattern** element. The **pattern** elements are added in a **schema** element, that is the top-level element of a Schematron schema **.**

_Example 3: A sample ISO Schematron schema_

```
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
    <pattern>
        <rule context="book">
            <assert test="@price > 10">The price is too small</assert>
            <assert test="@isbn">The book isbn is missing</assert>
        </rule>
    </pattern>
</schema>
```


The Schematron is saved in a file that has the suffix ".sch". Also the prefix for the Schematron elements is by convention "sch:".


## Validate with Schematron Schema

A Schematron schema can be associated with an XML document using an **xml-model** processing instruction. You can also use tool-specific association options like: associate a set al XML files that have a specific namespace with a Schematron, or associate all XML files from a project or from a directory.

To validate an XML file with a Schematron schema, you can use an editing framework that will allow you to run the validation on the currently edited XML file and will present the problems directly in the editor.  You can also run the validation over multiple XML files and check all the reported problems from a user interface. Another solution is to use Apache Ant, and run the validation from a bat/shell script. You can also use pipelining languages, like W3C&#39;s XProc.

The result of the validation can be presented in the editor in case you are using an editing framework, and you will have the content that does not satisfy the assertions highlighted and the messages displayed in the user interface. In case you are using bat/shell script, you can get the validation errors in an XML file, normally the format of the XML file is a Schematron Validation Reporting Language (SVRL).

Schematron assertion messages can be presented in different languages. The Schematron developer can create a message for each language using the diagnostics elements. For each translated message, a diagnostic element need to be created and referenced from the assert or report element. Depending on the application language or on the Schematron file language, a message in a specific language can be presented to the user.

## Schematron Quick Fixes

Schematron allows the schema author to define and control the messages that are presented to the user. The messages can also include hints to the user on how to solve the problem, but they will need to manually correct the issue. This wastes valuable time since the user needs to correct the problem manually and additional errors can be created when they fix the reported problem. An action that will automatically correct the reported problem for Schematron validation errors will bridge this gap, saving time and avoiding the potential for causing other issues.

Schematron Quick Fix (SQF) it is a simple language that allows the Schematron developer to define actions that will correct the reported problems. SQF was created as an extension of the Schematron language. It was developed within the W3C community group "Quick-Fix Support for XML Community Group". First draft of the Schematron Quick Fix specification was published in April 2015, second draft in March 2018, and it is now available on the [W3C Quick-Fix Support for XML community group](https://www.w3.org/community/quickfix/) page.

_Example 4: A Schematron Quick Fix that removes a bold element keeping its text content_

```
<sch:rule context="title">
  <sch:report test="b" sqf:fix="resolveBold">Bold element is not allowed in title.</sch:report>

  <sqf:fix id="resolveBold">
    <sqf:description>
      <sqf:title>Change the bold element into text</sqf:title>
    </sqf:description>
    <sqf:replace match="b" select="node()"/>
  </sqf:fix>
</sch:rule>
```


An SQF fix consists of a set of operations that can be performed on an XML document. These are basic operations (add, delete, replace, and string replace) that need to make precise changes in the document. This means that when a fix is applied, only the affected part of the XML document should be changed and the DOCTYPE declaration, entities, etc. must be preserved.

Conclusion

It is important to have a quality control over the XML documents from your project. To achieve this you can use Schematron schema in combination with an XSD, RNG, or DTD schema. Schematron solves the limitation that other types of schema have when validating XML documents because it allows the schema author to define the tests and control the messages that are presented to the user. The validation problems are more accessible to users and it ensures that they understand the problem.

Contact:
octavian\_nadolu@oxygenxml.com
