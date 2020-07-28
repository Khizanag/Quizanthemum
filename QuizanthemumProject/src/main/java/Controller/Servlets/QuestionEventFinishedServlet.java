package Controller.Servlets;

import Controller.Classes.Quiz.Question.Question;
import Controller.Classes.Quiz.Question.QuestionEvent;
import Controller.Classes.Quiz.Quiz;
import Controller.Classes.Quiz.QuizEvent;
import Model.Managers.QuestionEventManager;

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
import static Controller.Classes.Quiz.Question.QuestionTypes.*;

@WebServlet(name = "QuestionEventFinishedServlet")
public class QuestionEventFinishedServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        QuestionEventManager questionEventManager = (QuestionEventManager) request.getServletContext().getAttribute(QUESTION_EVENT_MANAGER_STR);

        QuizEvent quizEvent = (QuizEvent) request.getAttribute("quiz_event");
        int quizEventId = quizEvent.getId();
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

        if(newQuestionEvent.isAutoGraded()) {
            gradeQuestionEvent(newQuestionEvent);
        }

        response.setStatus(HttpServletResponse.SC_FOUND);//302
        if (quizEvent.hasNextQuestion()) {
            request.setAttribute("question_event_question", quizEvent.getNextEmptyQuestionEvent());
            response.setHeader("Location", "http://localhost:8080/web/pages/next-question.html"); // TODO valid address. next question
        } else {
            response.setHeader("Location", "http://localhost:8080/web/pages/end-quiz.html"); // TODO valid address. end quiz
        }

        quizEvent.setFilledQuestionEvent(newQuestionEvent);
    }

    private void gradeQuestionEvent(QuestionEvent newQuestionEvent) {
        switch (newQuestionEvent.getType()) {
            case MULTI_ANSWER:
            case MULTI_CHOICE_MULTI_ANSWER:
            case FILL_BLANK:
                newQuestionEvent.autoGradeMultiAnswer();
                break;
            case MATCHING:
                newQuestionEvent.autoGradeMatchingAnswer();
                break;
            case STANDARD:
            case MULTI_CHOICE:
            default:
                newQuestionEvent.autoGradeTextAnswer();
        }
    }
}
