package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * this is a singleton class.
 * To get connection you should use getInstance() method.
 */
public class DatabaseConnector {

    /* Database info */
    public static final String USERNAME = "root";
    public static final String PASSWORD = "paroli12345678";
    public static final String URL = "jdbc:mysql://localhost:3306/";
    public static final String DATABASE_NAME = "intelij_db";

    private static Connection connection = null;

    private DatabaseConnector(){ }

    public static Connection getInstance(){
        if(connection == null)
            initConnection();
        return connection;
    }

    private static void initConnection(){
        System.setProperty("jdbc.drivers", "sun.jdbc.odbc.JdbcodbcDriver");
        try {
            connection = DriverManager.getConnection(URL+DATABASE_NAME, USERNAME, PASSWORD);
        } catch (SQLException unused) {
            System.out.println("SQLEcxeption: during creating connection in Connector");
        }
    }

    public static void closeConnection(){
        try {
            connection.close();
        } catch (SQLException throwables) {
            System.out.println("Error during closing Database connection in 'DatabaseConnector'");
        }
    }
}
