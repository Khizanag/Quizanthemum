package Controller.Servlets;

import Controller.Classes.OtherClasses.Challenge;
import Controller.Classes.Quiz.Question.QuestionEvent;
import Controller.Classes.Quiz.QuizEvent;
import Model.Managers.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static Configs.Config.*;

@WebServlet(name = "QuizEventFinishedServlet", urlPatterns = "/QuizEventFinished")
public class QuizEventFinishedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = request.getServletContext();
        ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
        ChallengesManager challengesManager = (ChallengesManager) managersManager.getManager(CHALLENGE_MANAGER_STR);
        QuizEventManager quizEventManager = (QuizEventManager) request.getServletContext().getAttribute(QUIZ_EVENT_MANAGER_STR);
        QuizManager quizManager = (QuizManager) request.getServletContext().getAttribute(QUIZ_MANAGER_STR);
        QuestionEventManager questionEventManager = (QuestionEventManager) request.getServletContext().getAttribute(QUESTION_EVENT_MANAGER_STR);
        QuizEvent quizEvent = (QuizEvent) request.getServletContext().getAttribute("quiz_event");

        quizEvent.finishQuiz();
        if (quizEvent.isPracticeMode())
            return;

        quizEvent.resetQuestionEventIterator();
        int quizEventId = quizEventManager.insertQuizEvent(quizEvent);
        while (quizEvent.hasNextQuestionEvent()) {
            QuestionEvent currQuestionEvent = quizEvent.getNextFilledQuestionEvent();
            currQuestionEvent.setQuizEventId(quizEventId);
            questionEventManager.setQuestionEvent(currQuestionEvent);
        }

        Challenge challenge = quizEvent.getChallenge();

        if(challenge != null){
            if(challenge.isAccepted()){ // is challengeD users event
                challenge.setChallengedQuizEvent(quizEvent);
                challengesManager.commitChallengedQuizPlay(challenge);
            } else {    // is challengeR user's event
                challenge.setChallengerQuizEvent(quizEvent);
                challengesManager.insertChallenge(challenge);
            }
        }

    }
}
