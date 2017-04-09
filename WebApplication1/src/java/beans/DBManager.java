package beans;

import java.sql.*;
import java.io.*;
import java.util.*;

public final class DBManager {

    private final String DB_NAME = "aiad037_db";
    private final String DB_USERNAME = "aiad037";
    private final String DB_USERPWD = "aiad037";
    private final String url = "jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName = aiad037_db;";
    private static DBManager instance;
    //private List<String> sqlStatementNames;

    private Connection con = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    //private String strSQL = null;
    //private String result = null;
    
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
    }

    public void disconnect() throws SQLException {
        con.close();
        stmt.close();
        rs.close();
    }

//    public String getSQLStatement(String name) throws IOException {
//
//        String filename = "C:\\Users\\wenloncao2\\Desktop\\4280ProjectV2\\WebApplication1\\src\\java\\beans\\sql.txt";
//        String line = null;
//        FileReader fileReader = null;
//        String statement = "SQL STATEMENT NOT FOUND";
//        BufferedReader br = null;
//        try {
//            fileReader = new FileReader(filename);
//            br = new BufferedReader(fileReader);
//            line = br.readLine();
//            while (line != null) {
//                return "Success!";
////                if (line.contains(name)) {
////                    int equalMark = line.indexOf("=");
////                    statement = line.substring(equalMark + 2);
////                    return statement;   
////                }
////                line = br.readLine();
//            }
//        } catch (FileNotFoundException ex) {
//            System.out.println(
//                    "Unable to open file '"
//                    + filename + "'");
//        } catch (IOException ex) {
//            // Or we could just do this: 
//            ex.printStackTrace();
//        } finally {
//            if (fileReader != null) {
//                br.close();
//            }
//        }
//        return statement;
//     
//    }

    //to be modified
    public ResultSet executeSQLStatement(String name, String parameters) throws IOException, SQLException {
        SQLManager sqlm = new SQLManager();
        String statement = sqlm.getStatement(name);
        //String firstWord = statement.substring(0, statement.indexOf(' '));
        String[] parameter = parameters.split(" ");
        stmt = con.prepareStatement(statement);
        for (int i = 0; i < parameter.length; i++) {
            stmt.setString(i + 1, parameter[i]);//to be modified
        }   
		
        rs = stmt.executeQuery();
        return rs;

    }

    public int updateSQLStatement(String name, String parameters) throws IOException, SQLException {
        SQLManager sqlm = new SQLManager();
        String statement = sqlm.getStatement(name);

        //return statement;
        String[] parameter = parameters.split(" ");
        stmt = con.prepareStatement(statement);
        try {
            for (int i = 0; i < parameter.length; i++) {
                stmt.setString (i + 1, parameter[i]);//to be modified
            }
            int rows = stmt.executeUpdate();
            return rows;
        } catch (SQLException sqle) {
            System.out.print(sqle.getMessage());
            return -1;
        }
    }

}
