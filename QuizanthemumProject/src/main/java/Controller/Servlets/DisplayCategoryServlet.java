package Controller.Servlets;

import Controller.Classes.OtherClasses.Category;
import Controller.Classes.Quiz.Quiz;
import Model.Managers.CategoriesManager;
import Model.Managers.ManagersManager;
import Model.Managers.QuizManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static Configs.Config.*;

@WebServlet(name = "DisplayCategoryServlet", urlPatterns = "/DisplayCategory")
public class DisplayCategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.printf("DisplayCategoryServlet");
        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        CategoriesManager categoriesManager = (CategoriesManager) managersManager.getManager(CATEGORIES_MANAGER_STR);
        QuizManager quizzesManager = (QuizManager) managersManager.getManager(QUIZ_MANAGER_STR);
        int id = Integer.parseInt(request.getParameter("chosen-category"));
        Category category = categoriesManager.getCategory(id);
        List<Quiz> quizzes = quizzesManager.getCategoryQuizzes(category);

        request.setAttribute("quizzes", quizzes);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/web/pages/QuizListPage.jsp");
        dispatcher.forward(request, response);
    }
}
