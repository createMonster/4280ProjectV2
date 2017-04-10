<%-- 
    Document   : changePwd
    Created on : Apr 10, 2017, 11:55:57 AM
    Author     : wenloncao2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>
        
        <form method = "POST" action = "" onsubmit = "">
            Old Password: <br>
            <input type="password" name="oldPassword"><br>
            New Password: <br>
            <input type="password" name="newPassword"><br>
            Please input the new password again: <br>
            <input type="password" name="newPassword"><br>
            <input type = "submit" value = "Confirm">
        </form>
    </body>
</html>
