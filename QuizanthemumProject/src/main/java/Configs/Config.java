package Configs;

public interface Config {

    /* context key strings for attributes*/
    public static final String CURRENT_QUIZES_STR = "currently started quizes by user";
    public static final String CONNECTION_STR = "connection for database";
    public static final String CHALLENGE_MANAGER_STR = "challenge manager";
    public static final String QUESTION_MANAGER_STR = "question manager";
    public static final String QUIZ_EVENT_MANAGER_STR = "quiz event manager";
    public static final String QUIZ_MANAGER_STR = "quiz manager";
    public static final String USER_MANAGER_STR = "user_manager";

    /* Database info */
    public static final String USERNAME = "root";
    public static final String PASSWORD = "paroli12345678";
    public static final String URL = "jdbc:mysql://localhost:3306/";
    public static final String DATABASE_NAME = "intelij_db";

    public static final String CHALLENGES_TABLE_NAME = "challenges";
    public static final String QUESTIONS_TABLE_NAME = "questions";
    public static final String QUESTION_EVENTS_TABLE_NAME = "question_events";
    public static final String QUIZ_EVENTS_TABLE_NAME = "quiz_events";
    public static final String QUIZES_TABLE_NAME = "quizes";
    public static final String USERS_TABLE_NAME = "users";

}
