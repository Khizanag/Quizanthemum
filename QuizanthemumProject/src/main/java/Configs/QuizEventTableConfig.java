package Configs;

import Controller.Classes.Quiz.QuestionEvent;
import Controller.Classes.Quiz.Quiz;
import Controller.Classes.User;

import java.util.Date;
import java.util.List;

public interface QuizEventTableConfig {

    String QUIZ_EVENTS_TABLE_NAME = "quiz_events";

    String QUIZ_EVENT_TABLE_COLUMN_1_ID = "ID";
    String QUIZ_EVENT_TABLE_COLUMN_2_QUIZ_ID = "QUIZ_ID";
    String QUIZ_EVENT_TABLE_COLUMN_3_USER_ID = "USER_ID";
    String QUIZ_EVENT_TABLE_COLUMN_4_START_DATE = "START_DATE";
    String QUIZ_EVENT_TABLE_COLUMN_5_FINISH_DATE = "FINISH_DATE";
    String QUIZ_EVENT_TABLE_COLUMN_6_USER_TOTAL_SCORE = "USER_TOTAL_SCORE";

}
