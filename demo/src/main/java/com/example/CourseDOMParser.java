package com.example;
import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class CourseDOMParser {
    public static void main(String[] args) {
        try {
            File xmlFile = new File("D:/Java Programming/MyServletApp/demo/src/main/webapp/WEB-INF/courses.xml");
            if (!xmlFile.exists()) {
                System.out.println("Error: XML file not found at " + xmlFile.getAbsolutePath());
                return;
            }
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(xmlFile);
            doc.getDocumentElement().normalize();
            NodeList courseList = doc.getElementsByTagName("course");
            System.out.println("Course Details:\n");
            for (int i = 0; i < courseList.getLength(); i++) {
                Node courseNode = courseList.item(i);
                if (courseNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element courseElement = (Element) courseNode;
                    String id = courseElement.getAttribute("id");
                    String name = courseElement.getElementsByTagName("name").item(0).getTextContent();
                    String instructor = courseElement.getElementsByTagName("instructor").item(0).getTextContent();
                    String credits = courseElement.getElementsByTagName("credits").item(0).getTextContent();
                    System.out.println("Course ID    : " + id);
                    System.out.println("Name         : " + name);
                    System.out.println("Instructor   : " + instructor);
                    NodeList instructorIdList = courseElement.getElementsByTagName("instructorid");
                    if (instructorIdList.getLength() > 0) {
                        String instructorId = instructorIdList.item(0).getTextContent();
                        System.out.println("Instructor ID: " + instructorId);
                    }
                    System.out.println("Credits      : " + credits);
                    System.out.println("----------------------------------");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

// cd "D:\Java Programming\MyServletApp\demo\src\main\java"
// javac com/example/CourseDOMParser.java
// java com.example.CourseDOMParser
