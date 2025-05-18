<%@ page import = "java.io.*" %>
<%@ page import = "jakarta.servlet.*" %>
<%@ page import = "jakarta.servlet.http.*" %>

<% 
String n1 = request.getParameter("num1");
String n2 = request.getParameter("num2");
String op = request.getParameter("operation");

double res = 0;
String msg = "";
try{
    double num1 = Double.parseDouble(n1);
    double num2 = Double.parseDouble(n2);

    switch(op){
        case("add"):
            res = num1 + num2;
            msg = "Addition";
            break;
        case("subtract"):
            res = num1 - num2;
            msg = "Subtraction";
            break;
        case("multiply"):
            res = num1 * num2;
            msg = "Multiplication";
            break;  
        case("divide"):
            if(num2 == 0){
                msg = "Division by zero is not allowed.";
            } else {
                res = num1 / num2;
                msg = "Division";
            }
            break;
        default:
            msg = "Invalid operation.";     
        }

    }catch(Exception e){
        msg = "Error: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Result</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: rgb(241, 209, 214);
            text-align: center;
            padding: 60px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .result-container {
            background: white;
            display: inline-block;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 0px 12px #ccc;
            background-color: #fe98e6;
        }

        h2 {
            color: #2c3e50;
            font-size: 45px;
            font-weight: 800;
        }

        .value {
            font-size: 22px;
            color: #442fe3;
            margin: 20px 0;
            font-weight: 700;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            background-color: rgb(224, 58, 253);
            padding: 10px 18px;
            border-radius: 6px;
            font-size: 22px;
            color: black;
            font-weight: 500;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: rgb(206, 69, 230);
        }
    </style>
</head>
<body>
    <div class="result-container">
        <h1>
            Calculated Result 
        </h1>
        <p class="value"><%= res %></p>
        <p class="value"><%= msg %></p>
        <a href="calculator.jsp"> Try Again</a>
    </div>
</body>
</html>