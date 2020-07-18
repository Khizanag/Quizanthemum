package Model.Managers;

import Configs.QuestionTableConfig;
import Controller.Classes.Quiz.Question;
import Controller.Classes.Quiz.QuestionType;
import Controller.Classes.Quiz.Quiz;
import Configs.Config;
import Model.DatabaseConnector;
import Tools.Pair;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class QuestionManager implements Config, QuestionTableConfig, QuestionType {

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
            String textStatement = set.getString(QUESTION_TABLE_COLUMN_10_TEXT_STATEMENT);
            boolean isPictureQuestion = set.getBoolean(QUESTION_TABLE_COLUMN_11_IS_PICTURE_QUESTION);
            int numChoiceStatements = set.getInt(QUESTION_TABLE_COLUMN_12_NUM_CHOICE_STATEMENTS);
            String textAnswer = set.getString(QUESTION_TABLE_COLUMN_29_TEXT_ANSWER);
            boolean isPictureAnswer = set.getBoolean(QUESTION_TABLE_COLUMN_30_IS_PICTURE_ANSWER);
            int numAnswers = set.getInt(QUESTION_TABLE_COLUMN_31_NUM_ANSWERS);

            switch (type) {
                case STANDARD:
                    return new Question(id, type, isAutoGraded, maxScore, isPictureQuestion, headerStatement, comment, source, creationDate, quiz, textStatement, textAnswer);

                case FILL_BLANK:
                    List<String> fillBlankStatements = getStatementsList(set, numChoiceStatements);
                    List<String> fillBlankAnswers = getAnswersList(set, numAnswers);
                    return new Question(id, type, isAutoGraded, maxScore, headerStatement, comment, source, creationDate, quiz, fillBlankStatements, fillBlankAnswers);

                case MULTI_CHOICE:
                    List<String> multiChoiceStatements = getStatementsList(set, numChoiceStatements);
                    return new Question(id, type, isAutoGraded, maxScore, isPictureQuestion, headerStatement, comment, source, creationDate, quiz, multiChoiceStatements, isPictureAnswer, textAnswer);

                case MULTI_ANSWER:
                    Set<String> multiAnswers = new TreeSet<>();
                    for (int i = 0; i < numAnswers; i++) {
                        String ithStatement = set.getString(QUESTION_TABLE_ITH_ANSWER_TEXT + i);
                        multiAnswers.add(ithStatement);
                    }
                    return new Question(id, type, isAutoGraded, maxScore, isPictureQuestion, headerStatement, comment, source, creationDate, quiz, textStatement, multiAnswers);

                case MULTI_CHOICE_MULTI_ANSWER:
                    List<String> multiMultiChoiceStatements = getStatementsList(set, numChoiceStatements);
                    Set<String> multiMultiAnswers = new TreeSet<>();
                    for (int i = 0; i < numAnswers; i++) {
                        String ithStatement = set.getString(QUESTION_TABLE_ITH_ANSWER_TEXT + i);
                        multiMultiAnswers.add(ithStatement);
                    }
                    return new Question(id, type, isAutoGraded, maxScore, isPictureQuestion, headerStatement, comment, source, creationDate, quiz, multiMultiChoiceStatements, isPictureAnswer, multiMultiAnswers);

                case MATCHING:
                    List<String> matchingLeft = new ArrayList<>();
                    List<String> matchingRight = new ArrayList<>();
                    for(int i = 0; i < numChoiceStatements; i+=2){
                        String leftStatement = set.getString(QUESTION_TABLE_ITH_CHOICE_TEXT + i);
                        String rightStatement = set.getString(QUESTION_TABLE_ITH_CHOICE_TEXT + (i +1));
                        matchingLeft.add(leftStatement);
                        matchingRight.add(rightStatement);
                    }
                    // TODO how treeset works with pair<String>
                    Set<Pair<String>> matchingAnswers = new TreeSet<>();
                    for(int i = 0; i < numAnswers; i+=2){
                        String leftAnswer = set.getString(QUESTION_TABLE_ITH_ANSWER_TEXT + i);
                        String rightAnswer = set.getString(QUESTION_TABLE_ITH_ANSWER_TEXT + (i +1));
                        matchingAnswers.add(new Pair<String>(leftAnswer, rightAnswer));
                    }
                    return new Question(id, type, isAutoGraded, maxScore, headerStatement, comment, source, creationDate, quiz, matchingLeft, matchingRight, matchingAnswers);

                default:
                    return null;
            }
        } catch (SQLException unused) { }
        return null;
    }

    private List<String> getStatementsList(ResultSet set, int num){
        return getStatementAnswerList(set, num, true);
    }

    private List<String> getAnswersList(ResultSet set, int num){
        return getStatementAnswerList(set, num, false);
    }

    private List<String> getStatementAnswerList(ResultSet set, int num, boolean isStatement){
        List<String> list = new ArrayList<>();
        try{
            for(int i = 0; i < num; i++){
                String columnLabel = isStatement ? QUESTION_TABLE_ITH_CHOICE_TEXT : QUESTION_TABLE_ITH_ANSWER_TEXT;
                String ithStatement = set.getString(columnLabel + i);
                list.add(ithStatement);
            }
            return list;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
