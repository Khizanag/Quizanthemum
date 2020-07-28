package Model.Managers;

import Model.DatabaseConnector;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class TagEventsManager {

    private Connection connection;
    private Statement statement;
    private ManagersManager manager;

    public TagEventsManager(ManagersManager manager){
        this.manager = manager;
        this.connection = DatabaseConnector.getInstance();
        try {
            statement = connection.createStatement();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public ManagersManager getManager(){
        return manager;
    }

}
