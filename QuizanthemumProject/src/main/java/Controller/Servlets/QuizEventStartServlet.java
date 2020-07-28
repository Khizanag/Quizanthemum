package Controller.Servlets;

import Controller.Classes.Quiz.Quiz;
import Controller.Classes.Quiz.QuizEvent;
import Controller.Classes.User.User;
import Model.Managers.QuizEventManager;
import Model.Managers.QuizManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static Configs.Config.*;

@WebServlet(name = "QuizEventStartServlet")
public class QuizEventStartServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        QuizEventManager quizEventManager = (QuizEventManager) request.getServletContext().getAttribute(QUIZ_EVENT_MANAGER_STR);
        QuizManager quizManager = (QuizManager) request.getServletContext().getAttribute(QUIZ_MANAGER_STR);

        User user = (User) request.getAttribute("quiz_event_start_user");
        int quizID = Integer.parseInt(request.getParameter("quiz_event_quiz_id"));
        Quiz quiz = quizManager.getQuiz(quizID);

        QuizEvent quizEvent = new QuizEvent(quizEventManager.getNewQuizEventID(), user, quiz);
        quizEvent.startQuiz();

        request.setAttribute("quiz_event", quizEvent);
        response.setStatus(HttpServletResponse.SC_FOUND);//302
        if (quizEvent.hasNextQuestion()) {
            request.setAttribute("question_event_question", quizEvent.getNextEmptyQuestionEvent());
            response.setHeader("Location", "http://localhost:8080/web/pages/quiestion#1.html"); // TODO valid address. first question
        } else {
            response.setHeader("Location", "http://localhost:8080/web/pages/end-quiz.html"); // TODO valid address. end quiz
        }

    }
}
