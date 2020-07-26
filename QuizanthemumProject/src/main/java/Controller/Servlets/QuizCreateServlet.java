package Controller.Servlets;

import Controller.Classes.OtherClasses.User;
import Controller.Classes.Quiz.Question;
import Controller.Classes.Quiz.Quiz;
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

@WebServlet(name = "CreateQuizServlet")
public class QuizCreateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        QuizManager quizManager = (QuizManager) request.getServletContext().getAttribute(QUIZ_MANAGER_STR);
        UsersManager usersManager = (UsersManager) request.getServletContext().getAttribute(USERS_MANAGER_STR);

        int id = quizManager.getNewQuizID();
        String name = request.getParameter("quiz_name");
        String description = request.getParameter("quiz_description");
        String iconUrl = request.getParameter("quiz_icon_url");
        boolean mustShuffleQuestions = Boolean.parseBoolean(request.getParameter("quiz_must_shuffle_questions"));
        String comment = request.getParameter("quiz_comment");
        int authorId = Integer.parseInt(request.getParameter("quiz_author_id"));
        User author = usersManager.getUser(authorId);

        Quiz newQuiz = new Quiz(id, name, description, iconUrl, mustShuffleQuestions, comment, author);

        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", "http://localhost:8080/web/pages/profilePage-logged.html"); // TODO valid address


//        quizManager.insertQuiz(newQuiz);
    }
}
