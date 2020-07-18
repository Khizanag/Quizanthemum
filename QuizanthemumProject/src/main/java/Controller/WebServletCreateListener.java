package Controller;

import Configs.Config;
import Model.DatabaseConnector;
import Model.Managers.ChallengeManager;
import Model.Managers.QuestionManager;
import Model.Managers.QuizEventManager;
import Model.Managers.QuizManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Connection;

@WebListener
public class WebServletCreateListener implements ServletContextListener, Config {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();

        // set connection
        Connection connection = DatabaseConnector.getInstance();
        context.setAttribute(CONNECTION_STR, connection);

        // set challenge manager
        ChallengeManager challengeManager = new ChallengeManager();
        context.setAttribute(CHALLENGE_MANAGER_STR, challengeManager);

        // set question manager
        QuestionManager questionManager = new QuestionManager();
        context.setAttribute(QUESTION_MANAGER_STR, questionManager);

        // set quiz event manager
        QuizEventManager quizEventManager = new QuizEventManager();
        context.setAttribute(QUIZ_EVENT_MANAGER_STR, quizEventManager);

        // set quiz manager
        QuizManager quizManager = new QuizManager();
        context.setAttribute(QUIZ_MANAGER_STR, quizManager);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        DatabaseConnector.closeConnection();
    }
}