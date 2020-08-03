package Model.Managers;

import Configs.QuestionTableConfig;
import Configs.QuizTableConfig;
import Configs.QuizEventTableConfig;
import Controller.Classes.OtherClasses.Category;
import Controller.Classes.Quiz.Question.Question;
import Controller.Classes.Quiz.Quiz;
import Controller.Classes.User.User;
import Model.DatabaseConnector;
import Tools.Pair;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static Configs.Config.*;
import static Configs.QuizEventTableConfig.QUIZ_EVENTS_TABLE_NAME;
import static Configs.QuizEventTableConfig.QUIZ_EVENT_TABLE_COLUMN_2_QUIZ_ID;
import static Configs.QuizRatingEventsConfig.*;

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

    public List<Quiz> getNewestQuizzes(int numQuizzes){
        return getQuizzesBy(numQuizzes, QUIZ_TABLE_COLUMN_9_CREATION_DATE);
    }

    public List<Quiz> getMostPopularQuizzes(int numQuizzes) { // TODO TEST THIS
       String query = "SELECT * "
               + " FROM " + QUIZ_TABLE_NAME + " as qs"
               + " ORDER BY (SELECT COUNT(1)"
               +                    " FROM " + QUIZ_EVENTS_TABLE_NAME + " as qes"
               +                    " WHERE qs." + QUIZ_TABLE_COLUMN_1_ID + " = " + "qes." + QUIZ_EVENT_TABLE_COLUMN_2_QUIZ_ID
               +                    " )"
               + " LIMIT " + numQuizzes
               + ";\n";
       ;
       return getQuizzesByQuery(query);
    }

    public List<Quiz> getHighestRatedQuizzes(int numQuizzes) {
        String query = "SELECT * "
                + " FROM " + QUIZ_TABLE_NAME + " as qs"
                + " ORDER BY "
                + "(SELECT SUM( " + QUIZ_RATING_EVENTS_TABLE_COLUMN_4_NUM_STARS
                + " ) / COUNT(*) FROM " + QUIZ_RATING_EVENTS_TABLE_NAME + " as qre"
                + " WHERE qre." + QUIZ_RATING_EVENTS_TABLE_COLUMN_3_QUIZ_ID + " = "
                + "qs." + QUIZ_TABLE_COLUMN_1_ID + ")" + " LIMIT " + numQuizzes + ";\n";
        return getQuizzesByQuery(query);
    }

    private List<Quiz> getQuizzesBy(int numQuizzes, String sorterColumnName){
        String query = "SELECT * FROM " + QUIZ_TABLE_NAME
                + " ORDER BY " + sorterColumnName+ " DESC"
                + "  LIMIT " + numQuizzes
                + ";\n";
        return getQuizzesByQuery(query);
    }

    private List<Quiz> getQuizzesByQuery(String query){
        List<Quiz> quizzes = new ArrayList<>();
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
            double maxScore = set.getDouble(QUIZ_TABLE_COLUMN_10_MAX_SCORE);

            return new Quiz(id, name, category, description, iconUrl, mustShuffleQuestions, comment, author,
                    creationDate, questions, maxScore);
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
            Statement newStatement = connection.createStatement();
            ResultSet set = newStatement.executeQuery(query);
            QuestionManager questionManager = (QuestionManager)manager.getManager(QUESTION_MANAGER_STR);
            while(set.next()){
                int questionID = set.getInt(QUESTION_TABLE_COLUMN_1_ID);
                Question question = questionManager.getQuestion(questionID);
                questions.add(question);
            }
            set.close();
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

    public boolean isRatedBy (int quizID, int userID) {
        String query = "SELECT * FROM " + QUIZ_RATING_EVENTS_TABLE_NAME +
                " WHERE " + QUIZ_RATING_EVENTS_TABLE_COLUMN_3_QUIZ_ID + " = " + quizID +
                " AND " + QUIZ_RATING_EVENTS_TABLE_COLUMN_2_USER_ID + " = " + userID + ";\n";

        try {
            Statement selectionStatement = connection.createStatement();
            ResultSet set = selectionStatement.executeQuery(query);
            if(!set.next()){
                set.close();
                return true;
            } else {
                set.close();
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Selection Error. Quiz Manager Class");
            e.printStackTrace();
        }
        return false;
    }

    public double getQuizRating (int quizID) {
        String selectionQuery = "SELECT SUM ( " + QUIZ_RATING_EVENTS_TABLE_COLUMN_4_NUM_STARS +
                " ) AS ratingSum, COUNT ( * ) AS numRaters FROM " + QUIZ_RATING_EVENTS_TABLE_NAME +
                " WHERE " + QUIZ_RATING_EVENTS_TABLE_COLUMN_3_QUIZ_ID + " = " + quizID + ";\n";

        double average = -1;
        try {
            Statement selectionStatement = connection.createStatement();
            ResultSet set = selectionStatement.executeQuery(selectionQuery);
            if(!set.next()){
                System.out.println("couldn't reach star rating in quiz");
                return -1;
            }
            double ratingSum = 1.0 * set.getInt("ratingSum");
            double numRaters = 1.0 * set.getInt("numRaters");
            average = ratingSum / numRaters;
            set.close();
        } catch (SQLException e) {
            System.out.println("Selection Error. Quiz Manager Class");
            e.printStackTrace();
        }
        return average;
    }

    public void rateQuiz (int userID, int quizID, int numStars){
        String query = "INSERT INTO " + QUIZ_RATING_EVENTS_TABLE_NAME + " VALUES (null, ?, ?, ?);\n";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, userID);
            pstmt.setInt(2, quizID);
            pstmt.setInt(3, numStars);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Insertion Error. Quiz Manager Class");
            e.printStackTrace();
        }
    }

    public List<Quiz> getCategoryQuizzes(Category category) {
        String query = "SELECT * "
                + " FROM " + QUIZ_TABLE_NAME
                + " WHERE " + QUIZ_TABLE_COLUMN_3_CATEGORY_ID + " = " + category.getID()
                + ";\n";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            List<Quiz> quizzes  = new ArrayList<>();
            while(resultSet.next()){
                quizzes.add(buildQuizFromResultSet(resultSet));
            }
            return quizzes;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public List<Quiz> getQuizzes(int numQuizzes) {
        String query = "SELECT * FROM " + QUIZ_TABLE_NAME + " LIMIT " + numQuizzes;
        return getQuizzesByQuery(query);
    }
}