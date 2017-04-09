
package beans;

/**
 *
 * @author wenloncao2
 */
public class SQLManager {
    private final String REGISTER = "INSERT into CCWuser (Uemail, UName, Upwd, UPhone)VALUES(?, ?, ?, ?)";
    private final String NEWCUSTOMER = "NSERT INTO CCWuser VALUES()";
    private final String GETFLIGHTS = "SELECT * FROM CCWflight where DepAirport = ? and ArrAirport = ? and DepDate = ? and ArrDate = ?";
    private final String LOGIN = "SELECT Upwd from CCWuser where Uemail = ?";
    
    public String getStatement(String name){
        if(name == "REGISTER")
            return REGISTER;
        else if(name == "NEWCUSTOMER")
            return NEWCUSTOMER;
        else if(name == "GETFLIGHTS")
            return GETFLIGHTS;
        else if(name == "LOGIN")
            return LOGIN;
        return null;
    }
    
}
