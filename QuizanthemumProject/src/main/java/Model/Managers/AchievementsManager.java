package Model.Managers;

import Configs.AchievementTableConfig;
import Controller.OtherClasses.Achievement;
import Model.DatabaseConnector;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class AchievementsManager implements AchievementTableConfig {

    private ServletContext context;
    private Connection connection;
    private Statement statement;

    public AchievementsManager(){
        this.connection = DatabaseConnector.getInstance();
        try {
            statement = connection.createStatement();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public Achievement getAchievement(int id){
        String query = "SELECT * " +
                " FROM " + ACHIEVEMENT_TABLE_NAME +
                " WHERE " + ACHIEVEMENT_TABLE_COLUMN_1_ID + " = " + id + ";";
        try {
            ResultSet set = statement.executeQuery(query);
            String title = set.getString(ACHIEVEMENT_TABLE_COLUMN_2_TITLE);
            String description = set.getString(ACHIEVEMENT_TABLE_COLUMN_3_DESCRIPTION);
            String iconURL = set.getString(ACHIEVEMENT_TABLE_COLUMN_4_ICON_URL);
            return new Achievement(id, title, description, iconURL);
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
            statement.execute(query);
        } catch (SQLException throwable) { }
    }

    public void setContext(ServletContext context){
        this.context = context;
    }

}
