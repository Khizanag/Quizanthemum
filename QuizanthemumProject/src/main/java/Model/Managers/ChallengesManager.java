package Model.Managers;

import Configs.ChallengesTableConfig;
import Controller.Classes.OtherClasses.Challenge;
import Model.DatabaseConnector;

import javax.servlet.ServletContext;
import java.sql.*;

public class ChallengesManager implements ChallengesTableConfig {

    // saved connection to use in the future for working with database
    private final Connection connection;
    private Statement statement;
    private ServletContext context;

    public ChallengesManager(){
        this.connection = DatabaseConnector.getInstance();
        try {
            this.statement = connection.createStatement();
        } catch (SQLException throwables) {
            System.out.println("Error during creating statement in constructor of 'ChallengeManager'");
        }
    }

    public void setContext(ServletContext context){
        this.context = context;
    }

    public void insertChallenge(){
        String query = "INSERT INTO " + CHALLENGES_TABLE_NAME
                + " VALUES (" + CHALLENGES_TABLE_COLUMN_2_CHALLENGER_USER_ID
                + ", " + CHALLENGES_TABLE_COLUMN_3_CHALLENGED_USER_ID
                + ", " + CHALLENGES_TABLE_COLUMN_4_CHALLENGER_QUIZ_EVENT_ID
                + ", " + CHALLENGES_TABLE_COLUMN_5_CHALLENGED_QUIZ_EVENT_ID
                + ", " + CHALLENGES_TABLE_COLUMN_6_IS_FINISHED
                + ", " + CHALLENGES_TABLE_COLUMN_7_WINNER_USER_ID
                + ", " + CHALLENGES_TABLE_COLUMN_8_CHALLENGING_DATE
                + ")\n";
        try {
            statement.execute(query);
        } catch (SQLException throwables) { }
    }

    public Challenge getChallenge(int ID) {
        String query = "SELECT *"
                + " FROM " + CHALLENGES_TABLE_NAME
                + " WHERE " + CHALLENGES_TABLE_COLUMN_1_ID + " = " + ID + ";";
        try {
            ResultSet resultSet = statement.executeQuery(query);
            // resultSet.next(); // TODO არვიცი საჭიროა თუ არა
            int challengerUserID = resultSet.getInt(CHALLENGES_TABLE_COLUMN_2_CHALLENGER_USER_ID);
            int challengedUserID = resultSet.getInt(CHALLENGES_TABLE_COLUMN_3_CHALLENGED_USER_ID);
            int challengerQuizEventID = resultSet.getInt(CHALLENGES_TABLE_COLUMN_4_CHALLENGER_QUIZ_EVENT_ID);
            int challengedQuizEventID = resultSet.getInt(CHALLENGES_TABLE_COLUMN_5_CHALLENGED_QUIZ_EVENT_ID);
            boolean isFinished = resultSet.getBoolean(CHALLENGES_TABLE_COLUMN_6_IS_FINISHED);
            int winnerUserID = resultSet.getInt(CHALLENGES_TABLE_COLUMN_7_WINNER_USER_ID);
            Date challengingDate = resultSet.getDate(CHALLENGES_TABLE_COLUMN_8_CHALLENGING_DATE);
            Date acceptingDate = resultSet.getDate(CHALLENGES_TABLE_COLUMN_9_ACCEPTING_DATE);
            return new Challenge(ID, challengerUserID, challengedUserID, challengerQuizEventID, challengedQuizEventID, isFinished, winnerUserID, challengingDate, acceptingDate, this);
        } catch (SQLException throwables) { }
        return null;
    }

    public ServletContext getContext(){
        return context;
    }
}
