package Model.Managers;

import Configs.Config;
import Configs.FriendshipsTableConfig;
import Model.DatabaseConnector;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class FriendshipsManager implements Config, FriendshipsTableConfig {

    private ManagersManager manager;
    private Connection connection;
    private Statement statement;

    public FriendshipsManager(ManagersManager manager){
        this.manager = manager;
        this.connection = DatabaseConnector.getInstance();
        try {
            statement = connection.createStatement();
        } catch (SQLException unused) { }
    }

    public int getFriendsCount(int ID){
        // TODO
        return -1;
    }

}