package Model.Managers;

import Controller.Classes.OtherClasses.Challenge;
import Model.DatabaseConnector;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class ChallengeManager {

    // saved connection to use in the future for working with database
    private final Connection connection;
    private Statement statement;
    private ServletContext context;

    public ChallengeManager(){
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
        String query = "INSERT INTO(" +
                "challengeID, " +
                "challengerID, challengerQuizEventID, " +
                "challengedID, challengedQuizEventID, " +
                "challengingDate)" +
                "VALUES (" + "" +
                ")\n";
        try {
            statement.execute(query);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public Challenge getChallenge(int id) {
        return null;
        // TODO
    }
}
