package Model.Managers;

import Configs.QuestionEventTableConfig;
import Controller.Classes.User.User;
import Controller.Classes.Quiz.Question.QuestionEvent;
import Controller.Classes.Quiz.Quiz;
import Controller.Classes.Quiz.QuizEvent;
import Model.DatabaseConnector;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static Configs.Config.*;
import static Configs.QuizEventTableConfig.*;
import static Configs.QuizRatingEventsConfig.QUIZ_RATING_EVENTS_TABLE_COLUMN_2_USER_ID;

public class QuizEventManager implements QuestionEventTableConfig {

    private ManagersManager manager;
    private Connection connection;
    private Statement statement;

    public QuizEventManager(ManagersManager manager){
        this.manager = manager;
        this.connection = DatabaseConnector.getInstance();
        try {
            statement = connection.createStatement();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public ManagersManager getmanager(){ return this.manager; }

    public QuizEvent getQuizEvent(int id) {
        String query = "SELECT * " +
                " FROM " + QUIZ_EVENTS_TABLE_NAME +
                " WHERE " + QUIZ_EVENT_TABLE_COLUMN_1_ID + " = " + id + ";\n";

//        System.out.println("get quiz event");
//        System.out.println(query); // TODO remove
        try {
            ResultSet set = statement.executeQuery(query);
            if(set.next()){
                int quizId = set.getInt(QUIZ_EVENT_TABLE_COLUMN_2_QUIZ_ID);
                QuizManager quizManager = (QuizManager) manager.getManager(QUIZ_MANAGER_STR);
                Quiz quiz = quizManager.getQuiz(quizId);
                int userId = set.getInt(QUIZ_EVENT_TABLE_COLUMN_3_USER_ID);
                UsersManager userManager = (UsersManager) manager.getManager(USERS_MANAGER_STR);
                User user = userManager.getUser(userId);
                java.util.Date startDate = set.getDate(QUIZ_EVENT_TABLE_COLUMN_4_START_DATE);
                java.util.Date finishDate = set.getDate(QUIZ_EVENT_TABLE_COLUMN_5_FINISH_DATE);
                List<QuestionEvent> questionEvents = getQuestionEvents(id);
                double userTotalScore = set.getDouble(QUIZ_EVENT_TABLE_COLUMN_6_USER_TOTAL_SCORE);
                statement.close();
                return new QuizEvent(id, user, quiz, startDate, finishDate, questionEvents, userTotalScore, null); // TODO not null
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return null;
    }

    private List<QuestionEvent> getQuestionEvents(int id) {
        List<QuestionEvent> questionEvents = new ArrayList<>();
        String query = "SELECT " + QUESTION_EVENT_TABLE_COLUMN_1_ID +
                " FROM " + QUESTION_EVENTS_TABLE_NAME +
                " WHERE " + QUESTION_EVENT_TABLE_COLUMN_2_QUIZ_EVENT_ID + " = " + id + ";\n";
        try {
            ResultSet set = statement.executeQuery(query);
            while(set.next()){
                int questionEventID = set.getInt(QUESTION_EVENT_TABLE_COLUMN_1_ID);
                QuestionEventManager questionEventManager = (QuestionEventManager) manager.getManager(QUESTION_EVENT_MANAGER_STR);
                QuestionEvent questionEvent = questionEventManager.getQuestionEvent(questionEventID);
                questionEvents.add(questionEvent);
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return questionEvents;
    }

    public int insertQuizEvent(QuizEvent quizEvent) {

        System.out.println("inserting quiz event.");
        String query = "INSERT INTO " + QUIZ_EVENTS_TABLE_NAME + " VALUES (null, ?, ?, ?, ?, ?);\n";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, quizEvent.getQuiz().getID());
            pstmt.setInt(2, quizEvent.getUser().getID());
            pstmt.setDate(3, new java.sql.Date(quizEvent.getStartDate().getTime()));
            pstmt.setDate(4, new java.sql.Date(quizEvent.getFinishDate().getTime()));
            pstmt.setDouble(5, quizEvent.getUserScore());
            pstmt.executeUpdate();
            return DatabaseConnector.getLastInsertID();
        } catch (SQLException e) {
            System.out.println("Insertion Error. QuizEvent Manager Class");
        }
        System.out.println("inserted quiz event.");
        return DEFAULT_ID;
    }


    public List<QuizEvent> getQuizzesPlayedBy(int userID, int numRows) {
        String query = "SELECT " + QUIZ_EVENT_TABLE_COLUMN_1_ID
                + " FROM " + QUIZ_EVENTS_TABLE_NAME
                + " WHERE " + QUIZ_EVENT_TABLE_COLUMN_3_USER_ID + " = " + userID
                + " ORDER BY " + QUIZ_EVENT_TABLE_COLUMN_5_FINISH_DATE + " LIMIT " + numRows + ";\n";

        List<QuizEvent> playedQuizzes = new ArrayList<>();

        try {
            Statement qStatement = connection.createStatement();
            ResultSet set = qStatement.executeQuery(query);
            while(set.next()) {
                int nextQuizEventID = set.getInt(QUIZ_EVENT_TABLE_COLUMN_1_ID);
                playedQuizzes.add(getQuizEvent(nextQuizEventID));
            }
            qStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return playedQuizzes;

    }

}
