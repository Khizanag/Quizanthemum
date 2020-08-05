package Model.Managers;

import Configs.AchievementsTableConfig;
import Controller.Classes.User.Achievement;
import Model.DatabaseConnector;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class AchievementsManager implements AchievementsTableConfig {

    private ManagersManager manager;
    private Connection connection;

    public AchievementsManager(ManagersManager manager){
        this.manager = manager;
        this.connection = DatabaseConnector.getInstance();
    }

    public Achievement getAchievement(int id){
        String query = "SELECT * " +
                " FROM " + ACHIEVEMENT_TABLE_NAME +
                " WHERE " + ACHIEVEMENT_TABLE_COLUMN_1_ID + " = " + id + ";";
        try {
            Statement statement = connection.createStatement();
            ResultSet set = statement.executeQuery(query);
            if(set.next()){
                String title = set.getString(ACHIEVEMENT_TABLE_COLUMN_2_TITLE);
                String description = set.getString(ACHIEVEMENT_TABLE_COLUMN_3_DESCRIPTION);
                String iconURL = set.getString(ACHIEVEMENT_TABLE_COLUMN_4_ICON_URL);
                set.close();
                statement.close();
                return new Achievement(id, title, description, iconURL);
            }
        } catch (SQLException unused) { }
        return null;
    }

    public void insertAchievement(Achievement achievement){
        String query = "INSERT INTO " + ACHIEVEMENT_TABLE_NAME +
                " VALUES (" +
                    achievement.getId() + ", " +
                    achievement.getTitle() + ", " +
                    achievement.getDescription() + ", " +
                    achievement.getIconURL() +
                ");";
        try {
            Statement statement = connection.createStatement();
            statement.execute(query);
            statement.close();
        } catch (SQLException throwable) { }
    }

}
