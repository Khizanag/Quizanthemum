package Controller.Servlets;

import Controller.Classes.OtherClasses.Category;
import Controller.Classes.Quiz.Quiz;
import Controller.Classes.User.User;
import Model.Managers.CategoriesManager;
import Model.Managers.ManagersManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static Configs.Config.*;
import static Configs.Config.QUIZ_CREATING_NOW;

@WebServlet(name = "StartQuizCreatingServlet", urlPatterns = "/StartQuizCreating")
public class StartQuizCreatingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        CategoriesManager categoriesManager = (CategoriesManager) managersManager.getManager(CATEGORIES_MANAGER_STR);

        String name = request.getParameter("quiz_name");
        int categoryID = Integer.parseInt(request.getParameter("category"));
        Category category = categoriesManager.getCategory(categoryID);
        String description = request.getParameter("quiz_description");
        String iconUrl = request.getParameter("quiz_icon_url");
        String shuffleCheckboxValue = request.getParameter("quiz_must_shuffle");
        boolean mustShuffleQuestions = (shuffleCheckboxValue != null);
        String comment = request.getParameter("quiz_comment");
        User author = (User) request.getServletContext().getAttribute(LOGGED_IN_USER);

        Quiz newQuiz = new Quiz(name, category, description, iconUrl, mustShuffleQuestions, comment, author);

        request.getServletContext().setAttribute(QUIZ_CREATING_NOW, newQuiz);
        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", "http://localhost:8080/web/pages/AddingQuestions.jsp");

    }
}
