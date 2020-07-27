package Controller.Servlets;

import Controller.Classes.OtherClasses.User;
import Controller.Classes.Quiz.Question;
import Controller.Classes.Quiz.QuestionEvent;
import Controller.Classes.Quiz.Quiz;
import Model.Managers.QuestionEventManager;
import Model.Managers.QuestionManager;
import Model.Managers.QuizManager;
import Model.Managers.UsersManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static Configs.Config.*;

@WebServlet(name = "QuestionEventFinishedServlet")
public class QuestionEventFinishedServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        QuestionEventManager questionEventManager = (QuestionEventManager) request.getServletContext().getAttribute(QUESTION_EVENT_MANAGER_STR);

        int quizEventId = Integer.parseInt(request.getParameter("question_event_quiz_event_id"));
        Question question = (Question) request.getAttribute("question_event_question");
        boolean isAlreadyGraded = Boolean.parseBoolean(request.getParameter("question_event_is_already_graded"));
        Date startDate = (Date) request.getAttribute("question_event_start_date");

        int numAnswers = Integer.parseInt(request.getParameter("question_event_num_answers"));
        List<String> userAnswers = new ArrayList<>();
        for (int i = 0; i < numAnswers; i++) {
            userAnswers.add(request.getParameter("question_event_answer_" + i));
        }

        QuestionEvent newQuestionEvent = new QuestionEvent(quizEventId, question, isAlreadyGraded, startDate);
        newQuestionEvent.setUserAnswers(userAnswers);
        newQuestionEvent.finishQuestionEvent();

        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", "http://localhost:8080/web/pages/profilePage-logged.html"); // TODO valid address

//        questionEventManager.setQuestionEvent(newQuestionEvent);
    }
}
