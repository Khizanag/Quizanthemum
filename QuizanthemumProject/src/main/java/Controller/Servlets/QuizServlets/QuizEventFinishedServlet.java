package Controller.Servlets.QuizServlets;

import Controller.Classes.OtherClasses.Challenge;
import Controller.Classes.Quiz.Question.QuestionEvent;
import Controller.Classes.Quiz.QuizEvent;
import Controller.Classes.User.AchievementEvent;
import Model.Managers.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

import static Configs.AchievementTypes.*;
import static Configs.Config.*;

@WebServlet(name = "QuizEventFinishedServlet", urlPatterns = "/QuizEventFinished")
public class QuizEventFinishedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("QuizEventFinishedServlet");
        ServletContext context = request.getServletContext();
        ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
        ChallengesManager challengesManager = (ChallengesManager) managersManager.getManager(CHALLENGE_MANAGER_STR);
        QuizEventManager quizEventManager = (QuizEventManager) request.getServletContext().getAttribute(QUIZ_EVENT_MANAGER_STR);
        UsersManager usersManager = (UsersManager) request.getServletContext().getAttribute(USERS_MANAGER_STR);
        QuestionEventManager questionEventManager = (QuestionEventManager) request.getServletContext().getAttribute(QUESTION_EVENT_MANAGER_STR);
        QuizEvent quizEvent = (QuizEvent) request.getServletContext().getAttribute("quiz_event");

        quizEvent.finishQuiz();

        System.out.println("practice mode was turned off");

        if(quizEvent.isPracticeMode()) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/web/pages/QuizSummaryPage.jsp");
            dispatcher.forward(request, response);
            return;
        }

        quizEvent.resetQuestionEventIterator();
        int quizEventId = quizEventManager.insertQuizEvent(quizEvent);
        quizEvent.setID(quizEventId);
        System.out.println("quiz event inserted");
        while (quizEvent.hasNextQuestionEvent()) {
            QuestionEvent currQuestionEvent = quizEvent.getNextFilledQuestionEvent();
            currQuestionEvent.setQuizEventId(quizEventId);
            questionEventManager.setQuestionEvent(currQuestionEvent);
        }

        addAchievement(quizEvent.getUser().getID(), usersManager, managersManager);

        Challenge challenge = quizEvent.getChallenge();
        System.out.println("some doing stuff of quiz finished finished");
        if(challenge != null){
            System.out.println("challenge is not null");
            if(challenge.isAccepted()){ // is challengeD users event
                System.out.println("is challenged users event");
                challenge.setChallengedQuizEvent(quizEvent);
                challenge.finish();
                challengesManager.commitChallengeAccept(challenge);
            } else {    // is challengeR user's event
                System.out.println("is challenger users quiz");
                challenge.setChallengerQuizEvent(quizEvent);
                challengesManager.insertChallenge(challenge);
            }
        }

        int achievementType = addAchievement(quizEvent.getQuiz().getAuthor().getID(), usersManager, managersManager);
        context.setAttribute("achievementType", achievementType);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/web/pages/QuizSummaryPage.jsp");
        dispatcher.forward(request, response);
    }

    private int addAchievement(int userID, UsersManager usersManager, ManagersManager managersManager) {
        AchievementEventsManager achievementEventsManager = (AchievementEventsManager) managersManager.getManager(ACHIEVEMENT_EVENTS_MANAGER_STR);
        int numQuizzesPlayed = usersManager.getQuizzesPlayedCount(userID);
        AchievementEvent newAchievementEvent;
        int toReturn = -1;
        switch (numQuizzesPlayed) {
            case 5:
                newAchievementEvent = new AchievementEvent(-1, QUIZ_MASTER_BRONZE, userID, new Date());
                toReturn = QUIZ_MASTER_BRONZE;
                break;
            case 15:
                newAchievementEvent = new AchievementEvent(-1, QUIZ_MASTER_SILVER, userID, new Date());
                toReturn = QUIZ_MASTER_SILVER;
                break;
            case 30:
                newAchievementEvent = new AchievementEvent(-1, QUIZ_MASTER_GOLD, userID, new Date());
                toReturn = QUIZ_MASTER_GOLD;
                break;
            default:
                return NO_ACHIEVEMENT;
        }
        achievementEventsManager.insertAchievementEvent(newAchievementEvent);
        return toReturn;
    }


}
