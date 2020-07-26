package Controller;

import Configs.Config;
import Model.DatabaseConnector;
import Model.Managers.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Connection;

@WebListener
public class WebServletCreateListener implements ServletContextListener, Config {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
//        ServletContext context = sce.getServletContext();
//
//        // Connection should be set at first, other managers are using it
//        Connection connection = DatabaseConnector.getInstance();
//        context.setAttribute(CONNECTION_STR, connection);
//
//        AchievementEventsManager achievementEventsManager = new AchievementEventsManager(context);
//        context.setAttribute(ACHIEVEMENT_EVENTS_MANAGER_STR, achievementEventsManager);
//
//        AchievementsManager achievementsManager = new AchievementsManager(context);
//        context.setAttribute(ACHIEVEMENTS_MANAGER_STR, achievementsManager);
//
//        ChallengesManager challengesManager = new ChallengesManager();
//        context.setAttribute(CHALLENGE_MANAGER_STR, challengesManager);
//        challengesManager.setContext(context);
//
//        FriendshipsManager friendshipsManager = new FriendshipsManager(context);
//        context.setAttribute(FRIENDSHIPS_MANAGER_STR, friendshipsManager);
//
//        QuestionEventManager questionEventManager = new QuestionEventManager();
//        context.setAttribute(QUESTION_EVENT_MANAGER_STR, questionEventManager);
//        questionEventManager.setContext(context);
//
//        QuestionManager questionManager = new QuestionManager();
//        context.setAttribute(QUESTION_MANAGER_STR, questionManager);
//        questionManager.setContext(context);
//
//        QuizEventManager quizEventManager = new QuizEventManager();
//        context.setAttribute(QUIZ_EVENT_MANAGER_STR, quizEventManager);
//        quizEventManager.setContext(context);
//
//        QuizManager quizManager = new QuizManager();
//        context.setAttribute(QUIZ_MANAGER_STR, quizManager);
//        quizManager.setContext(context);
//
//        TagEventsManager tagEventsManager = new TagEventsManager(context);
//        context.setAttribute(TAG_EVENTS_MANAGER_STR, tagEventsManager);
//
//        UsersManager usersManager = new UsersManager(context);
//        context.setAttribute(USERS_MANAGER_STR, usersManager);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        DatabaseConnector.closeConnection();
    }
}