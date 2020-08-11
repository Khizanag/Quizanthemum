package Model.Managers;

import Configs.AchievementsTableConfig;
import Controller.Classes.User.AchievementEvent;
import Model.DatabaseConnector;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static Configs.AchievementEventTableConfig.*;

public class AchievementEventsManager implements AchievementsTableConfig {

    private ManagersManager manager;
    private Connection connection;

    public AchievementEventsManager(ManagersManager manager){
        this.manager = manager;
        this.connection = DatabaseConnector.getInstance();
    }

    public List<AchievementEvent> getUserAchievements(int userID){
        String query = "SELECT * " +
                " FROM " + ACHIEVEMENT_EVENT_TABLE_NAME +
                " WHERE " + ACHIEVEMENT_EVENT_TABLE_COLUMN_3_USER_ID + " = " + userID + ";";
        List<AchievementEvent> achievementEvents = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet set = statement.executeQuery(query);
            while(set.next()){
                int achievementEventID = set.getInt(ACHIEVEMENT_EVENT_TABLE_COLUMN_1_ID);
                int achievementID = set.getInt(ACHIEVEMENT_EVENT_TABLE_COLUMN_2_ACHIEVEMENT_ID);
                Date achieveDate = set.getDate(ACHIEVEMENT_EVENT_TABLE_COLUMN_4_ACHIEVE_DATE);
                statement.close();
                achievementEvents.add(new AchievementEvent(achievementEventID, achievementID, userID, achieveDate));
            }
            set.close();
        } catch (SQLException unused) { }
        return achievementEvents;
    }

    public AchievementEvent getAchievement(int id){
        String query = "SELECT * " +
                " FROM " + ACHIEVEMENT_EVENT_TABLE_NAME +
                " WHERE " + ACHIEVEMENT_EVENT_TABLE_COLUMN_1_ID + " = " + id + ";";
        try {
            Statement statement = connection.createStatement();
            ResultSet set = statement.executeQuery(query);
            if(set.next()){
                int achievementID = set.getInt(ACHIEVEMENT_EVENT_TABLE_COLUMN_2_ACHIEVEMENT_ID);
                int userID = set.getInt(ACHIEVEMENT_EVENT_TABLE_COLUMN_3_USER_ID);
                Date achieveDate = set.getDate(ACHIEVEMENT_EVENT_TABLE_COLUMN_4_ACHIEVE_DATE);
                set.close();
                statement.close();
                return new AchievementEvent(id, achievementID, userID, achieveDate);
            }
        } catch (SQLException unused) { }
        return null;
    }

    public void insertAchievementEvent(AchievementEvent achievementEvent){
        String query = "INSERT INTO " + ACHIEVEMENT_EVENT_TABLE_NAME + " VALUES (null, ?, ?, ?);\n";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, achievementEvent.getAchievementID());
            pstmt.setInt(2, achievementEvent.getUserID());
            pstmt.setDate(3, new java.sql.Date(achievementEvent.getAchieveDate().getTime()));
            pstmt.executeUpdate();
        } catch (SQLException throwable) { }
    }

}