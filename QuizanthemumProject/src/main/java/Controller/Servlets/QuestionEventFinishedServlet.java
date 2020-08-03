package Controller.Servlets;

import Controller.Classes.Quiz.Question.QuestionEvent;
import Controller.Classes.Quiz.QuizEvent;
import Model.Managers.QuestionEventManager;
import Model.Managers.QuizEventManager;
import Tools.Pair;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;


import static Configs.Config.QUESTION_EVENT_MANAGER_STR;
import static Configs.Config.QUIZ_EVENT_MANAGER_STR;
import static Controller.Classes.Quiz.Question.QuestionTypes.*;

@WebServlet(name = "QuestionEventFinishedServlet", urlPatterns = "/QuestionEventFinished")
public class QuestionEventFinishedServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        QuizEvent quizEvent = (QuizEvent) request.getServletContext().getAttribute("quiz_event");
        QuizEventManager quizEventManager = (QuizEventManager) request.getServletContext().getAttribute(QUIZ_EVENT_MANAGER_STR);
        QuestionEventManager questionEventManager = (QuestionEventManager) request.getServletContext().getAttribute(QUESTION_EVENT_MANAGER_STR);

        QuestionEvent questionEvent = (QuestionEvent) request.getServletContext().getAttribute("question_event");
        int questionNumber = (int) request.getServletContext().getAttribute("question_number");


        int numAnswers = questionEvent.getNumUsersAnswers();
        int numStatements = questionEvent.getQuestion().getStatementsCount();
        List<String> userAnswers = new ArrayList<>();
        List<String> matchingColors = new ArrayList<>();

        for (int i = 0; i < numAnswers; i++) {
            if(questionEvent.getType() == MULTI_ANSWER && i >= numStatements) {
                break;
            }
            if (questionEvent.getType() == MULTI_CHOICE || questionEvent.getType() == MULTI_CHOICE_MULTI_ANSWER) {
                String nextAns = request.getParameter("question_event_multi_answer_" + i);
                if(nextAns != null) {
                    userAnswers.add(nextAns);
                }
            } else {
                String nextAns = request.getParameter("question_event_answer_" + i);
                userAnswers.add(nextAns);
                if(questionEvent.getType() == MATCHING) {
                    String nextColor = request.getParameter("question_event_matching_color_" + i);
                    matchingColors.add(nextColor);
                }
            }
        }

        if(questionEvent.getType() == MATCHING) {
            userAnswers = getUserMatchingAnswers(userAnswers, matchingColors);
        }

        questionEvent.setUserAnswers(userAnswers);
        questionEvent.finishQuestionEvent();
        gradeQuestionEvent(questionEvent);


        quizEvent.setFilledQuestionEvent(questionEvent);
        response.setStatus(HttpServletResponse.SC_FOUND);//302
        if (quizEvent.hasNextQuestion()) {
            QuestionEvent nextQuestionEvent = quizEvent.getNextEmptyQuestionEvent();
            request.getServletContext().setAttribute("question_event", nextQuestionEvent);
            request.getServletContext().setAttribute("question_number", questionNumber+1);
            response.setHeader("Location", getNextQuestionLink(nextQuestionEvent.getType()));
        } else {
            quizEvent.finishQuiz();
            if(!quizEvent.isPracticeMode()){
                quizEvent.resetQuestionEventIterator();
                int quizEventId = quizEventManager.insertQuizEvent(quizEvent);
                while (quizEvent.hasNextQuestionEvent()) {
                    QuestionEvent currQuestionEvent = quizEvent.getNextFilledQuestionEvent();
                    currQuestionEvent.setQuizEventId(quizEventId);
                    questionEventManager.setQuestionEvent(currQuestionEvent);
                }
            }
            response.setHeader("Location", "http://localhost:8080/web/pages/QuizSummaryPage.jsp?quiz_id=" + quizEvent.getQuiz().getID());
        }

        System.out.println("question event finished");
    }

    private List<String> getUserMatchingAnswers(List<String> userAnswers, List<String> matchingColors) {
        Map<String, String> map = new TreeMap<>();
        List<String> cleanedAnswers = new ArrayList<>();
        for(int i = 0; i < userAnswers.size(); i+=2) {
            if(!matchingColors.get(i).equals("")) {
                map.put(matchingColors.get(i), userAnswers.get(i));
            }
        }
        for(int i = 1; i < userAnswers.size(); i+=2) {
            if(map.containsKey(matchingColors.get(i))) {
                cleanedAnswers.add(map.get(matchingColors.get(i)));
                cleanedAnswers.add(userAnswers.get(i));
            }
        }
        return cleanedAnswers;
    }

    private void gradeQuestionEvent(QuestionEvent newQuestionEvent) {
        switch (newQuestionEvent.getType()) {
            case MULTI_ANSWER:
                newQuestionEvent.autoGradeMultiOpenAnswer();
                break;
            case MULTI_CHOICE_MULTI_ANSWER:
                newQuestionEvent.autoGradeMultiAnswer();
                break;
            case FILL_BLANK:
                newQuestionEvent.autoGradeFillBlank();
                break;
            case MATCHING:
                newQuestionEvent.autoGradeMatchingAnswer();
                break;
            case STANDARD:
                if (!newQuestionEvent.isAutoGraded()) {
                    break;
                }
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
