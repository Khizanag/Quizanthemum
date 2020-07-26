package Model.Managers;

import Configs.*;
import Controller.Classes.OtherClasses.User;
import Controller.Classes.OtherClasses.Achievement;
import Model.DatabaseConnector;

import javax.servlet.ServletContext;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static Configs.Config.DEFAULT_ID;
import static Configs.QuizEventTableConfig.*;


public class UsersManager implements UsersTableConfig, QuestionTableConfig,
        ChallengesTableConfig, AchievementEventTableConfig, FriendshipsTableConfig {

    private final Connection connection;
    private Statement statement;
    private ServletContext context;

    public UsersManager(ServletContext context){
        this.context = context;
        this.connection = DatabaseConnector.getInstance();
        try {
            statement = connection.createStatement();
        } catch (SQLException throwables) { }
    }

    public User getUser(int id){
        String query = "SELECT *" +
                " FROM " + USERS_TABLE_NAME +
                " WHERE " + USERS_TABLE_COLUMN_1_ID + " = " + id + ";\n";
        return getUserWithQuery(query);
    }

    public User getUser(String username){
        String query = "SELECT * " +
                " FROM " + USERS_TABLE_NAME +
                " WHERE username = '" + username + "';";
        return getUserWithQuery(query);
    }

    private User getUserWithQuery(String query){
        System.out.println("getUserWithQuery: query: " + query);
        try {
            ResultSet set = statement.executeQuery(query);
            if(!set.next())
                return null;
            int id = set.getInt(USERS_TABLE_COLUMN_1_ID);
            String username = set.getString(USERS_TABLE_COLUMN_2_USERNAME);
            String passwordHash = set.getString(USERS_TABLE_COLUMN_3_PASSWORD_HASH);
            String firstName = set.getString(USERS_TABLE_COLUMN_4_FIRST_NAME);
            String lastName = set.getString(USERS_TABLE_COLUMN_5_LAST_NAME);
            int role = set.getInt(USERS_TABLE_COLUMN_6_ROLE);
            String city = set.getString(USERS_TABLE_COLUMN_7_CITY);
            String country = set.getString(USERS_TABLE_COLUMN_8_COUNTRY);
            String email = set.getString(USERS_TABLE_COLUMN_9_EMAIL);
            String mobileNumber = set.getString(USERS_TABLE_COLUMN_10_PHONE_NUMBER);
            Date birthDate = set.getDate(USERS_TABLE_COLUMN_11_BIRTH_DATE);
            Date registrationDate = set.getDate(USERS_TABLE_COLUMN_12_REGISTRATION_DATE);
            List<Integer> friendIDs = getUserFriends(id);

            return new User(id, username, passwordHash, firstName, lastName,  role, city, country, mobileNumber, email,
                    birthDate, registrationDate, friendIDs);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public List<Integer> getUserAchievementIDs(int id) {
        List<Integer> achievementIDs = new ArrayList<>();
        String query = "SELECT " + ACHIEVEMENT_EVENT_TABLE_COLUMN_1_ID +
                " FROM " + ACHIEVEMENT_EVENT_TABLE_NAME +
                " WHERE " + ACHIEVEMENT_EVENT_TABLE_COLUMN_3_USER_ID + " = " + id + ";\n";
        try {
            ResultSet set = statement.executeQuery(query);
            while(set.next()){
                int achievementID = set.getInt(ACHIEVEMENT_EVENT_TABLE_COLUMN_1_ID);
                achievementIDs.add(achievementID);
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return achievementIDs;
    }

    // returns challenges where given user has participated
    // TODO review api for example if we need only finished challenges
    public List<Integer> getUserChallengeIDs(int id) {
        List<Integer> challengeIDs = new ArrayList<>();
        String query = "SELECT " + CHALLENGES_TABLE_COLUMN_1_ID +
                " FROM " + CHALLENGES_TABLE_NAME +
                " WHERE " + CHALLENGES_TABLE_COLUMN_2_CHALLENGER_USER_ID + " = " + id +
                " OR " + CHALLENGES_TABLE_COLUMN_3_CHALLENGED_USER_ID + " = " + id + ";\n";
        try {
            ResultSet set = statement.executeQuery(query);
            while(set.next()){
                int challengeID = set.getInt(CHALLENGES_TABLE_COLUMN_1_ID);
                challengeIDs.add(challengeID);
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return challengeIDs;
    }

    public List<Integer> getUserQuizEventIDs(int id) {
        List<Integer> quizEventIDs = new ArrayList<>();
        String query = "SELECT " + QUIZ_EVENT_TABLE_COLUMN_1_ID +
                " FROM " + QUIZ_EVENTS_TABLE_NAME +
                " WHERE " + QUIZ_EVENT_TABLE_COLUMN_3_USER_ID + " = " + id + ";\n";
        try {
            ResultSet set = statement.executeQuery(query);
            while(set.next()){
                int quizEventId = set.getInt(QUIZ_EVENT_TABLE_COLUMN_1_ID);
                quizEventIDs.add(quizEventId);
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return quizEventIDs;
    }

    public List<Integer> getUserFriends(int id) {
        List<Integer> friendIDs = new ArrayList<>();
        String unionColumnName = "friend";
        String query = "SELECT " + FRIENDSHIPS_TABLE_COLUMN_2_FIRST_FRIEND_ID + " AS " + unionColumnName +
                " FROM " + FRIENDSHIPS_TABLE_NAME +
                " WHERE " + FRIENDSHIPS_TABLE_COLUMN_3_SECOND_FRIEND_ID + " = " + id +
                " UNION " +
                "SELECT " + FRIENDSHIPS_TABLE_COLUMN_3_SECOND_FRIEND_ID + " AS " + unionColumnName +
                " FROM " + FRIENDSHIPS_TABLE_NAME +
                " WHERE " + FRIENDSHIPS_TABLE_COLUMN_2_FIRST_FRIEND_ID + " = " + id +
                ";\n";
        try {
            ResultSet set = statement.executeQuery(query);
            while(set.next()){
                int friendID = set.getInt(unionColumnName);
                friendIDs.add(friendID);
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return friendIDs;
    }

    public int insertUser(User user) {
        String query = "INSERT INTO " + USERS_TABLE_NAME + " VALUES (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);\n";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
//            System.out.println("pstmt done");
//            pstmt.setString(1, "null");
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPasswordHash());
            pstmt.setString(3, user.getFirstName());
            pstmt.setString(4, user.getLastName());
            pstmt.setInt(5, user.getRole());
            pstmt.setString(6, user.getCity());
            pstmt.setString(7, user.getCountry());
            pstmt.setString(8, user.getEmail());
            pstmt.setString(9, user.getMobileNumber());
            pstmt.setDate(10, new java.sql.Date(user.getBirthDate().getTime()));
            pstmt.setDate(11, new java.sql.Date(user.getRegistrationDate().getTime()));
            System.out.println("before execute update");
            pstmt.executeUpdate();

            return DatabaseConnector.getLastInsertID();
        } catch (SQLException e) {
            System.out.println("Insertion Error. User Manager Class");
            e.printStackTrace();
        }
        return DEFAULT_ID;
    }

    public boolean isUsernameFree(String username){
        return getUser(username) == null;
    }

    public boolean isValidLoginAttempt(String username, String password) {
        return getUser(username).isCorrectPassword(password);
    }

}