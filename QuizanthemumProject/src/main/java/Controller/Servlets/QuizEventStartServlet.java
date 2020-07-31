package Controller.Servlets;

import Controller.Classes.Quiz.Question.Question;
import Controller.Classes.Quiz.Question.QuestionEvent;
import Controller.Classes.Quiz.Quiz;
import Controller.Classes.Quiz.QuizEvent;
import Controller.Classes.User.User;
import Model.Managers.QuizEventManager;
import Model.Managers.QuizManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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

        QuizEventManager quizEventManager = (QuizEventManager) request.getServletContext().getAttribute(QUIZ_EVENT_MANAGER_STR);
        QuizManager quizManager = (QuizManager) request.getServletContext().getAttribute(QUIZ_MANAGER_STR);
        User user = (User) request.getAttribute("quiz_event_start_user");

        System.out.println("cocxali var");
        int quizID = Integer.parseInt(request.getParameter("quiz_id"));
        System.out.println("movkti");
        Quiz quiz = quizManager.getQuiz(quizID);

        QuizEvent quizEvent = new QuizEvent(quizEventManager.getNewQuizEventID(), user, quiz);
        quizEvent.startQuiz();

        request.getServletContext().setAttribute("quiz_event", quizEvent);
        response.setStatus(HttpServletResponse.SC_FOUND);//302
        if (quizEvent.hasNextQuestion()) {
            QuestionEvent nextQuestionEvent = quizEvent.getNextEmptyQuestionEvent();
            request.getServletContext().setAttribute("question_event", nextQuestionEvent);
            request.getServletContext().setAttribute("question_number", 1);
            int type = nextQuestionEvent.getType();
            response.setHeader("Location", getNextQuestionLink(type));
        } else {
            response.setHeader("Location", "http://localhost:8080/web/pages/QuizSummaryPage.jsp"); // TODO valid address. end quiz
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
