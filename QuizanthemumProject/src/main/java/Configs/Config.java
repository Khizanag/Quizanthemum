package Configs;

public interface Config {

    /* context key strings for manager attributes*/
    String ACHIEVEMENT_EVENTS_MANAGER_STR = "achievement_events_manager";
    String ACHIEVEMENTS_MANAGER_STR = "achievements_manager";
    String CATEGORIES_MANAGER_STR = "categories_manager";
    String CONNECTION_STR = "connection for database";
    String COUNTRIES_MANAGER_STR = "countries-manager";
    String CHALLENGE_MANAGER_STR = "challenge manager";
    String FRIEND_REQUESTS_MANAGER_STR = "friend-requests-manager";
    String FRIENDSHIPS_MANAGER_STR = "friendships_manager";
    String MANAGERS_MANAGER_STR = "managers_manager";
    String QUESTION_EVENT_MANAGER_STR = "question_event_manager";
    String QUESTION_MANAGER_STR = "question manager";
    String QUIZ_EVENT_MANAGER_STR = "quiz event manager";
    String QUIZ_MANAGER_STR = "quiz manager";
    String TAG_EVENTS_MANAGER_STR = "tag_event_manager";
    String USERS_MANAGER_STR = "user_manager";

    String QUIZ_CREATING_NOW = "quiz_which's_creating_is_in_progress";

    String CURRENT_QUIZES_STR = "currently started quizes by user";

    /** Used when creating Object, before inserting into database */
    int DEFAULT_ID = -1;
    int DEFAULT_NUM_QUIZZES_TO_DISPLAY = 10;
    int DEFAULT_NUM_TOP_USERS_TO_DISPLAY = 10;
    int PASSWORD_SALT_LENGTH = 15;
    int LOCATION_TYPE_NONE = 0;
    int LOCATION_TYPE_CITY = 1;
    int LOCATION_TYPE_COUNTRY = 2;

    String LOGGED_IN_USER_ID = "Quizanthemum-loged-in-user-ID";
    String LOGGED_IN_USER_PASSWORD_HASH = "Quizanthemum-loged-in-user-password-hash";
    String LAST_CREATED_QUIZ = "quiz-that-was-created-lastly";
    String QUIZ_TO_DISPLAY = "quiz-that-should-be-displayed-in-quiz-start-page";



    String LOGGED_IN_USER = "logedInUser";
    String DISPLAY_CHALLENGES = "display-challenges-list-pop-up-if-user-is-logged-in";
    String DISPLAY_FRIENDS = "display-friends-popup-list-if-user-is-logged-in";
    String DISPLAY_FRIEND_REQUESTS = "display-friend-requests-sent-by-other-to-me-and-by-me-to-others";

}
