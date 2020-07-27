package Model.Managers;

import Configs.QuestionEventTableConfig;
import Controller.Classes.OtherClasses.User;
import Controller.Classes.Quiz.QuestionEvent;
import Controller.Classes.Quiz.Quiz;
import Controller.Classes.Quiz.QuizEvent;
import Model.DatabaseConnector;

import javax.servlet.ServletContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static Configs.Config.*;
import static Configs.QuizEventTableConfig.*;

public class QuizEventManager implements QuestionEventTableConfig {

    private ServletContext context;
    private Connection connection;
    private Statement statement;

    public QuizEventManager(){
        this.connection = DatabaseConnector.getInstance();
        try {
            statement = connection.createStatement();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void setContext(ServletContext context){
        this.context = context;
    }

    public QuizEvent getQuizEvent(int id) {
        String query = "SELECT * " +
                "FROM " + QUIZ_EVENTS_TABLE_NAME +
                "WHERE " + QUIZ_EVENT_TABLE_COLUMN_1_ID + " = " + id + ";\n";
        try {
            ResultSet set = statement.executeQuery(query);
            int quizId = set.getInt(QUIZ_EVENT_TABLE_COLUMN_2_QUIZ_ID);
            QuizManager quizManager = (QuizManager) context.getAttribute(QUIZ_MANAGER_STR);
            Quiz quiz = quizManager.getQuiz(quizId);
            int userId = set.getInt(QUIZ_EVENT_TABLE_COLUMN_3_USER_ID);
            UsersManager userManager = (UsersManager) context.getAttribute(USERS_MANAGER_STR);
            User user = userManager.getUser(userId);
            java.util.Date startDate = set.getDate(QUIZ_EVENT_TABLE_COLUMN_4_START_DATE);
            java.util.Date finishDate = set.getDate(QUIZ_EVENT_TABLE_COLUMN_5_FINISH_DATE);
            List<QuestionEvent> questionEvents = getQuestionEvents(id);
            double userTotalScore = set.getDouble(QUIZ_EVENT_TABLE_COLUMN_6_USER_TOTAL_SCORE);
            return new QuizEvent(id, user, quiz, startDate, finishDate, questionEvents, userTotalScore);
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return null;
    }

    private List<QuestionEvent> getQuestionEvents(int id) {
        List<QuestionEvent> questionEvents = new ArrayList<>();
        String query = "SELECT " + QUESTION_EVENT_TABLE_COLUMN_1_ID +
                "FROM " + QUESTION_EVENTS_TABLE_NAME +
                "WHERE " + QUESTION_EVENT_TABLE_COLUMN_2_QUIZ_EVENT_ID + " = " + id + ";\n";
        try {
            ResultSet set = statement.executeQuery(query);
            while(set.next()){
                int questionEventID = set.getInt(QUESTION_EVENT_TABLE_COLUMN_1_ID);
                QuestionEventManager questionEventManager = (QuestionEventManager) context.getAttribute(QUESTION_EVENT_MANAGER_STR);
                QuestionEvent questionEvent = questionEventManager.getQuestionEvent(questionEventID);
                questionEvents.add(questionEvent);
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return questionEvents;
    }

    public void insertQuizEvent(QuizEvent quizEvent) {
        String query = "INSERT INTO " + QUIZ_EVENTS_TABLE_NAME + " VALUES (?, ?, ?, ?, ?, ?);\n";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, quizEvent.getId());
            pstmt.setInt(2, quizEvent.getQuiz().getID());
            pstmt.setInt(3, quizEvent.getUser().getID());
            pstmt.setDate(4, new java.sql.Date(quizEvent.getStartDate().getTime()));
            pstmt.setDate(5, new java.sql.Date(quizEvent.getFinishDate().getTime()));
            pstmt.setDouble(6, quizEvent.getUserScore());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Insertion Error. QuizEvent Manager Class");
        }
    }

}
