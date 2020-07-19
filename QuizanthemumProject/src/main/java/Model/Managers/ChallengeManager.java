package Model.Managers;

import Model.DatabaseConnector;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class ChallengeManager {

    // saved connection to use in the future for working with database
    private Connection connection;
    private Statement statement;

    public ChallengeManager(){
        this.connection = DatabaseConnector.getInstance();
        try {
            this.statement = connection.createStatement();
        } catch (SQLException throwables) {
            System.out.println("Error during creating statement in constructor of 'ChallengeManager'");
        }
    }

    public void insertChallenge(){
        String query = "INSERT INTO(" +
                "challengeID, " +
                "challengerID, challengerQuizEventID, " +
                "challengedID, challengedQuizEventID, " +
                "challengingDate)" +
                "VALUES (" + "" +
                ")\n";
    }
}
