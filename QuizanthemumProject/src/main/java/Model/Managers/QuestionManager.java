package Model.Managers;

import Configs.QuestionTableConfig;
import Controller.Classes.Quiz.Question.Question;
import Controller.Classes.Quiz.Question.QuestionTypes;
import Configs.Config;
import Model.DatabaseConnector;

import java.sql.*;
import java.util.*;
import java.util.Date;

public class QuestionManager implements Config, QuestionTableConfig, QuestionTypes {

    private ManagersManager manager;
    private Connection connection;
    private Statement connectionStatement;

    public QuestionManager(ManagersManager manager){
        this.manager = manager;
        this.connection = DatabaseConnector.getInstance();
        try {
            connectionStatement = connection.createStatement();
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }

    public int insertQuestion(Question question){
        String query = getQuestionQueryText(question);
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            setQueryParameters(question, pstmt);
            pstmt.executeUpdate();
            return DatabaseConnector.getLastInsertID();
        } catch (SQLException e) {
            System.out.println("Insertion Error. Question Manager Class");
            e.printStackTrace();
        }
        return DEFAULT_ID;
    }

    private void setQueryParameters(Question question, PreparedStatement pstmt) {
        try {
            pstmt.setInt(1, question.getType());
            pstmt.setBoolean(2, question.isAutoGraded());
            pstmt.setDouble(3, question.getMaxScore());
            pstmt.setString(4, question.getHeaderStatement());
            pstmt.setString(5, question.getTextStatement());
            pstmt.setString(6, question.getPictureStatementURL());
            pstmt.setString(7, question.getComment());
            pstmt.setString(8, question.getSource());
            pstmt.setDate(9, new java.sql.Date(question.getCreationDate().getTime()));
            pstmt.setInt(10, question.getQuizID());
            pstmt.setBoolean(11, question.isPictureQuestion());
            pstmt.setInt(12, question.getStatementsCount());
            List<String> statements = question.getStatements();
            for(int i = 0; i < STATEMENTS_NUM; i++) {
                if (i < statements.size()) {
                    pstmt.setString(STATEMENT_START_COL + i -1, statements.get(i));
                } else {
                    pstmt.setString(STATEMENT_START_COL + i - 1, null);
                }
            }

            pstmt.setBoolean(30-1, question.isPictureAnswer());
            pstmt.setInt(31-1, question.getAnswersCount());

            List<String> answers = question.getAnswers();
            int numAnswers = answers.size();
            for(int i = 0; i < ANSWERS_NUM; i++) {
                if (i < numAnswers) {
                    pstmt.setString(ANSWER_START_COL + i - 1, answers.get(i));
                } else {
                    pstmt.setString(ANSWER_START_COL + i - 1, null);
                }
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private String getQuestionQueryText(Question question) {
        String query = "INSERT INTO " + QUESTIONS_TABLE_NAME;
        query += " VALUES (null";
        for (int i = 1; i < COLUMN_COUNT; i++) {
            query += ", ?";
        }
        query += ");\n";
        return query;
    }

    public Question getQuestion(int id){

        String query = "SELECT * FROM " + QUESTIONS_TABLE_NAME +
                " WHERE" + QUESTION_TABLE_COLUMN_1_ID + " = " + id + ";\n";

        try {
            ResultSet set = connectionStatement.executeQuery(query);

            set.getString(QUESTION_TABLE_COLUMN_1_ID);
            int type = set.getInt(QUESTION_TABLE_COLUMN_2_TYPE);
            boolean isAutoGraded = set.getBoolean(QUESTION_TABLE_COLUMN_3_IS_AUTO_GRADED);
            double maxScore = set.getDouble(QUESTION_TABLE_COLUMN_4_MAX_SCORE);
            String headerStatement = set.getString(QUESTION_TABLE_COLUMN_5_HEADER_STATEMENT);
            String textStatement = set.getString(QUESTION_TABLE_COLUMN_6_HEADER_STATEMENT);
            String pictureStatementURL = set.getString(QUESTION_TABLE_COLUMN_7_HEADER_STATEMENT);
            String comment = set.getString(QUESTION_TABLE_COLUMN_8_COMMENT);
            String source = set.getString(QUESTION_TABLE_COLUMN_9_SOURCE);
            Date creationDate = set.getDate(QUESTION_TABLE_COLUMN_10_CREATION_DATE);
            int quizId = set.getInt(QUESTION_TABLE_COLUMN_11_QUIZ_ID);

            boolean isPictureQuestion = set.getBoolean(QUESTION_TABLE_COLUMN_12_IS_PICTURE_STATEMENT);
            int numStatements = set.getInt(QUESTION_TABLE_COLUMN_13_NUM_STATEMENTS);
            List<String> statements = new ArrayList<>();
            for (int i = 0; i < numStatements; i++) {
                statements.add(set.getString(QUESTION_TABLE_ITH_STATEMENT_TEXT + i));
            }

            boolean isPictureAnswer = set.getBoolean(QUESTION_TABLE_COLUMN_30_IS_PICTURE_ANSWER);
            int numAnswers = set.getInt(QUESTION_TABLE_COLUMN_31_NUM_ANSWERS);
            List<String> answers = new ArrayList<>();
            for (int i = 0; i < numAnswers; i++) {
                answers.add(set.getString(QUESTION_TABLE_ITH_ANSWER_TEXT + i));
            }

            return new Question(id, type, isAutoGraded, maxScore, headerStatement, comment, source, creationDate, quizId,
                    isPictureQuestion, isPictureAnswer, textStatement, pictureStatementURL, statements, answers);

        } catch (SQLException unused) { }

        return null; // never reached
    }

}
