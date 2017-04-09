<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
  <TITLE>Best Available Flights</TITLE>
  <LINK REL=STYLESHEET
        HREF="travel-styles.css"
        TYPE="text/css">
</HEAD>

<BODY>
<H1>ARE YOU A MEMBER OF US? </H1>
<%--<jsp:useBean id = "oldCustomer" class = "beans.Customer" scope="session"/>--%>
<jsp:useBean id = "newCustomer" class = "beans.Customer" scope="session"/>
<CENTER>

<h3>I am! </h3>

<form action="loginProcess.jsp" method="post">  
Email:<input type="text" name="email"/><br/><br/>  
Password:<input type="password" name="password"/><br/><br/>
<%--<jsp:setProperty name = "oldCustomer" property = "*" />--%>
<%
    //request.setAttribute("oldCustomer", oldCustomer);
%>
<%--<jsp:setProperty name = "oldCustomer" 
				 property = "email" 
				 value = '<%= request.getParameter("oldEmail") %>'/>
<jsp:setProperty name = "oldCustomer" 
				 property = "password" 
				 value = '<%= request.getParameter("oldPassword") %>'/>--%>
				 
<input type="submit" value="Login"/> 
</form>
<br/>
  
<h3>Not yet! Register now! </h3>
<form action="regProcess.jsp" method="post">
<!--Your ID:<input type="text" name="id"/><br/><br/> -->
Email:<input type="text" name="email"/><br/><br/> 
Name:<input type="text" name="username"/><br/><br/>
Password:<input type="password" name="password"/><br/><br/>	
Phone number: <input type="text" name="phone"/> <br/><br/>
<jsp:setProperty name = "newCustomer" property = "*" />
<%
    request.setAttribute("newCustomer", newCustomer);
%>
<%--<jsp:setProperty name = "newCustomer" 
				 property = "id" 
				 value = '<%= request.getParameter("newId") %>'/>
<jsp:setProperty name = "newCustomer" 
				 property = "email" 
				 value = '<%= request.getParameter("newEmail") %>'/>
<jsp:setProperty name = "newCustomer" 
				 property = "username" 
				 value = '<%= request.getParameter("newUsername") %>'/>
<jsp:setProperty name = "newCustomer" 
				 property = "password" 
				 value = '<%= request.getParameter("newPassword") %>'/>
<jsp:setProperty name = "newCustomer" 
				 property = "phone" 
				 value = '<%= request.getParameter("newPhone") %>'/>--%>
<input type="submit" value="Register"/> 
</form>
</CENTER>

</BODY>
</HTML>