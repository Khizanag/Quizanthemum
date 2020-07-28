package Controller.Servlets;

import Controller.Classes.Quiz.Question;
import Controller.Classes.Quiz.QuestionEvent;
import Controller.Classes.Quiz.QuizEvent;
import Model.Managers.QuestionEventManager;
import Model.Managers.QuizEventManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static Configs.Config.QUESTION_EVENT_MANAGER_STR;
import static Configs.Config.QUIZ_EVENT_MANAGER_STR;

@WebServlet(name = "QuizEventFinishedServlet")
public class QuizEventFinishedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        QuizEventManager quizEventManager = (QuizEventManager) request.getServletContext().getAttribute(QUIZ_EVENT_MANAGER_STR);
        QuestionEventManager questionEventManager = (QuestionEventManager) request.getServletContext().getAttribute(QUESTION_EVENT_MANAGER_STR);

        QuizEvent quizEvent = (QuizEvent) request.getAttribute("quiz_event_quiz");

        quizEvent.finishQuiz();
        quizEvent.resetQuestionEventIterator();
        while (quizEvent.hasNextQuestionEvent()) {
            questionEventManager.setQuestionEvent(quizEvent.getNextQuestionEvent());
        }

        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", "http://localhost:8080/web/pages/quiz_summary.html"); // TODO valid address. quiz summary

        quizEventManager.insertQuizEvent(quizEvent);
    }
}
