<%@ page import="com.example.beans.CgpaCalculatorBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>CGPA Calculator</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: #fff;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding-top: 40px;
        }
        .container {
            background: rgba(255, 255, 255, 0.15);
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.3);
            width: 450px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            text-shadow: 1px 1px 5px rgba(0,0,0,0.3);
        }
        label {
            font-weight: bold;
            font-size: 16px;
        }
        input[type=number] {
            width: 80%;
            padding: 8px 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: none;
            font-size: 15px;
        }
        input[type=number]:focus {
            outline: none;
            box-shadow: 0 0 8px #fff;
            background-color: #f0f0f0;
            color: #333;
        }
        input[type=submit] {
            background: #6a11cb;
            background: linear-gradient(to right, #2575fc, #6a11cb);
            color: white;
            font-weight: 700;
            border: none;
            padding: 12px 25px;
            border-radius: 25px;
            cursor: pointer;
            transition: background 0.3s ease;
            font-size: 16px;
            display: block;
            margin: 0 auto 20px;
            box-shadow: 0 4px 15px rgba(101, 41, 255, 0.6);
        }
        input[type=submit]:hover {
            background: linear-gradient(to right, #6a11cb, #2575fc);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            background-color: rgb(172, 170, 170);
            color: #6a11cb;
            font-weight: 400;
        }
        th, td {
            padding: 12px 15px;
            text-align: center;
            font-weight: 500;
        }
        th {
            background-color: #6a11cb;
            color: white;
            font-size: 16px;
        }
        tr:nth-child(even) {
            background-color: #d7d7d7;
        }
        h3 {
            background-color: rgba(0, 0, 0, 0.4);
            padding: 12px;
            border-radius: 10px;
            text-align: center;
            font-weight: 700;
            box-shadow: 0 0 10px #fff;
        }
        hr {
            border: 1px solid #fff;
            margin: 25px 0;
            opacity: 0.5;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>CGPA Calculator using JavaBeans & JSP</h2>
        <%
            String subjectsParam = request.getParameter("subjects");
            int subjects = 0;
            if (subjectsParam != null) {
                try {
                    subjects = Integer.parseInt(subjectsParam);
                } catch (NumberFormatException e) {
                    subjects = 0;
                }
            }
            if (request.getParameter("calculate") != null && subjects > 0) {
                String[] marksStr = request.getParameterValues("marks");
                String[] creditsStr = request.getParameterValues("credits");
                double[] marks = new double[subjects];
                double[] credits = new double[subjects];
                for (int i = 0; i < subjects; i++) {
                    try {
                        marks[i] = Double.parseDouble(marksStr[i]);
                        credits[i] = Double.parseDouble(creditsStr[i]);
                    } catch (Exception e) {
                        marks[i] = 0;
                        credits[i] = 0;
                    }
                }
                CgpaCalculatorBean bean = new CgpaCalculatorBean();
                bean.setNumberOfSubjects(subjects);
                bean.setMarks(marks);
                bean.setCredits(credits);
                double cgpa = bean.calculateCgpa();
        %>
                <h3>Your CGPA is: <%= String.format("%.2f", cgpa) %></h3>
                <hr>
        <%   }
        %>
        <form method="post">
            <label>Number of Subjects:</label><br>
            <input type="number" name="subjects" value="<%= subjects > 0 ? subjects : "" %>" min="1" max="20" required>
            <input type="submit" value="Set Subjects">
        </form>
        <%
            if (subjects > 0) {
        %>
        <form method="post">
            <input type="hidden" name="subjects" value="<%= subjects %>">
            <table>
                <tr>
                    <th>Subject</th>
                    <th>Marks (out of 100)</th>
                    <th>Credits</th>
                </tr>
                <%
                    for (int i = 0; i < subjects; i++) {
                %>
                <tr>
                    <td>Subject <%= (i + 1) %></td>
                    <td><input type="number" name="marks" min="0" max="100" step="0.01" required></td>
                    <td><input type="number" name="credits" min="0.5" step="0.1" required></td>
                </tr>
                <%
                    }
                %>
            </table>
            <input type="submit" name="calculate" value="Calculate CGPA">
        </form>
        <%
            }
        %>
    </div>
</body>
</html>