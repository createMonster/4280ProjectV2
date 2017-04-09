<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- 
Front end to travel servlet.
   
Taken from Core Servlets and JavaServer Pages
from Prentice Hall and Sun Microsystems Press,
http://www.coreservlets.com/.
&copy; 2000 Marty Hall; may be freely used or adapted.
-->
<html><head>
<meta http-equiv="content-type" content="text/html; charset=Big5">
  <title>Online Travel Quick Search</title>
  <link rel="STYLESHEET" href="Online%20Travel%20Quick%20Search_files/travel-styles.css" type="text/css">
</head>

<body>
<br>
<h1>Online Travel Quick Search</h1>

<form action="searchResult.jsp" method="POST">
<center>
<%  
    String origin = request.getParameter("origin");
    String destination = request.getParameter("destination");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    
    if(origin==null)
        out.print("<p style='color: red'>Origin is needed</p>");
    if(destination==null)
        out.print("<p style='color: red'>Destination is needed</p>");
    if(startDate==null)
        out.print("<p style='color: red'>Start date is needed</p>");
    if(endDate==null)
        out.print("<p style='color: red'>endDate is needed</p>");
    %>
    
Origin: <input name="origin" type="TEXT"><br>
Destination: <input name="destination" type="TEXT"><br>
Start date (MM/DD/YY): 
  <input name="startDate" size="8" type="TEXT"><br>
End date (MM/DD/YY): 
  <input name="endDate" size="8" type="TEXT"><br>
<p>
<table cellspacing="1">
<tbody><tr>
  <th>&nbsp;<img src="Online%20Travel%20Quick%20Search_files/airplane.gif" alt="Book Flight" align="TOP" height="29" width="100">&nbsp;
  </th><th>&nbsp;<img src="Online%20Travel%20Quick%20Search_files/passport.gif" alt="Edit Account" align="MIDDLE" height="100" width="71">&nbsp;
</th></tr><tr>
  <th><small>
      <input name="flights" value="Book Flight" type="SUBMIT">
      </small>
  </th><th><small>
      <input name="account" value="Edit Account" type="SUBMIT">
      </small>
</th></tr></tbody></table>
</p></center>
</form>
<br>
<p align="CENTER">
<b>Not yet a member? Get a free account
<a href="registerLogin.jsp">here</a>.</b><br>
<a href = "logout.jsp">logout1</a>
</p>


</body></html>