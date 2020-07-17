package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {

    public String USERNAME = "root";
    public String PASSWORD = "paroli12345678";
    public String URL = "jdbc:mysql://localhost:3306/";
    public String DATABASE_NAME = "intelij_db";
    private static Connection connection = null;

    private Connector(){ }

    public Connection getInstance(){
        if(connection == null)
            initConnection();
        return connection;
    }

    private void initConnection(){
        System.setProperty("jdbc.drivers", "sun.jdbc.odbc.JdbcodbcDriver");
        try {
            connection = DriverManager.getConnection(URL+DATABASE_NAME, USERNAME, PASSWORD);
        } catch (SQLException unused) {
            System.out.println("SQLEcxeption: during creating connection in Connector");
        }
    }
}
