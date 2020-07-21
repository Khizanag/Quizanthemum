package Model.Managers;

import Configs.UserTableConfig;
import Controller.Classes.Challenge;
import Controller.Classes.Quiz.Question;
import Controller.Classes.Quiz.Quiz;
import Controller.Classes.Quiz.QuizEvent;
import Controller.Classes.User;
import Controller.OtherClasses.Achievements;
import Model.DatabaseConnector;

import javax.servlet.ServletContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static Configs.Config.QUESTION_EVENTS_TABLE_NAME;
import static Configs.Config.QUESTION_MANAGER_STR;
import static Configs.QuizEventTableConfig.*;


public class UserManager implements UserTableConfig {

    private final Connection connection;
    private Statement statement;
    private ServletContext context;

    public UserManager(){
        this.connection = DatabaseConnector.getInstance();
        try {
            statement = connection.createStatement();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public User getUser(int id){
        String query = "SELECT * " +
                "FROM " + USERS_TABLE_NAME +
                "WHERE " + USERS_TABLE_COLUMN_1_ID + " = " + id + ";\n";
        try {
            ResultSet set = statement.executeQuery(query);
            String firstName = set.getString(USERS_TABLE_COLUMN_2_FIRST_NAME);
            String lastName = set.getString(USERS_TABLE_COLUMN_3_LAST_NAME);
            String username = set.getString(USERS_TABLE_COLUMN_4_USERNAME);
            String passwordHash = set.getString(USERS_TABLE_COLUMN_5_PASSWORD);
            String city = set.getString(USERS_TABLE_COLUMN_6_CITY);
            String country = set.getString(USERS_TABLE_COLUMN_7_COUNTRY);
            String mobileNumber = set.getString(USERS_TABLE_COLUMN_8_MOBILE_NUMBER);
            String email = set.getString(USERS_TABLE_COLUMN_9_EMAIL);
            Date birthDate = set.getDate(USERS_TABLE_COLUMN_10_BIRTH_DATE);
            Date registrationDate = set.getDate(USERS_TABLE_COLUMN_11_REGISTRATION_DATE);
            List<User> friends = getUserFriends(id);

            return new User(id, firstName, lastName, username, passwordHash, city, country, mobileNumber, email,
                    birthDate, registrationDate, friends);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public List<Achievements> getUserAchievements(int id) {
        return null;
        // TODO
    }

    public List<Challenge> getUserChallenges(int id) {
        return null;
        // TODO
    }

    public List<Integer> getUserQuizEventIds(int id) {
        List<Integer> quizEventIds = new ArrayList<>();
        String query = "SELECT " + QUIZ_EVENT_TABLE_COLUMN_1_ID +
                "FROM " + QUIZ_EVENTS_TABLE_NAME +
                "WHERE " + QUIZ_EVENT_TABLE_COLUMN_3_USER_ID + " = " + id + ";\n";
        try {
            ResultSet set = statement.executeQuery(query);
            while(set.next()){
                int quizEventId = set.getInt(QUIZ_EVENT_TABLE_COLUMN_1_ID);
                quizEventIds.add(quizEventId);
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return quizEventIds;
    }

    public List<User> getUserFriends(int id) {
        return null;
        // TODO პროცედურით
    }

    public void insertUser(User user) {
        String query = "INSERT INTO " + USERS_TABLE_NAME + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);\n";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, user.getId());
            pstmt.setString(2, user.getFirstName());
            pstmt.setString(3, user.getLastName());
            pstmt.setString(4, user.getUsername());
            pstmt.setString(5, user.getPasswordHash());
            pstmt.setString(6, user.getCity());
            pstmt.setString(7, user.getCountry());
            pstmt.setString(8, user.getMobileNumber());
            pstmt.setString(9, user.getEmail());
            pstmt.setDate(10, new java.sql.Date(user.getBirthDate().getTime()));
            pstmt.setDate(11, new java.sql.Date(user.getRegistrationDate().getTime()));
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Insertion Error. User Manager Class");
        }
    }
}
