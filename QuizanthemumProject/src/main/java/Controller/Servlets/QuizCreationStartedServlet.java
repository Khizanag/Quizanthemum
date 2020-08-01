package Controller.Servlets;

import Controller.Classes.OtherClasses.Category;
import Controller.Classes.User.User;
import Controller.Classes.Quiz.Quiz;
import Model.Managers.CategoriesManager;
import Model.Managers.ManagersManager;
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
        //Your code // TODO deletable???
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected synchronized void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        CategoriesManager categoriesManager = (CategoriesManager) managersManager.getManager(CATEGORIES_MANAGER_STR);

        String name = request.getParameter("quiz_name");
        int categoryID = Integer.parseInt(request.getParameter("category_id")); // TODO
        Category category = categoriesManager.getCategory(categoryID);
        String description = request.getParameter("quiz_description");
        String iconUrl = request.getParameter("quiz_icon_url");
        boolean mustShuffleQuestions = Boolean.parseBoolean(request.getParameter("quiz_must_shuffle_questions"));
        String comment = request.getParameter("quiz_comment");
        User author = (User) request.getServletContext().getAttribute("logedInUser");

        Quiz newQuiz = new Quiz(name, category, description, iconUrl, mustShuffleQuestions, comment, author);

        request.getServletContext().setAttribute(QUIZ_CREATING_NOW, newQuiz);

        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", "http://localhost:8080/web/pages/AddingQuestions.jsp");

    }
}
