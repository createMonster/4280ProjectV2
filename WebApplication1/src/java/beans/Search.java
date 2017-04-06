package beans;

import java.io.IOException;
import java.util.*;
import java.text.*;
import java.sql.*;


public class Search {
  private String startDate, endDate;
  private String origin, destination;

  public Search() {
    setStartDate(startDate);
    setEndDate(endDate);
    setOrigin(origin);
    setDestination(destination);
  }
  

  public String getStartDate() {
    return(startDate);
  }

  public void setStartDate(String startDate) {
    this.startDate = startDate;
  }

  public String getEndDate() {
    return(endDate);
  }

  public void setEndDate(String endDate) {
    this.endDate = endDate;
  }

  public String getOrigin() {
    return(origin);
  }

  public void setOrigin(String origin) {
    this.origin = origin;
  }

  public String getDestination() {
    return(destination);
  }

  public void setDestination(String destination) {
    this.destination = destination;
  }  

  // This would be replaced by a database lookup
  // in a real application.
  
  public String getFlights() throws SQLException, IOException, ClassNotFoundException {	
    String flightOrigin =
      replaceIfMissing(getOrigin(), "Nowhere");
    String flightDestination =
      replaceIfMissing(getDestination(), "Nowhere");
    java.util.Date today = new java.util.Date();
    DateFormat formatter =
      DateFormat.getDateInstance(DateFormat.MEDIUM);
    String dateString = formatter.format(today);
    String flightStartDate =
      replaceIfMissing(getStartDate(), dateString);
    String flightEndDate =
      replaceIfMissing(getEndDate(), dateString);
    
    DBManager manager = DBManager.getInstance();
	String parameters = flightOrigin + " " + flightDestination + " " + flightStartDate + " " + flightEndDate;
	ResultSet rs = manager.executeSQLStatement("GETFLIGHTS", parameters);
	String flightString = "";
	while (rs.next()){
		String Fno = rs.getString(1);
		String CompanyID = rs.getString(2);
		String DepAirport = rs.getString(3);
		String ArrAirport = rs.getString(4);
		String stop1 = rs.getString(5);
		String stop2 = rs.getString(6);
		String DepDate = rs.getString(7);
		String ArrDate = rs.getString(8);
		String DepTime = rs.getString(9);
		String ArrTime = rs.getString(10);
		String AirplaneModel = rs.getString(11);
		String price = rs.getString(12);
		flightString = flightString + getFlightDescription(Fno,
														   CompanyID,
														   DepAirport,
														   ArrAirport,
														   stop1,
														   stop2,
														   DepDate,
														   ArrDate,
														   DepTime, 
														   ArrTime, 
														   AirplaneModel,
														   price);
	}
    
//    String [][] flights =
//      { { "Java Airways", "1522", "455.95", "Java, Indonesia",
//          "Sun Microsystems", "9:00", "3:15" },
//        { "Servlet Express", "2622", "505.95", "New Atlanta",
//          "New Atlanta", "9:30", "4:15" },
//        { "Geek Airlines", "3.14159", "675.00", "JHU",
//          "MIT", "10:02:37", "2:22:19" } };
//    String flightString = "";
//    for(int i=0; i<flights.length; i++) {
//      String[] flightInfo = flights[i];
//      flightString =
//        flightString + getFlightDescription(flightInfo[0],
//                                            flightInfo[1],
//                                            flightInfo[2],
//                                            flightInfo[3],
//                                            flightInfo[4],
//                                            flightInfo[5],
//                                            flightInfo[6],
//                                            flightOrigin,
//                                            flightDestination,
//                                            flightStartDate,
//                                            flightEndDate);
//    }
    return(flightString);
  }

  private String getFlightDescription(
                                      String flightNum,
                                      String CompanyID,
                                      String flightOrigin,
                                      String flightDestination,
                                      String stop1,
                                      String stop2,
                                      String flightStartDate,
                                      String flightEndDate,
                                      String time1,
                                      String time2,
                                      String AirplaneModel,                                    
                                      String price) {
    String flight =
      "<P><BR>\n" +
      "<TABLE WIDTH=\"100%\"><TR><TH CLASS=\"COLORED\">\n" +
      "<B>" + CompanyID + " Flight " + flightNum +
      " ($" + price + ")</B></TABLE><BR>\n" +
      "<B>Outgoing:</B> Leaves " + flightOrigin +
      " at " + time1 + " AM on " + flightStartDate +
      ", arriving in " + flightDestination +
      " at " + time2 + " PM (1 stop -- " + stop1 + ").\n" +
      "<BR>\n" +
      "<B>Return:</B> Leaves " + flightDestination +
      " at " + time1 + " AM on " + flightEndDate +
      ", arriving in " + flightOrigin +
      " at " + time2 + " PM (1 stop -- " + stop2 + ").\n";
    return(flight);
  }
  
  private String replaceIfMissing(String value,
                                  String defaultValue) {
    if ((value != null) && (value.length() > 0)) {
      return(value);
    } else {
      return(defaultValue);
    }
  }
     
}
