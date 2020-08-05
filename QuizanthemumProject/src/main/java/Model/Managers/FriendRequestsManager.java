package Model.Managers;

import Configs.Config;
import Configs.FriendRequestsTableConfig;
import Configs.FriendshipsTableConfig;
import Controller.Classes.OtherClasses.FriendRequest;
import Controller.Classes.User.Friendship;
import Model.DatabaseConnector;
import Model.Managers.ManagersManager;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class FriendRequestsManager implements Config, FriendRequestsTableConfig {

    private final ManagersManager manager;
    private final Connection connection;

    public FriendRequestsManager(ManagersManager manager){
        this.manager = manager;
        this.connection = DatabaseConnector.getInstance();
    }

    public FriendRequest getFriendRequest(int ID){
        String query = "SELECT * "
                + " FROM " + FRIEND_REQUESTS_TABLE_NAME
                + " WHERE " + FRIEND_REQUESTS_TABLE_COLUMN_1_ID + " = " + ID + ";\n";
        try{
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            if(resultSet.next()){
                return buildFriendRequest(resultSet);
            }
        } catch (SQLException throwable){
            throwable.printStackTrace();
        }
        return null;
    }

    private FriendRequest buildFriendRequest(ResultSet resultSet){
        try {
           int ID = resultSet.getInt(FRIEND_REQUESTS_TABLE_COLUMN_1_ID);
           int senderID = resultSet.getInt(FRIEND_REQUESTS_TABLE_COLUMN_2_SENDER_ID);
           int receiverID = resultSet.getInt(FRIEND_REQUESTS_TABLE_COLUMN_3_RECEIVER_ID);
           Date sendingDate = resultSet.getDate(FRIEND_REQUESTS_TABLE_COLUMN_4_SENDING_DATE);
           Date receivingDate = resultSet.getDate(FRIEND_REQUESTS_TABLE_COLUMN_5_RECEIVING_DATE);
           boolean isReceived = resultSet.getBoolean(FRIEND_REQUESTS_TABLE_COLUMN_6_IS_RECEIVED);
           boolean isAccepted = resultSet.getBoolean(FRIEND_REQUESTS_TABLE_COLUMN_7_IS_ACCEPTED);
           return new FriendRequest(ID, senderID, receiverID, sendingDate, receivingDate, isReceived, isAccepted, this);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    private List<FriendRequest> buildFriendRequestListFromQuery(String query){
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            List<FriendRequest> requests = new ArrayList<>();
            while(resultSet.next()){
                requests.add(buildFriendRequest(resultSet));
            }
            return requests;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public int insertFriendRequest(FriendRequest request){
        String query = "INSERT INTO " + FRIEND_REQUESTS_TABLE_NAME
                + " VALUES(null"
                + ", " + request.getSenderID()
                + ", " + request.getReceiverID()
                + ", " + request.getSendingDate()
                + ", " + request.getReceivingDate()
                + ", " + request.isReceived()
                + ", " + request.isAccepted()
                ;
        try{
            Statement statement = connection.createStatement();
            statement.execute(query);
            return DatabaseConnector.getLastInsertID();
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return DEFAULT_ID;
    }

    public List<FriendRequest> getWaitingSentFriendRequests(int senderID) {
        String query = "SELECT * "
                + " FROM " + FRIEND_REQUESTS_TABLE_NAME
                + " WHERE " + FRIEND_REQUESTS_TABLE_COLUMN_2_SENDER_ID + " = " + senderID
                + "             AND " + FRIEND_REQUESTS_TABLE_COLUMN_6_IS_RECEIVED + " = false";
        return buildFriendRequestListFromQuery(query);
    }

    public List<FriendRequest> getWaitingReceivedFriendRequests(int senderID) {
        String query = "SELECT * "
                + " FROM " + FRIEND_REQUESTS_TABLE_NAME
                + " WHERE " + FRIEND_REQUESTS_TABLE_COLUMN_3_RECEIVER_ID + " = " + senderID
                + "             AND " + FRIEND_REQUESTS_TABLE_COLUMN_6_IS_RECEIVED + " = false";
        return buildFriendRequestListFromQuery(query);
    }

    public void commitFriendRequestReceive(FriendRequest request){

    }
}