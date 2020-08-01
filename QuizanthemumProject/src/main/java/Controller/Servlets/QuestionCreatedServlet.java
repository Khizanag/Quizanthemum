package Controller.Servlets;

import Controller.Classes.Quiz.Question.Question;
import Controller.Classes.Quiz.Question.QuestionTypes;
import Controller.Classes.Quiz.Quiz;
import Model.Managers.QuestionManager;
import Tools.FillTextTokenizer;

import javax.servlet.RequestDispatcher;
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
import static Configs.Config.QUIZ_CREATING_NOW;

@WebServlet(name = "QuestionCreatedServlet", urlPatterns = "/QuestionCreated")
public class QuestionCreatedServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("QuestionCreated Servlet");

        QuestionManager questionManager = (QuestionManager) request.getServletContext().getAttribute(QUESTION_MANAGER_STR);

        int type = Integer.parseInt(request.getParameter("type"));
        System.out.println("question type is -> " + type);
        boolean isAutoGraded = (type == QuestionTypes.STANDARD) ? false : true;
        int maxScore = Integer.parseInt(request.getParameter("max_score"));
        String headerStatement = new String(request.getParameter("description").getBytes("UTF-8"));
        System.out.println("header GEORGED: " + headerStatement);
        String comment = request.getParameter("comment");
        String source = request.getParameter("source");
        Date creationDate = new Date();
        boolean isPictureQuestion = false; //Boolean.parseBoolean(request.getParameter("question_is_picture_question"));
        boolean isPictureAnswer = false; //Boolean.parseBoolean(request.getParameter("question_is_picture_answer"));
        String textStatement = request.getParameter("statement_text");
        String pictureStatementUrl = request.getParameter("image_url");

        int numAnswers = Integer.parseInt(request.getParameter("num_answers"));
        int numStatements = Integer.parseInt(request.getParameter("num_statements"));
        List<String> answers = new ArrayList<>();
        List<String> statements = new ArrayList<>();

        switch (type){
            case QuestionTypes.FILL_BLANK:
                String text = request.getParameter("statement_text");
                FillTextTokenizer tokenizer = new FillTextTokenizer(text);
                while(tokenizer.hasMoreToken()){
                    String statement = tokenizer.getNextToken();
                    statements.add(statement);
                    if(tokenizer.hasMoreToken()){
                        String answer = tokenizer.getNextToken();
                        answers.add(answer);
                    }
                }
                break;
            case QuestionTypes.MATCHING:
                break;
            case QuestionTypes.STANDARD:
            case QuestionTypes.MULTI_CHOICE:
            case QuestionTypes.MULTI_ANSWER:
            case QuestionTypes.MULTI_CHOICE_MULTI_ANSWER:

            default: break;
        }

        for (int i = 0; i < numAnswers; i++) {
            String s = request.getParameter("answer_" + i);
            answers.add(s);
            if(type != QuestionTypes.MULTI_ANSWER) {
                statements.add(s);
            }
        }

        for (int i = 0; i < numStatements; i++) {
            statements.add(request.getParameter("statement_" + i));
        }

        Question newQuestion = new Question(type, isAutoGraded, maxScore, headerStatement, comment, source, creationDate,
                -1, isPictureQuestion, isPictureAnswer, textStatement, pictureStatementUrl, statements, answers);
        System.out.println("new question created in java");

        Quiz currentQuiz = (Quiz) request.getServletContext().getAttribute(QUIZ_CREATING_NOW);

        currentQuiz.addQuestion(newQuestion);
        System.out.println("question added into quiz");

        // TODO if finished quiz
//        response.setStatus(HttpServletResponse.SC_FOUND);//302
//        response.setHeader("Location", "http://localhost:8080/web/pages/AddingQuestions.jsp");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/web/pages/AddingQuestions.jsp");
        dispatcher.forward(request, response);
    }
}
