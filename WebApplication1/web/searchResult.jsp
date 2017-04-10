<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
    <HEAD>
        <TITLE>Best Available Flights</TITLE>
        <LINK REL=STYLESHEET
              HREF="travel-styles.css"
              TYPE="text/css">
    </HEAD>

    <BODY>
        <H1>Best Available Flights</H1>

        <jsp:useBean id="search"
                     class="beans.Search"
                     scope="session" />
        <jsp:setProperty name="search" property="*" />
        <p><h3>Finding flights for:</h3><br>
            Fly from <jsp:getProperty name = "search" property = "origin"/><br>
            To <jsp:getProperty name = "search" property = "destination"/><br>
            Start date: <jsp:getProperty name = "search" property = "startDate"/><br>
            End date: <jsp:getProperty name = "search" property = "endDate"/><br>
        </p>  
        <P>
            <jsp:getProperty name="search" property="flights" />
        <P>
        <BR>
        <HR>
        <BR>
     <% 
        Boolean status = (Boolean) session.getAttribute("loginStatus");  
        if(status==null){status = false;}
        if(!status){
            out.println("<FORM ACTION='registerLogin.jsp'>");
            out.println("<INPUT TYPE='submit' NAME='bookItButton' VALUE='Book It!' onClick='alert(&quot;You are required to log in!&quot;);'/>");
        }   
        else{
            out.print("<FORM ACTION='bookTicket.jsp'>");
            out.print("<INPUT TYPE='submit' NAME='bookItButton' VALUE='Book It!' />");
        }
 %>       
<P>
<P>
</FORM>


    </BODY>
</HTML>
