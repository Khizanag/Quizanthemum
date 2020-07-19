package Controller;

import Configs.Config;
import Controller.Classes.Quiz.QuestionEvent;
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
        /*
        ServletContext context = sce.getServletContext();
        // TODO uncomment
        // set connection
        Connection connection = DatabaseConnector.getInstance();
        context.setAttribute(CONNECTION_STR, connection);

        // set challenge manager
        ChallengeManager challengeManager = new ChallengeManager();
        context.setAttribute(CHALLENGE_MANAGER_STR, challengeManager);
        challengeManager.setContext(context);

        // set question manager
        QuestionManager questionManager = new QuestionManager();
        context.setAttribute(QUESTION_MANAGER_STR, questionManager);
        questionManager.setContext(context);

        // set quiz event manager
        QuizEventManager quizEventManager = new QuizEventManager();
        context.setAttribute(QUIZ_EVENT_MANAGER_STR, quizEventManager);
        quizEventManager.setContext(context);

        // set quiz manager
        QuizManager quizManager = new QuizManager();
        context.setAttribute(QUIZ_MANAGER_STR, quizManager);
        quizManager.setContext(context);

        // set question event manager
        QuestionEventManager questionEventManager = new QuestionEventManager();
        context.setAttribute(QUESTION_EVENT_MANAGER_STR, questionEventManager);
        questionEventManager.setContext(context);

         */
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        DatabaseConnector.closeConnection();
    }
}