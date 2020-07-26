package Model.Managers;

import Model.DatabaseConnector;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class TagEventsManager {
    // TODO ჯერ ვიკიდებთ სადამ არ აეწყობა

    private ServletContext context;
    private Connection connection;
    private Statement statement;

    public TagEventsManager(ServletContext context){
        this.context = context;
        this.connection = DatabaseConnector.getInstance();
        try {
            statement = connection.createStatement();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
