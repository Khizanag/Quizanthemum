package Controller.Servlets;

import Controller.Classes.Quiz.Question.Question;
import Controller.Classes.Quiz.Quiz;
import Model.Managers.ManagersManager;
import Model.Managers.QuestionManager;
import Model.Managers.QuizManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static Configs.Config.*;

@WebServlet(name = "QuizCreationFinishedServlet", urlPatterns = "/QuizCreationFinished")
public class QuizCreationFinishedServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("QuizCreationFinished ->");
        ServletContext context = request.getServletContext();
        Quiz quiz = (Quiz) context.getAttribute(QUIZ_CREATING_NOW);
        ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
        QuizManager quizManager = (QuizManager) managersManager.getManager(QUIZ_MANAGER_STR);
        QuestionManager questionManager = (QuestionManager) managersManager.getManager(QUESTION_MANAGER_STR);
        int ID = quizManager.insertQuiz(quiz);
        System.out.println("quiz inserted into database");
        quiz.setID(ID);

        int numQuestions = quiz.getQuestionsCount();
        for(int i = 0; i < numQuestions; i++){
            Question question = quiz.getQuestion(i);
            question.setQuizID(ID);
            questionManager.insertQuestion(question);
        }

        quiz.finishCreatingQuiz();
        context.removeAttribute(QUIZ_CREATING_NOW);

        context.setAttribute(LAST_CREATED_QUIZ, quiz);

        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", "http://localhost:8080/web/pages/StartQuiz.jsp");

    }
}
