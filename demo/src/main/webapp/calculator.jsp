<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculator using JSP</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: rgb(241, 209, 214);
            text-align: center;
            padding: 50px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        h2 {
            color: #333;
            font-size: 45px;
            font-weight: 800;
        }

        form {
            font-size: 20px;
            background-color: #fe98e6;
            display: inline-block;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #aaa;
            width: 500px;
            height: 300px;
        }

        input, select {
            padding: 8px;
            margin: 10px;
            width: 200px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 20px;
        }

        input[type="submit"] {
            background-color: rgb(224, 58, 253);
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 25px;
        }

        input[type="submit"]:hover {
            background-color: rgb(206, 69, 230);
        }
    </style>
</head>
<body>
    <h2>Calculator using JSP</h2>
    <form action="calresult.jsp" method="post">
        Number 1: <input type="text" name="num1" placeholder="Enter 1st number" required><br>
        Number 2: <input type="text" name="num2" placeholder="Enter 2nd number"  required><br>
        Operation:
        <select name="operation" required>
            <option value="add">Add</option>
            <option value="subtract">Subtract</option>
            <option value="multiply">Multiply</option>
            <option value="divide">Divide</option>
        </select><br>
        <input type="submit" value="Calculate">
    </form>
</body>
</html>
