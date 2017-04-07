package beans;

import java.sql.*;
import java.io.*;
import java.util.*;


public class DBManager {

    private final String DB_NAME = "aiad017_db";//really?
    private final String DB_USERNAME = "aiad017";
    private final String DB_USERPWD = "aiad017";
    private final String url = "jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName = aiad017_db;";
    private static DBManager instance;
    private List<String> sqlStatementNames;

    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String strSQL = null;
    String result = null;

    /**
     *
     * @param db
     * @param user
     * @param pwd
     */
    private DBManager() throws ClassNotFoundException {

        connect();

    }

    public static DBManager getInstance() throws ClassNotFoundException {
        // TODO - implement DBManager.getInstance
        if (instance == null) {
            instance = new DBManager();
        }
        return instance;

    }

    public void connect() throws ClassNotFoundException {
        // TODO - implement DBManager.connect
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(url, DB_USERNAME, DB_USERPWD);

        } catch (SQLException sqlex) {
            sqlex.printStackTrace();
        }
        throw new UnsupportedOperationException();
    }

    public void disconnect() throws SQLException {
        con.close();
        stmt.close();
        rs.close();
    }

    public String getSQLStatement(String name) throws IOException {

        String filename = "sql.txt";
        String line = null;
        FileReader fileReader = null;
        String statement = null;
        BufferedReader bufferedReader = null;
        try {
            fileReader = new FileReader(filename);
            bufferedReader = new BufferedReader(fileReader);
            while ((line = bufferedReader.readLine()) != null) {
                if (line.contains(name)) {
                    int equalMark = line.indexOf("=");
                    statement = line.substring(equalMark + 1);
                    return statement;
                }
            }
        } catch (FileNotFoundException ex) {
            System.out.println(
                    "Unable to open file '"
                    + filename + "'");
        } catch (IOException ex) {
            // Or we could just do this: 
            ex.printStackTrace();
        } finally {
            if (fileReader != null) {
                bufferedReader.close();
            }
        }
        return null;//TBD
    }

    //to be modified
    public ResultSet executeSQLStatement(String name, String parameters) throws IOException, SQLException {
        String statement = getSQLStatement(name);
        //String firstWord = statement.substring(0, statement.indexOf(' '));
        String[] parameter = parameters.split(" ");
        for (int i = 0; i < parameter.length; i++) {
            stmt.setString(i + 1, parameter[i]);//to be modified
        }

        stmt = con.prepareStatement(statement);
        //if(firstWord == "SELECT" || firstWord =="select"){			
        rs = stmt.executeQuery(statement);
        return rs;
        //}
//		else{
//			int rows = stmt.executeUpdate(statement);
//			return new String("Success");
//		}
    }

    public int updateSQLStatement(String name, String parameters) throws IOException {
        String statement = getSQLStatement(name);
        //String firstWord = statement.substring(0, statement.indexOf(' '));
        String[] parameter = parameters.split(" ");
        try {
            for (int i = 0; i < parameter.length; i++) {
                stmt.setString(i + 1, parameter[i]);//to be modified
            }
            stmt = con.prepareStatement(statement);
            int rows = stmt.executeUpdate(statement);
            return rows;
        } catch (SQLException sqle) {
            System.out.print(sqle.getMessage());
            return 0;
        }
    }

}
