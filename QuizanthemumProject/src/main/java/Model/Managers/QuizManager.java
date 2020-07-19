package Model.Managers;

import Configs.QuestionTableConfig;
import Configs.QuizTableConfig;
import Controller.Classes.Quiz.Question;
import Controller.Classes.Quiz.Quiz;
import Controller.Classes.User;
import Model.DatabaseConnector;

import javax.servlet.ServletContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static Configs.Config.*;

public class QuizManager implements QuizTableConfig, QuestionTableConfig {

    private final Connection connection;
    private Statement statement;
    private ServletContext context;

    public QuizManager(){
        this.connection = DatabaseConnector.getInstance();
        try {
            statement = connection.createStatement();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public Quiz getQuiz(int id){
        String query = "SELECT * " +
                "FROM " + QUIZ_TABLE_NAME +
                "WHERE " + QUIZ_TABLE_COLUMN_1_ID + " = " + id + ";\n";
        try {
            ResultSet set = statement.executeQuery(query);
            String name = set.getString(QUIZ_TABLE_COLUMN_2_NAME);
            String description = set.getString(QUIZ_TABLE_COLUMN_3_DESCRIPTION);
            String iconUrl = set.getString(QUIZ_TABLE_COLUMN_4_ICON_URL);
            boolean mustShuffleQuestions = set.getBoolean(QUIZ_TABLE_COLUMN_5_MUST_SHUFFLE_QUESTIONS);
            String comment = set.getString(QUIZ_TABLE_COLUMN_6_COMMENT);
            int authorID = set.getInt(QUIZ_TABLE_COLUMN_7_AUTHOR_ID);
            UserManager userManager = (UserManager) context.getAttribute(USER_MANAGER_STR);
            User author = (User)userManager.getUser(authorID);
            Date creationDate = set.getDate(QUIZ_TABLE_COLUMN_8_CREATION_DATE); // TODO check with sql or util
            List<Question> questions = getQuizQuestions(id);
            int maxScore = set.getInt(QUIZ_TABLE_COLUMN_9_MAX_SCORE);

            return new Quiz(id, name, description, iconUrl, mustShuffleQuestions, comment, author, creationDate, questions, maxScore);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    private List<Question> getQuizQuestions(int id){
        List<Question> questions = new ArrayList<>();
        String query = "SELECT " + QUESTION_TABLE_COLUMN_1_ID +
                "FROM " + QUESTIONS_TABLE_NAME +
                "WHERE " + QUESTION_TABLE_COLUMN_11_QUIZ_ID + " = " + id + ";\n";
        try {
            ResultSet set = statement.executeQuery(query);
            while(set.next()){
                int questionID = set.getInt(QUESTION_TABLE_COLUMN_1_ID);
                QuestionManager questionManager = (QuestionManager) context.getAttribute(QUESTION_MANAGER_STR);
                Question question = questionManager.getQuestion(questionID);
                questions.add(question);
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return questions;
    }

    public void insertQuiz(Quiz quiz){
        String query = "INSERT INTO " + QUIZ_TABLE_NAME + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);\n";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, quiz.getId());
            pstmt.setString(2, quiz.getName());
            pstmt.setString(3, quiz.getDescription());
            pstmt.setString(4, quiz.getIconUrl());
            pstmt.setBoolean(5, quiz.mustShuffleQuestions());
            pstmt.setString(6, quiz.getComment());
            pstmt.setInt(7, quiz.getAuthor().getId());
            pstmt.setDate(8, new java.sql.Date(quiz.getCreationDate().getTime()));
            pstmt.setDouble(9, quiz.getMaxScore());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Insertion Error. Quiz Manager Class");
        }
    }


    public int getNewQuizID(){
        return -1; // TODO sequence
    }

    public void setContext(ServletContext context){ this.context = context; }
}
