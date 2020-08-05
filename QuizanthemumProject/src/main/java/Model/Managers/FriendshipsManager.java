package Model.Managers;

import Configs.Config;
import Configs.FriendshipsTableConfig;
import Controller.Classes.User.Friendship;
import Model.DatabaseConnector;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class FriendshipsManager implements Config, FriendshipsTableConfig {

    private ManagersManager manager;
    private Connection connection;

    public FriendshipsManager(ManagersManager manager){
        this.manager = manager;
        this.connection = DatabaseConnector.getInstance();
    }

    public Friendship getFriendship(int ID){
        String query = "SELECT * "
                + " FROM " + FRIENDSHIPS_TABLE_NAME
                + " WHERE ID = " + ID;
        try{
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
    }

    public int insertFriendship(Friendship friendship){

    }

}