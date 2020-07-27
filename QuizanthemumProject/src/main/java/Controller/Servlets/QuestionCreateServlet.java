package Controller.Servlets;

import Controller.Classes.Quiz.Question.Question;
import Controller.Classes.Quiz.Quiz;
import Model.Managers.QuestionManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static Configs.Config.QUESTION_MANAGER_STR;

@WebServlet(name = "QuestionCreateServlet", urlPatterns = "/QuestionCreated")
public class QuestionCreateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("QuestionCreated Servlet");

        QuestionManager questionManager = (QuestionManager) request.getServletContext().getAttribute(QUESTION_MANAGER_STR);

        int type = Integer.parseInt(request.getParameter("question_type"));
        boolean isAutoGraded = Boolean.parseBoolean(request.getParameter("question_is_auto_graded"));
        double maxScore = Double.parseDouble(request.getParameter("question_max_score"));
        String headerStatement = request.getParameter("question_header");
        String comment = request.getParameter("question_comment");
        String source = request.getParameter("question_source");
        Date creationDate = new Date();
        int quizId = (int) request.getServletContext().getAttribute("started_creating_quiz_id");
        boolean isPictureQuestion = Boolean.parseBoolean(request.getParameter("question_is_picture_question"));
        boolean isPictureAnswer = Boolean.parseBoolean(request.getParameter("question_is_picture_answer"));
        String textStatement = request.getParameter("question_text_statement");
        String pictureStatementUrl = request.getParameter("question_picture_statement_url");

        int numStatements = Integer.parseInt(request.getParameter("question_num_statements"));
        List<String> statements = new ArrayList<>();
        for (int i = 0; i < numStatements; i++) {
            statements.add(request.getParameter("question_statement_" + i));
        }

        int numAnswers = Integer.parseInt(request.getParameter("question_num_answers"));
        List<String> answers = new ArrayList<>();
        for (int i = 0; i < numAnswers; i++) {
            answers.add(request.getParameter("question_answer_" + i));
        }

        Question newQuestion = new Question(type, isAutoGraded, maxScore, headerStatement, comment, source, creationDate,
                quizId, isPictureQuestion, isPictureAnswer, textStatement, pictureStatementUrl, statements, answers);
        System.out.println("new question created in java");
        int questionID = questionManager.insertQuestion(newQuestion);
        System.out.println("question inserted into database");
        newQuestion.setID(questionID);

        String quizName = response.getHeader("CREATING_QUIZ_NAME_STR");
        System.out.println("quizName in questionCreateServ : " + quizName);

        Quiz currentQuiz = (Quiz) getServletContext().getAttribute(quizName);
        if(currentQuiz == null) System.out.println("PZDC: quiz is null");
        currentQuiz.addQuestion(newQuestion);
        System.out.println("question added into quiz");

        // TODO if finished quiz
        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", "http://localhost:8080/web/pages/AddingQuestions.jsp");
    }
}
