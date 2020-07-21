package Model.Managers;

import Configs.Config;
import Configs.FriendshipsTableConfig;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class FriendshipsManager implements Config, FriendshipsTableConfig {

    private ServletContext context;
    private Connection connection;
    private Statement statement;

    public FriendshipsManager(ServletContext context){
        this.context = context;
        this.connection = (Connection) context.getAttribute(CONNECTION_STR);
        try {
            statement = connection.createStatement();
        } catch (SQLException unused) { }
    }

//    public AchievementEvent getFriendship(int id){
//        String query = "SELECT * " +
//                " FROM " + FRIEND +
//                " WHERE " + ACHIEVEMENT_EVENT_TABLE_COLUMN_1_ID + " = " + id + ";";
//        try {
//            ResultSet set = statement.executeQuery(query);
//            int achievementID = set.getInt(ACHIEVEMENT_EVENT_TABLE_COLUMN_2_ACHIEVEMENT_ID);
//            int userID = set.getInt(ACHIEVEMENT_EVENT_TABLE_COLUMN_3_USER_ID);
//            Date achieveDate = set.getDate(ACHIEVEMENT_EVENT_TABLE_COLUMN_4_ACHIEVE_DATE);
//            return new AchievementEvent(id, achievementID, userID, achieveDate);
//        } catch (SQLException unused) { }
//        return null;
//    }
//
//    public void insertAchievementEvent(AchievementEvent achievementEvent){
//        String query = "INSERT INTO " + ACHIEVEMENT_TABLE_NAME +
//                " VALUES (" +
//                achievementEvent.getID() + ", " +
//                achievementEvent.getAchievementID() + ", " +
//                achievementEvent.getUserID() + ", " +
//                achievementEvent.getAchieveDate() +
//                ");";
//        try {
//            statement.execute(query);
//        } catch (SQLException throwable) { }
//    }

}