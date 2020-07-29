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

@WebServlet(name = "QuestionEventFinishedServlet", urlPatterns = "/QuestionEventFinished")
public class QuestionEventFinishedServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        QuizEvent quizEvent = (QuizEvent) request.getAttribute("question_event_quiz_event");
//
        QuestionEvent questionEvent = (QuestionEvent) request.getAttribute("question_event");

        int numAnswers = questionEvent.getNumUsersAnswers();
        System.out.println(numAnswers);
        List<String> userAnswers = new ArrayList<>();
        for (int i = 0; i < numAnswers; i++) {
            String nextAns = request.getParameter("question_event_answer_" + i);
            System.out.println(nextAns);
            userAnswers.add(nextAns);
        }

//        questionEvent.setUserAnswers(userAnswers);
//        questionEvent.finishQuestionEvent();
//
//        if(questionEvent.isAutoGraded()) {
//            gradeQuestionEvent(questionEvent);
//        }
//
//        quizEvent.setFilledQuestionEvent(questionEvent);
//        response.setStatus(HttpServletResponse.SC_FOUND);//302
//        if (quizEvent.hasNextQuestion()) {
//            QuestionEvent nextQuestionEvent = quizEvent.getNextEmptyQuestionEvent();
//            request.setAttribute("question_event", nextQuestionEvent);
//            response.setHeader("Location", getNextQuestionLink(nextQuestionEvent.getType()));
//        } else {
//            response.setHeader("Location", "http://localhost:8080/web/pages/end-quiz.html"); // TODO valid address. end quiz
//        }

        System.out.println("question event finished");
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
