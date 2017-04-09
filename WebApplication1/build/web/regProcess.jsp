
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>
            <jsp:useBean id = "newCustomer" class = "beans.Customer" scope="session"/>
            <jsp:setProperty name = "newCustomer" property = "*" />
            <%@ page import ="java.sql.*" %>
            <%@ page import ="beans.*" %>
            <%
                try {
                    DBManager manager = DBManager.getInstance();
                    String id = newCustomer.getId();
                    String email = newCustomer.getEmail();
                    String username = newCustomer.getUsername();
                    String password = newCustomer.getPassword();
                    String phone = newCustomer.getPhone();
                    String parameters = id + " " + email + " " + username + " " + password + " " + phone;
                    int row = manager.updateSQLStatement("REGISTER", parameters);

                    if (row == 1) {
                        out.print("Registration Successfull!" + "<a href='registerLogin.jsp'>Go to Login</a>");
                    } else {
                        out.print("Registration failed!" + "<a href='registerLogin.jsp'>Go back to register again</a>");
                    }
                } catch (NullPointerException e) {
                    out.print("Something happened");
                }

            %>
        </h3>
    </body>
</html>
