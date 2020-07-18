package Model.Managers;

import Configs.QuestionTableConfig;
import Controller.Classes.Quiz.Question;
import Controller.Classes.Quiz.Quiz;
import Configs.Config;
import Model.DatabaseConnector;
import Tools.Pair;

import javax.naming.Context;
import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;
import java.util.Set;

public class QuestionManager implements Config, QuestionTableConfig {

    private Connection connection;
    private Statement statement;
    private ServletContext context;

    public QuestionManager(){
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

    public void insertQuestion(Question question){

    }

    public Question getQuestion(int id){
        String query = "SELECT * " +
                "FROM " + QUESTIONS_TABLE_NAME +
                "WHERE id = " + id + ";\n";
        try {
            ResultSet set = statement.executeQuery(query);
            set.getString("id");

            int type = set.getInt(QUESTION_TABLE_COLUMN_2_TYPE);
            boolean isAutoGraded = set.getBoolean(QUESTION_TABLE_COLUMN_3_IS_AUTO_GRADED);
            double maxScore = set.getDouble(QUESTION_TABLE_COLUMN_4_MAX_SCORE);
            String headerStatement = set.getString(QUESTION_TABLE_COLUMN_5_HEADER_STATEMENT);
            String comment = set.getString(QUESTION_TABLE_COLUMN_6_COMMENT);
            String source = set.getString(QUESTION_TABLE_COLUMN_7_SOURCE);
            Date creationDate = set.getDate(QUESTION_TABLE_COLUMN_8_CREATION_DATE);
            QuizManager quizManager = (QuizManager) context.getAttribute(QUIZ_MANAGER_STR);
            int quizID = set.getInt(QUESTION_TABLE_COLUMN_9_QUIZ_ID);
            Quiz quiz = quizManager.getQuiz(quizID);
            String textStatement;

            List<String> multipleChoiceStatements;
            List<String> fillBlankStatements;
            List<String> matchingLeft;
            List<String> matchingRight;

            String textAnswer;
            List<String> fillBlankAnswers;
            Set<Pair<String>> matchingAnswers;
            Set<String> multiAnswers;

//            return new Question(type, isAutoGraded, maxScore, headerStatement,
//                    comment, source, creationDate, quiz , textStatement,
//                    multipleChoiceStatements, fillBlankStatements, matchingLeft,
//                    matchingRight, textAnswer, fillBlankAnswers, matchingAnswers, multiAnswers);
            return null;Q
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }
}
