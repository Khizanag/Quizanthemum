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
import java.util.Date;

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
            if(resultSet.next()){
                return buildFriendship(resultSet);
            }
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return null;
    }

    private Friendship buildFriendship(ResultSet resultSet){
        try {
            int ID = resultSet.getInt(FRIENDSHIPS_TABLE_COLUMN_1_ID);
            int firstFriendID = resultSet.getInt(FRIENDSHIPS_TABLE_COLUMN_2_FIRST_FRIEND_ID);
            int secondFriendID = resultSet.getInt(FRIENDSHIPS_TABLE_COLUMN_3_SECOND_FRIEND_ID);
            Date makeFriendDate = resultSet.getDate(FRIENDSHIPS_TABLE_COLUMN_4_MAKE_FRIEND_DATE);
            boolean isAccepted = resultSet.getBoolean(FRIENDSHIPS_TABLE_COLUMN_5_IS_ACCEPTED);
            return new Friendship(ID, firstFriendID, secondFriendID, makeFriendDate, isAccepted, this);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public int insertFriendship(Friendship friendship){
        String query = "INSERT INTO " + FRIENDSHIPS_TABLE_NAME
                + " VALUES(null"
                + ", " + friendship.getFirstFriendID()
                + ", " + friendship.getSecondFriendID()
                + ", " + friendship.getMakeFriendDate()
                + ", " + friendship.isAccepted();
        try{
            Statement statement = connection.createStatement();
            statement.execute(query);
            return DatabaseConnector.getLastInsertID();
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return DEFAULT_ID;
    }

}