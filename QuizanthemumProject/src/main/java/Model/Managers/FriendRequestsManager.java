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

    public FriendRequest getFriendRequest(int senderID, int receiverID){
        String query =
                    "SELECT * "
                + " FROM " + FRIEND_REQUESTS_TABLE_NAME
                + " WHERE (" + FRIEND_REQUESTS_TABLE_COLUMN_2_SENDER_ID + " = " + senderID
                + "             AND " + FRIEND_REQUESTS_TABLE_COLUMN_3_RECEIVER_ID  + " = " + receiverID + ")"
                + "         OR (" + FRIEND_REQUESTS_TABLE_COLUMN_2_SENDER_ID + " = " + receiverID
                + "             AND " + FRIEND_REQUESTS_TABLE_COLUMN_3_RECEIVER_ID + " = " + senderID + ")"
                + " LIMIT 1";
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
            resultSet.close();
            statement.close();
            return requests;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public int insertFriendRequest(FriendRequest request){
        java.sql.Date receivingDate = request.getReceivingDate() ==  null ? null : new java.sql.Date(request.getReceivingDate().getTime());
        String query =
                    "INSERT INTO " + FRIEND_REQUESTS_TABLE_NAME
                + " VALUES(null"
                + ", " + request.getSenderID()
                + ", " + request.getReceiverID()
                + ", " + "'" + new java.sql.Date(request.getSendingDate().getTime()) + "'"
                + ", " + (receivingDate == null ? null : ("'" + receivingDate + "'"))
                + ", " + request.isReceived()
                + ", " + request.isAccepted()
                + ");";
        System.out.println("********QUERY : " + query);
        try{
            Statement statement = connection.createStatement();
            statement.execute(query);
            statement.close();
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
        String query = "UPDATE " + FRIEND_REQUESTS_TABLE_NAME
                + " SET "
                + "         " + FRIEND_REQUESTS_TABLE_COLUMN_6_IS_RECEIVED + " = " + request.isReceived() + ", "
                + "         " + FRIEND_REQUESTS_TABLE_COLUMN_7_IS_ACCEPTED + " = " + request.isAccepted()
                + " WHERE " + FRIEND_REQUESTS_TABLE_COLUMN_1_ID + " = " + request.getID();
        try{
            Statement statement = connection.createStatement();
            System.out.println("commitFriendRequestReceive: query: \n " + query);
            statement.execute(query);
            statement.close();
        } catch(SQLException throwables){
            throwables.printStackTrace();
        }
    }

    public boolean isWaitingFriendRequestSent(int fromUserID, int toUserID){
        System.out.println("from: "+ fromUserID);
        System.out.println("to: " + toUserID);
        String query =
                    "SELECT COUNT(1) "
                + " FROM " + FRIEND_REQUESTS_TABLE_NAME
                + " WHERE " + FRIEND_REQUESTS_TABLE_COLUMN_2_SENDER_ID + " = " + fromUserID
                + "         AND " + FRIEND_REQUESTS_TABLE_COLUMN_3_RECEIVER_ID + " = " + toUserID
                + "         AND " + FRIEND_REQUESTS_TABLE_COLUMN_6_IS_RECEIVED + " = false";
        boolean toReturn = false
                ;
        try{
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            if(resultSet.next()){
                int count = resultSet.getInt(1);
                toReturn = (count > 0);
            }
            resultSet.close();
            statement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        System.out.println("******** isWaiting: " + toReturn);
        return toReturn;
    }
}