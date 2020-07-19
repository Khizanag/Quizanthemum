package Model.Managers;

import Configs.QuestionTableConfig;
import Configs.QuizTableConfig;
import Controller.Classes.Quiz.Question;
import Controller.Classes.Quiz.Quiz;
import Controller.Classes.Users.User;
import Controller.Classes.Users.Writer;
import Model.DatabaseConnector;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static Configs.Config.*;
import static Configs.QuizTableConfig.*;

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
            Writer author = (Writer)userManager.getUser(authorID);
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
        // TODO
        String query = "SELECT " + QUESTION_TABLE_COLUMN_1_ID +
                "FROM " + QUESTIONS_TABLE_NAME +
                "WHERE " + QUESTION_TABLE_COLUMN_9_QUIZ_ID + " = " + id + ";\n";
        try {
            ResultSet set = statement.executeQuery(query);
            while(set.next()){
                int questionID = set.getInt(QUESTION_TABLE_COLUMN_1_ID);
                QuestionManager questionManager = (QuestionManager) context.getAttribute(QUESTION_MANAGER_STR);
                Question question = questionManager.getQuestion(questionID);
                questions.add(question);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return questions;
    }

    public void insertQuiz(Quiz quiz){
        // TODO
    }

    public int getNewQuizID(){
        return -1; // TODO
    }

    public void setContext(ServletContext context){ this.context = context; }
}
