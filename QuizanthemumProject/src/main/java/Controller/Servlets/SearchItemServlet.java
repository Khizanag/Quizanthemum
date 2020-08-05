package Controller.Servlets;

import Controller.Classes.OtherClasses.Category;
import Controller.Classes.Quiz.Quiz;
import Controller.Classes.User.User;
import Model.Managers.CategoriesManager;
import Model.Managers.ManagersManager;
import Model.Managers.QuizManager;
import Model.Managers.UsersManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthScrollBarUI;
import java.io.IOException;
import java.util.List;

import static Configs.Config.*;

@WebServlet(name = "SearchItemServlet", urlPatterns = "/SearchPage")
public class SearchItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        QuizManager quizzesManager = (QuizManager) managersManager.getManager(QUIZ_MANAGER_STR);
        UsersManager usersManager = (UsersManager) managersManager.getManager(USERS_MANAGER_STR);


        List<User> users = usersManager.getUsers();
        List<Quiz> quizzes = quizzesManager.getQuizzes(DEFAULT_NUM_QUIZZES_TO_DISPLAY);
        request.setAttribute("quizzes", quizzes);
        request.setAttribute("users", users);
        request.setAttribute("search", request.getParameter("search"));

        RequestDispatcher dispatcher = request.getRequestDispatcher("/web/pages/SearchPage.jsp");
        dispatcher.forward(request, response);
    }
}
