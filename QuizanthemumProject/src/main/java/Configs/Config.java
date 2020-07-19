package Configs;

public interface Config {

    /* context key strings for attributes*/
    String CURRENT_QUIZES_STR = "currently started quizes by user";
    String CONNECTION_STR = "connection for database";
    String CHALLENGE_MANAGER_STR = "challenge manager";
    String QUESTION_MANAGER_STR = "question manager";
    String QUIZ_EVENT_MANAGER_STR = "quiz event manager";
    String QUIZ_MANAGER_STR = "quiz manager";
    String USER_MANAGER_STR = "user_manager";

    /* Database info */
    String USERNAME = "root";
    String PASSWORD = "paroli12345678";
    String URL = "jdbc:mysql://localhost:3306/";
    String DATABASE_NAME = "intelij_db";

    String CHALLENGES_TABLE_NAME = "challenges";
    String QUESTIONS_TABLE_NAME = "questions";
    String QUESTION_EVENTS_TABLE_NAME = "question_events";
    String QUIZ_EVENTS_TABLE_NAME = "quiz_events";
    String QUIZES_TABLE_NAME = "quizes";
    String USERS_TABLE_NAME = "users";

}
