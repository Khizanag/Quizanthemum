package Configs;

public interface Config {

    /* context key strings for manager attributes*/
    String ACHIEVEMENT_EVENTS_MANAGER_STR = "achievement_events_manager";
    String ACHIEVEMENTS_MANAGER_STR = "achievements_manager";
    String CONNECTION_STR = "connection for database";
    String CHALLENGE_MANAGER_STR = "challenge manager";
    String FRIENDSHIPS_MANAGER_STR = "friendships_manager";
    String MANAGERS_MANAGER_STR = "managers_manager";
    String QUESTION_EVENT_MANAGER_STR = "question_event_manager";
    String QUESTION_MANAGER_STR = "question manager";
    String QUIZ_EVENT_MANAGER_STR = "quiz event manager";
    String QUIZ_MANAGER_STR = "quiz manager";
    String TAG_EVENTS_MANAGER_STR = "tag_event_manager";
    String USERS_MANAGER_STR = "user_manager";

    String CURRENT_QUIZES_STR = "currently started quizes by user";

    /** Used when creating Object, before inserting into database */
    int DEFAULT_ID = -1;
}
