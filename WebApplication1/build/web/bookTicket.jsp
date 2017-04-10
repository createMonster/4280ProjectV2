<%-- 
    Document   : bookTicket
    Created on : Apr 10, 2017, 11:00:46 AM
    Author     : wenloncao2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Ticket</title>
    </head>
    <body>
        
        <form action=" " method="POST" onsubmit = "return confirm('All information confirmed?');>
            First name: <br>
            <input type="text" name="firstName"><br>
            Last name:<br>
            <input type="text" name="lastName"><br>
            Credit card number:<br>
            <input type="text" name="creditCard"><br>
            Number of personal identification:<br>
            <select>
                <option value="passport">Passport</option>
                <option value="idCard">ID Card</option>
            </select>
            <input type="text" name="identity"><br>
            <input type="submit" value = "Pay it now!"/>
        </form>
        
    </body>
</html>
