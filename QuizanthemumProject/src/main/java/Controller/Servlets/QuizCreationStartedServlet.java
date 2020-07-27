package Controller.Servlets;

import Controller.Classes.OtherClasses.User;
import Controller.Classes.Quiz.Quiz;
import Model.Managers.QuizManager;
import Model.Managers.UsersManager;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static Configs.AttributesKeysConfig.CREATING_QUIZ_STR;
import static Configs.Config.*;

@WebServlet(name = "QuizCreationStartedServlet", urlPatterns = "/QuizCreationStarted")
public class QuizCreationStartedServlet extends HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        //Your code
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected synchronized void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        QuizManager quizManager = (QuizManager) request.getServletContext().getAttribute(QUIZ_MANAGER_STR);
        UsersManager usersManager = (UsersManager) request.getServletContext().getAttribute(USERS_MANAGER_STR);

        String name = request.getParameter("quiz_name");
        String description = request.getParameter("quiz_description");
        String iconUrl = request.getParameter("quiz_icon_url");
        boolean mustShuffleQuestions = Boolean.parseBoolean(request.getParameter("quiz_must_shuffle_questions"));
        String comment = request.getParameter("quiz_comment");
        User author = (User) request.getServletContext().getAttribute("logedInUser");

        Quiz newQuiz = new Quiz(name, description, iconUrl, mustShuffleQuestions, comment, author);

        int ID = quizManager.insertQuiz(newQuiz);
        newQuiz.setID(ID);
        System.out.println("quiz inserted into database");
        request.setAttribute("startedCreatingOfQuiz", ID);
        request.setAttribute(CREATING_QUIZ_STR, newQuiz);
//        System.out.println("now will forwarded to AddingQuestions.jsp");
//        if(request.getRequestDispatcher("../../AddingQuestions.jsp") == null){
//            System.out.println("PZDC: dispacheri nullia in QUIZ_creationStartedServlet");
//        } else {
//            System.out.println("dispacheri nulli araa in QUIZ_creationStartedServlet");
//        }
//        request.getRequestDispatcher("/Users/gigakhizanishvili/Programming/GitHub/Quizanthemum/QuizanthemumProject/src/main/webapp/web/pages/AddingQuestions.jsp").forward(request, response);

        response.setHeader("CREATING_QUIZ_NAME_STR", "CREATING_QUIZ_WITH_ID_" + ID);
        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", "http://localhost:8080/web/pages/AddingQuestions.jsp");

    }
}
