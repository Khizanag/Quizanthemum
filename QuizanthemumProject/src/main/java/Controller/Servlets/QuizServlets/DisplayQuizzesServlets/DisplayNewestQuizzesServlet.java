package Controller.Servlets.QuizServlets.DisplayQuizzesServlets;

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

@WebServlet(name = "DisplayNewestQuizzesServlet", urlPatterns = "/DisplayNewestQuizzes")
public class DisplayNewestQuizzesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        CategoriesManager categoriesManager = (CategoriesManager) managersManager.getManager(CATEGORIES_MANAGER_STR);
        QuizManager quizzesManager = (QuizManager) managersManager.getManager(QUIZ_MANAGER_STR);

        List<Quiz> quizzes = quizzesManager.getNewestQuizzes(DEFAULT_NUM_QUIZZES_TO_DISPLAY);
        request.setAttribute("quizzes", quizzes);
        request.setAttribute("title", "Newest Quizzes");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/web/pages/QuizListPage.jsp");
        dispatcher.forward(request, response);
    }
}
