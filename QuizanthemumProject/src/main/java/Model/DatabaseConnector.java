package Model;

import Configs.Config;

import java.sql.*;

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

    public static int getLastInsertID(){
        DatabaseConnector.getInstance(); // to be sure that connection is not null
        String query = "SELECT LAST_INSERT_ID() AS LAST_INSERT_ID;";
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);
            if(rs.next()){
                return rs.getInt("LAST_INSERT_ID");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return DEFAULT_ID;
    }

}
