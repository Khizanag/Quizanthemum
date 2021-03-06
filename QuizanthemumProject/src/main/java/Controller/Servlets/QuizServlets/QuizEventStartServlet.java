package Controller.Servlets.QuizServlets;

import Controller.Classes.OtherClasses.Challenge;
import Controller.Classes.Quiz.Question.Question;
import Controller.Classes.Quiz.Question.QuestionEvent;
import Controller.Classes.Quiz.Quiz;
import Controller.Classes.Quiz.QuizEvent;
import Controller.Classes.User.User;
import Model.Managers.ChallengesManager;
import Model.Managers.ManagersManager;
import Model.Managers.QuizEventManager;
import Model.Managers.QuizManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.Date;

import static Configs.Config.*;
import static Controller.Classes.Quiz.Question.QuestionTypes.*;
import static Controller.Classes.Quiz.Question.QuestionTypes.MULTI_CHOICE;

@WebServlet(name = "QuizEventStartServlet", urlPatterns = "/QuizEventStart")
public class QuizEventStartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // TODO if already is playing
        ServletContext context = request.getServletContext();
        ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
        QuizEventManager quizEventManager = (QuizEventManager) request.getServletContext().getAttribute(QUIZ_EVENT_MANAGER_STR);
        QuizManager quizManager = (QuizManager) request.getServletContext().getAttribute(QUIZ_MANAGER_STR);
        ChallengesManager challengesManager = (ChallengesManager) managersManager.getManager(CHALLENGE_MANAGER_STR);
        User user = (User) request.getServletContext().getAttribute(LOGGED_IN_USER);
        boolean practiceMode = (request.getParameter("practice-mode") != null);
        System.out.println("practiceMode: " + practiceMode);
        String isChallengeStr = request.getParameter("is-challenge");
        boolean isChallenge = Boolean.parseBoolean(isChallengeStr);
        int challengedID = isChallenge ? Integer.parseInt(request.getParameter("challenged-id")) : DEFAULT_ID;
        Challenge challenge = null;

        int quizID = Integer.parseInt(request.getParameter("quiz_id"));
        Quiz quiz = quizManager.getQuiz(quizID);

        if(challengedID != DEFAULT_ID){
            challenge = new Challenge(quiz.getID(), user.getID(), challengedID, DEFAULT_ID, DEFAULT_ID, new Date(), challengesManager);
        }

        QuizEvent quizEvent = new QuizEvent(user, quiz, practiceMode, challenge);
        if(quiz.mustShuffleQuestions()) {
            quizEvent.shuffleQuestions();
        }
        quizEvent.startQuiz();
        int challengeID = DEFAULT_ID;
        if(request.getSession().getAttribute("challenge-id") != null)
            challengeID = (int) request.getSession().getAttribute("challenge-id");
        request.getSession().removeAttribute("challenge-id");

        System.out.println("challenge id " + challengeID);

        if(challengeID != DEFAULT_ID){
            challenge = challengesManager.getChallenge(challengeID);
            challenge.accept();
            quizEvent.setChallenge(challenge);
        }
        request.getServletContext().setAttribute("quiz_event", quizEvent);
        response.setStatus(HttpServletResponse.SC_FOUND);//302
        if (quizEvent.hasNextQuestion()) {

            QuestionEvent nextQuestionEvent = quizEvent.getNextEmptyQuestionEvent();
            request.getServletContext().setAttribute("question_event", nextQuestionEvent);
            request.getServletContext().setAttribute("question_number", 1);
            int type = nextQuestionEvent.getType();
            response.setHeader("Location", getNextQuestionLink(type));
        } else {
            response.setHeader("Location", "http://localhost:8080/QuizEventFinished");
        }

    }

    private String getNextQuestionLink(int type) {
        switch (type) {
            case MULTI_ANSWER:
                return "http://localhost:8080/web/pages/answerTypes/MultiOpenAnswerPage.jsp";
            case MULTI_CHOICE_MULTI_ANSWER:
                return "http://localhost:8080/web/pages/answerTypes/MultiChoiceMultiAnswerAnswerPage.jsp";
            case FILL_BLANK:
                return "http://localhost:8080/web/pages/answerTypes/FillTextAnswerPage.jsp";
            case MATCHING:
                return "http://localhost:8080/web/pages/answerTypes/MatchingAnswerPage.jsp";
            case STANDARD:
                return "http://localhost:8080/web/pages/answerTypes/OpenAnswerPage.jsp";
            case MULTI_CHOICE:
                return "http://localhost:8080/web/pages/answerTypes/MultiChoiceAnswerPage.jsp";
            default:
                return "error";
        }
    }
}
