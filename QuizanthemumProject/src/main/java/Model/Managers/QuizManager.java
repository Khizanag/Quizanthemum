package Model.Managers;

import Configs.QuestionTableConfig;
import Configs.QuizTableConfig;
import Controller.Classes.OtherClasses.Category;
import Controller.Classes.Quiz.Question.Question;
import Controller.Classes.Quiz.Quiz;
import Controller.Classes.User.User;
import Model.DatabaseConnector;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static Configs.Config.*;

public class QuizManager implements QuizTableConfig, QuestionTableConfig {

    private final Connection connection;
    private Statement statement;
    private ManagersManager manager;

    public QuizManager(ManagersManager manager){
        this.manager = manager;
        this.connection = DatabaseConnector.getInstance();
        try {
            statement = connection.createStatement();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public ManagersManager getManager(){ return this.manager; }

    public List<Quiz> getMostPopularQuizzes(int numQuizzes) {
        List<Quiz> quizzes = new ArrayList<>();
        String query = "SELECT * FROM " + QUIZ_TABLE_NAME
                + " ORDER BY CREATION_DATE DESC"
                + "  LIMIT " + numQuizzes
                + ";\n";
        try {
            Statement qStatement = connection.createStatement();
            ResultSet set = qStatement.executeQuery(query);
            while(set.next()) {
                Quiz newQuiz = buildQuizFromResultSet(set);
                quizzes.add(newQuiz);
            }
            qStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return quizzes;
    }

    public Quiz getQuiz(int id){
        String query = "SELECT *" +
                " FROM " + QUIZ_TABLE_NAME +
                " WHERE " + QUIZ_TABLE_COLUMN_1_ID + " = " + id + ";\n";
        try {
            Statement myStatement = connection.createStatement();
            ResultSet set = myStatement.executeQuery(query);
            if(set.next())
                return buildQuizFromResultSet(set);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    private Quiz buildQuizFromResultSet(ResultSet set){
        try {
            int id = set.getInt(QUIZ_TABLE_COLUMN_1_ID);
            String name = set.getString(QUIZ_TABLE_COLUMN_2_NAME);
            int categoryID = set.getInt(QUIZ_TABLE_COLUMN_3_CATEGORY_ID);
            CategoriesManager categoriesManager = (CategoriesManager) manager.getManager(CATEGORIES_MANAGER_STR);
            Category category = categoriesManager.getCategory(categoryID);
            String description = set.getString(QUIZ_TABLE_COLUMN_4_DESCRIPTION);
            String iconUrl = set.getString(QUIZ_TABLE_COLUMN_5_ICON_URL);
            boolean mustShuffleQuestions = set.getBoolean(QUIZ_TABLE_COLUMN_6_MUST_SHUFFLE_QUESTIONS);
            String comment = set.getString(QUIZ_TABLE_COLUMN_7_COMMENT);
            int authorID = set.getInt(QUIZ_TABLE_COLUMN_8_AUTHOR_ID);
            UsersManager userManager = (UsersManager) manager.getManager(USERS_MANAGER_STR);
            User author = (User)userManager.getUser(authorID);
            Date creationDate = set.getDate(QUIZ_TABLE_COLUMN_9_CREATION_DATE);
            List<Question> questions = getQuizQuestions(id);
            int maxScore = set.getInt(QUIZ_TABLE_COLUMN_10_MAX_SCORE);

            return new Quiz(id, name, category, description, iconUrl, mustShuffleQuestions, comment, author, creationDate, questions, maxScore);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    private List<Question> getQuizQuestions(int id){
        List<Question> questions = new ArrayList<>();
        String query = "SELECT " + QUESTION_TABLE_COLUMN_1_ID +
                " FROM " + QUESTIONS_TABLE_NAME +
                " WHERE " + QUESTION_TABLE_COLUMN_11_QUIZ_ID + " = " + id + ";\n";

        try {
            ResultSet set = statement.executeQuery(query);
            QuestionManager questionManager = (QuestionManager)manager.getManager(QUESTION_MANAGER_STR);
            while(set.next()){
                int questionID = set.getInt(QUESTION_TABLE_COLUMN_1_ID);
                Question question = questionManager.getQuestion(questionID);
                questions.add(question);
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return questions;
    }

    public int insertQuiz(Quiz quiz){
        String query = "INSERT INTO " + QUIZ_TABLE_NAME + " VALUES (null, ?, ?, ?, ?, ?, ?, ?, ?, ?);\n";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, quiz.getName());
            pstmt.setInt(2, quiz.getCategory().getID());
            pstmt.setString(3, quiz.getDescription());
            pstmt.setString(4, quiz.getIconUrl());
            pstmt.setBoolean(5, quiz.mustShuffleQuestions());
            pstmt.setString(6, quiz.getComment());
            pstmt.setInt(7, quiz.getAuthor().getID());
            pstmt.setDate(8, new java.sql.Date(quiz.getCreationDate().getTime()));
            pstmt.setDouble(9, quiz.getMaxScore());
            pstmt.executeUpdate();
            return DatabaseConnector.getLastInsertID();
        } catch (SQLException e) {
            System.out.println("Insertion Error. Quiz Manager Class");
            e.printStackTrace();
        }
        return DEFAULT_ID;
    }
}
