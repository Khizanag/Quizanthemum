package Model.Managers;

import Model.DatabaseConnector;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import static Configs.Config.*;

public class ManagersManager {

    private ServletContext context;
    private Map<String, Object> managers;
    private ManagersManager manager;

    public ManagersManager(ServletContext context){
        this.context = context;
        this.managers = new HashMap<>();

        // Connection should be set at first, other managers are using it // not anymore
        Connection connection = DatabaseConnector.getInstance();
        context.setAttribute(CONNECTION_STR, connection);

        AchievementEventsManager achievementEventsManager = new AchievementEventsManager(this);
        context.setAttribute(ACHIEVEMENT_EVENTS_MANAGER_STR, achievementEventsManager);
        managers.put(ACHIEVEMENT_EVENTS_MANAGER_STR, achievementEventsManager);

        AchievementsManager achievementsManager = new AchievementsManager(this);
        context.setAttribute(ACHIEVEMENTS_MANAGER_STR, achievementsManager);
        managers.put(ACHIEVEMENTS_MANAGER_STR, achievementsManager);

        CategoriesManager categoriesManager = new CategoriesManager(this);
        context.setAttribute(CATEGORIES_MANAGER_STR, categoriesManager);
        managers.put(CATEGORIES_MANAGER_STR, categoriesManager);

        ChallengesManager challengesManager = new ChallengesManager(this);
        context.setAttribute(CHALLENGE_MANAGER_STR, challengesManager);
        managers.put(CHALLENGE_MANAGER_STR, challengesManager);

        FriendshipsManager friendshipsManager = new FriendshipsManager(this);
        context.setAttribute(FRIENDSHIPS_MANAGER_STR, friendshipsManager);
        managers.put(FRIENDSHIPS_MANAGER_STR, friendshipsManager);

        QuestionEventManager questionEventManager = new QuestionEventManager(this);
        context.setAttribute(QUESTION_EVENT_MANAGER_STR, questionEventManager);
        managers.put(QUESTION_EVENT_MANAGER_STR, questionEventManager);

        QuestionManager questionManager = new QuestionManager(this);
        context.setAttribute(QUESTION_MANAGER_STR, questionManager);
        managers.put(QUESTION_MANAGER_STR, questionManager);

        QuizEventManager quizEventManager = new QuizEventManager(this);
        context.setAttribute(QUIZ_EVENT_MANAGER_STR, quizEventManager);
        managers.put(QUESTION_EVENT_MANAGER_STR, quizEventManager);

        QuizManager quizManager = new QuizManager(this);
        context.setAttribute(QUIZ_MANAGER_STR, quizManager);
        managers.put(QUIZ_MANAGER_STR, quizManager);

        TagEventsManager tagEventsManager = new TagEventsManager(this);
        context.setAttribute(TAG_EVENTS_MANAGER_STR, tagEventsManager);
        managers.put(TAG_EVENTS_MANAGER_STR, tagEventsManager);

        UsersManager usersManager = new UsersManager(this);
        context.setAttribute(USERS_MANAGER_STR, usersManager);
        managers.put(USERS_MANAGER_STR, usersManager);
    }

    public Object getManager(String managerName){
        return managers.get(managerName);
    }

//    public static ManagersManager getInstance(){
//        return
//    }
}
