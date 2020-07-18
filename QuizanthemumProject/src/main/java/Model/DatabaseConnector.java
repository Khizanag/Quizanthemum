package Model;

import Configs.Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * this is a singleton class.
 * To get connection you should use getInstance() method.
 */
public class DatabaseConnector implements Config {

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
