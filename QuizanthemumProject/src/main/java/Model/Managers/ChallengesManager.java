package Model.Managers;

import Configs.ChallengesTableConfig;
import Controller.Classes.OtherClasses.Challenge;
import Model.DatabaseConnector;

import javax.servlet.ServletContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ChallengesManager implements ChallengesTableConfig {

    private final ManagersManager manager;
    private final Connection connection;

    public ChallengesManager(ManagersManager manager){
        this.manager = manager;
        this.connection = DatabaseConnector.getInstance();
    }

    public ManagersManager getManager(){ return this.manager; }

    public void insertChallenge(Challenge challlenge){
        java.sql.Date acceptingDate = (challlenge.getAcceptingDate() == null) ? null : new java.sql.Date(challlenge.getAcceptingDate().getTime());
        String query = "INSERT INTO " + CHALLENGES_TABLE_NAME
                + " VALUES (null"
                + ", " + challlenge.getQuizID()
                + ", " + challlenge.getChallengerUserID()
                + ", " + challlenge.getChallengedUserID()
                + ", " + challlenge.getChallengerQuizEventID()
                + ", " + challlenge.getChallengedQuizEventID()
                + ", " + challlenge.isFinished()
                + ", " + challlenge.getWinnerUserID()
                + ", " + "'" + new java.sql.Date(challlenge.getChallengingDate().getTime()) + "'"
                + ", " + ((acceptingDate == null) ? null : "'" + acceptingDate + "'")
                + ")\n";
        System.out.println("insertChallenge Query: " + query);
        try {
            Statement statement = connection.createStatement();
            statement.execute(query);
            statement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public Challenge getChallenge(int ID) {
        String query = "SELECT * "
                + " FROM " + CHALLENGES_TABLE_NAME
                + " WHERE " + CHALLENGES_TABLE_COLUMN_1_ID + " = " + ID + ";";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            if(resultSet.next()){
                Challenge challenge =  buildChallenge(resultSet);
            }
            resultSet.close();
            statement.close();
        } catch (SQLException throwables) { }
        return null;

    }

    public List<Challenge> getChallengesOf(int id){
        String query = "SELECT * "
                + " FROM " + CHALLENGES_TABLE_NAME
                + " WHERE " + CHALLENGES_TABLE_COLUMN_3_CHALLENGER_USER_ID + " = " + id
                + "         OR " + CHALLENGES_TABLE_COLUMN_4_CHALLENGED_USER_ID + " = " + id
                + ";\n";
        try{
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            List<Challenge> challenges = new ArrayList<>();
            while(resultSet.next()){
                challenges.add(buildChallenge(resultSet));
            }
            return challenges;
        } catch (SQLException throwables){}
        return null;
    }

    private Challenge buildChallenge(ResultSet resultSet){
        try{
            int ID = resultSet.getInt(CHALLENGES_TABLE_COLUMN_1_ID);
            int quizID = resultSet.getInt(CHALLENGES_TABLE_COLUMN_2_QUIZ_ID);
            int challengerUserID = resultSet.getInt(CHALLENGES_TABLE_COLUMN_3_CHALLENGER_USER_ID);
            int challengedUserID = resultSet.getInt(CHALLENGES_TABLE_COLUMN_4_CHALLENGED_USER_ID);
            int challengerQuizEventID = resultSet.getInt(CHALLENGES_TABLE_COLUMN_5_CHALLENGER_QUIZ_EVENT_ID);
            int challengedQuizEventID = resultSet.getInt(CHALLENGES_TABLE_COLUMN_6_CHALLENGED_QUIZ_EVENT_ID);
            boolean isFinished = resultSet.getBoolean(CHALLENGES_TABLE_COLUMN_7_IS_FINISHED);
            int winnerUserID = resultSet.getInt(CHALLENGES_TABLE_COLUMN_8_WINNER_USER_ID);
            Date challengingDate = resultSet.getDate(CHALLENGES_TABLE_COLUMN_9_CHALLENGING_DATE);
            Date acceptingDate = resultSet.getDate(CHALLENGES_TABLE_COLUMN_10_ACCEPTING_DATE);
            return new Challenge(ID, quizID, challengerUserID, challengedUserID, challengerQuizEventID, challengedQuizEventID, isFinished, winnerUserID, challengingDate, acceptingDate, this);
        } catch (SQLException throwables) { }
        return null;
    }

    public void commitChallengeAccept(Challenge challenge) {
//        String query = "UPDATE " + CHALLENGES_TABLE_NAME
//                + " SET "
//                + "     " + CHALLE
    }

}