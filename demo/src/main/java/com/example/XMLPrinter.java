package com.example;

import java.io.IOException;
import java.io.Writer;

import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XMLPrinter {

    // Changed from JspWriter to generic Writer to avoid servlet-api version conflicts
    public static void printDOM(Node node, Writer out) throws IOException {
        if (node.getNodeType() == Node.ELEMENT_NODE) {
            out.write("<li><span class='element'>&lt;" + node.getNodeName() + "&gt;</span>");

            NamedNodeMap attrs = node.getAttributes();
            for (int i = 0; i < attrs.getLength(); i++) {
                Node attr = attrs.item(i);
                out.write(" <span class='text'>@" + attr.getNodeName() + "=\"" + attr.getNodeValue() + "\"</span>");
            }

            NodeList children = node.getChildNodes();
            boolean hasElementChild = false;
            for (int i = 0; i < children.getLength(); i++) {
                if (children.item(i).getNodeType() == Node.ELEMENT_NODE) {
                    hasElementChild = true;
                    break;
                }
            }

            if (hasElementChild) {
                out.write("<ul>");
                for (int i = 0; i < children.getLength(); i++) {
                    printDOM(children.item(i), out);
                }
                out.write("</ul>");
            } else {
                String text = node.getTextContent().trim();
                if (!text.isEmpty()) {
                    out.write(" : <span class='text'>" + escapeHtml(text) + "</span>");
                }
            }

            out.write("</li>");
        }
    }

    // Helper method to escape HTML special chars to avoid HTML injection
    private static String escapeHtml(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
}
