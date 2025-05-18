<%@ page import="org.w3c.dom.*" %>
<%@ page import="com.example.XMLPrinter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Courses XML Structure</title>
    <style>
        ul { list-style-type: none; }
        .element { color: navy; font-weight: bold; }
        .text { color: green; }
    </style>
</head>
<body>
    <h2>📘 Courses XML Structure</h2>
    <%
        Document doc = (Document) request.getAttribute("xmlDoc");
        if (doc != null) {
            out.write("<ul>");
            // Use XMLPrinter.printDOM with Writer (JspWriter extends Writer)
            XMLPrinter.printDOM(doc.getDocumentElement(), out);
            out.write("</ul>");
        } else {
            out.write("<p style='color:red;'>XML document not available.</p>");
        }
    %>
</body>
</html>
