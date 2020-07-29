package Model.Managers;

import Configs.QuestionEventTableConfig;
import Controller.Classes.Quiz.Question.Question;
import Controller.Classes.Quiz.Question.QuestionEvent;
import Model.DatabaseConnector;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static Configs.Config.QUESTION_MANAGER_STR;

public class QuestionEventManager implements QuestionEventTableConfig {

    private ManagersManager manager;
    private Connection connection;
    private Statement statement;

    public QuestionEventManager(ManagersManager manager){
        this.manager = manager;
        this.connection = DatabaseConnector.getInstance();
        try {
            statement = connection.createStatement();
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }

    public ManagersManager getManager(){ return this.manager; }

    public void setQuestionEvent(QuestionEvent questionEvent) {
        String query = getQuestionEventQueryText(questionEvent);
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, questionEvent.getId());
            pstmt.setInt(2, questionEvent.getQuizEventId());
            pstmt.setDate(3, new java.sql.Date(questionEvent.getStartDate().getTime()));
            pstmt.setDate(4, new java.sql.Date(questionEvent.getEndDate().getTime()));
            pstmt.setBoolean(5, questionEvent.isAlreadyGraded());
            pstmt.setDouble(6, questionEvent.getUserScore());
            pstmt.setInt(7, questionEvent.getQuestion().getID());

            List<String> userAnswers = questionEvent.getUserAnswers();
            for(int i = 0; i < USER_ANSWERS_NUM; i++) {
                if (i < userAnswers.size()) {
                    pstmt.setString(USER_ANSWER_START_COL + i, userAnswers.get(i));
                } else {
                    pstmt.setString(USER_ANSWER_START_COL + i, null);
                }
            }
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Insertion Error. Question Event Manager Class");
        }
    }

    private String getQuestionEventQueryText(QuestionEvent questionEvent) {
        String query = "INSERT INTO " + QUESTION_EVENTS_TABLE_NAME;
        query += " VALUES (?";
        for (int i = 1; i < QUESTION_EVENTS_TABLE_NUM_COLUMNS; i++) {
            query += ", ?";
        }
        query += ");\n";
        return query;
    }

    public QuestionEvent getQuestionEvent(int id) {
        String query = "SELECT * FROM " + QUESTION_EVENTS_TABLE_NAME +
                " WHERE " + QUESTION_EVENT_TABLE_COLUMN_1_ID + " = " + id + ";\n";

        try {
            ResultSet set = statement.executeQuery(query);

            set.getString(QUESTION_EVENT_TABLE_COLUMN_1_ID);
            int quizEventId = set.getInt(QUESTION_EVENT_TABLE_COLUMN_2_QUIZ_EVENT_ID);
            Date startDate = set.getDate(QUESTION_EVENT_TABLE_COLUMN_3_START_DATE);
            Date endDate = set.getDate(QUESTION_EVENT_TABLE_COLUMN_4_END_DATE);
            boolean isAlreadyGraded = set.getBoolean(QUESTION_EVENT_TABLE_COLUMN_5_IS_ALREADY_GRADED);
            double userScore = set.getDouble(QUESTION_EVENT_TABLE_COLUMN_6_USER_SCORE);
            int questionId = set.getInt(QUESTION_EVENT_TABLE_COLUMN_7_QUESTION_ID);

            QuestionManager questionManager = (QuestionManager) manager.getManager(QUESTION_MANAGER_STR);
            Question question = questionManager.getQuestion(questionId);
            List<String> userAnswers = new ArrayList<>();
            for (int i = 0; i < question.getAnswersCount(); i++) {
                userAnswers.add(set.getString(QUESTION_EVENT_TABLE_ITH_ANSWER_TEXT + i));
            }

            return new QuestionEvent(id, quizEventId, question, isAlreadyGraded, startDate, endDate, userScore, userAnswers);

        } catch (SQLException unused) { }

        return null; // never reached
    }

}
