package Model.Managers;

import Configs.AchievementsTableConfig;
import Controller.Classes.User.AchievementEvent;
import Model.DatabaseConnector;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import static Configs.AchievementEventTableConfig.*;

public class AchievementEventsManager implements AchievementsTableConfig {

    private ManagersManager manager;
    private Connection connection;

    public AchievementEventsManager(ManagersManager manager){
        this.manager = manager;
        this.connection = DatabaseConnector.getInstance();
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
        String query = "INSERT INTO " + ACHIEVEMENT_TABLE_NAME +
                " VALUES (" +
                    achievementEvent.getID() + ", " +
                    achievementEvent.getAchievementID() + ", " +
                    achievementEvent.getUserID() + ", " +
                    achievementEvent.getAchieveDate() +
                ");";
        try {
            Statement statement = connection.createStatement();
            statement.execute(query);
            statement.close();
        } catch (SQLException throwable) { }
    }

}