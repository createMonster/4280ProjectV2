<%-- 
    Document   : loginProcess
    Created on : Apr 7, 2017, 4:23:28 PM
    Author     : wenloncao2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import ="java.sql.*" %>
        <%
            String email = oldCustomer.getEmail();
            String password = oldCustomer.getPassword();
            DBManager manager = DBManager.getInstance();
            ResultSet rs = manager.executeSQLStatement("LOGIN", email);
            String realPwd = null;
            while(rs.next()){
                String realPwd = rs.getString(1);
            }
            if(password == realPwd)
                out.print("Login Successfull!"+"<a href='index.html'>Return to the index</a>");
            else 
                out.print("Login failed!"+"<a href='registerLogin.jsp'>Go back to register or login again</a>");
     
        %>
    </body>
</html>
