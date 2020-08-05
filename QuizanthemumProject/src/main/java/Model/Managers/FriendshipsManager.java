package Model.Managers;

import Configs.Config;
import Configs.FriendshipsTableConfig;
import Controller.Classes.User.Friendship;
import Model.DatabaseConnector;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class FriendshipsManager implements Config, FriendshipsTableConfig {

    private final ManagersManager manager;
    private final Connection connection;

    public FriendshipsManager(ManagersManager manager){
        this.manager = manager;
        this.connection = DatabaseConnector.getInstance();
    }

    public Friendship getFriendship(int ID){
        String query = "SELECT * "
                + " FROM " + FRIENDSHIPS_TABLE_NAME
                + " WHERE ID = " + ID + ";\n";
        try{
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            if(resultSet.next()){
                return buildFriendship(resultSet);
            }
        } catch (SQLException throwable){
            throwable.printStackTrace();
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

    public List<Integer> getFriendIDsOf(int ID) {
        String firstQuery = "SELECT " + FRIENDSHIPS_TABLE_COLUMN_3_SECOND_FRIEND_ID
                + " FROM " + FRIENDSHIPS_TABLE_NAME
                + " WHERE " + FRIENDSHIPS_TABLE_COLUMN_2_FIRST_FRIEND_ID + " = " + ID;
        String secondQuery = "SELECT " + FRIENDSHIPS_TABLE_COLUMN_2_FIRST_FRIEND_ID
                + " FROM " + FRIENDSHIPS_TABLE_NAME
                + " WHERE " + FRIENDSHIPS_TABLE_COLUMN_3_SECOND_FRIEND_ID + " = " + ID;
        try{
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(firstQuery);
            List<Integer> friendIDs = new ArrayList<>();
            while(resultSet.next()){
                int friendID = resultSet.getInt(FRIENDSHIPS_TABLE_COLUMN_3_SECOND_FRIEND_ID);
                friendIDs.add(friendID);
            }

            resultSet = statement.executeQuery(secondQuery);
            while(resultSet.next()){
                int friendID = resultSet.getInt(FRIENDSHIPS_TABLE_COLUMN_2_FIRST_FRIEND_ID);
                friendIDs.add(friendID);
            }
            return friendIDs;
        } catch(SQLException throwables){
            throwables.printStackTrace();
        }
        return null;
    }
}