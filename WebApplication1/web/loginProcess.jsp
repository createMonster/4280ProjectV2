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
        <jsp:useBean id = "oldCustomer" class = "beans.Customer" scope="session"/>
        <jsp:setProperty name = "oldCustomer" property = "*" />
        <%@ page import ="java.sql.*" %>
        <%@ page import ="beans.*" %>
        <h3>
        <%
            //Customer oldCustomer = (Customer)request.getAttribute("oldCustomer");
            try {
                String email = oldCustomer.getEmail();
                String password = oldCustomer.getPassword();
                DBManager manager = DBManager.getInstance();
                ResultSet rs = manager.executeSQLStatement("LOGIN", email);
                String oldPass = null;
                while (rs.next()) {
                    oldPass = rs.getString(1);
                }
                if (password.equals(oldPass)) {
                    out.print("Login Successfull!" + "<a href='index.html'>Return to the index</a>");
                } else {
                    //out.println(password + " " + oldPass);
                    out.print("Login failed!" + "<a href='registerLogin.jsp'>Go back to register or login again</a>");
                }
            } catch (NullPointerException e) {
                out.print("Something happened");
            }
        %>
        </h3>
    </body>
</html>
