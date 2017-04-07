
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>
        <%@ page import ="java.sql.*" %>
        <%  
            DBManager manager = DBManager.getInstance();
            String id = newCustomer.getId();
            String email = newCustomer.getEmail();
            String username = newCustomer.getUsername();
            String password = newCustomer.getPassword();
            String phone = newCustomer.getPhone();
            String parameters = id + " " + email + " " + username + " " + password + " " + phone ;
            int row = manager.updateSQLStatement("REGISTER", parameters);
            
            if (row == 1) {
                out.print("Registration Successfull!"+"<a href='registerLogin.jsp'>Go to Login</a>");
            } else {
                out.print("Registration failed!"+"<a href='registerLogin.jsp'>Go back to register again</a>");
            }
        %>
        </h3>
    </body>
</html>
