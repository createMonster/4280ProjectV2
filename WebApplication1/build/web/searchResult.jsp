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
<CENTER>
<jsp:useBean id=""
             class="beans.Search"
             scope="session" />
Finding flights for
<P>
<jsp:getProperty name="search" property="flights" />

<P>
<BR>
<HR>
<BR>
<FORM ACTION="/servlet/BookFlight">
<P>
<P>
<INPUT TYPE="button" NAME="holdButton" VALUE="Hold for 24 Hours" onClick="alert(&quot;Not implemented yet!&quot;);" />
<P>
<INPUT TYPE="button" NAME="bookItButton" VALUE="Book It!" onClick="alert(&quot;Not implemented yet!&quot;);" />
</FORM>
</CENTER>

</BODY>
</HTML>
