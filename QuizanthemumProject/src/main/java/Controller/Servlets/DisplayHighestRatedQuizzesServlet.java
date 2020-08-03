package Controller.Servlets;

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
import static Configs.Config.DEFAULT_NUM_QUEZZES_TO_DISPLAY;

@WebServlet(name = "DisplayHighestRatedQuizzesServlet", urlPatterns = "/DisplayHighestRatedQuizzes")
public class DisplayHighestRatedQuizzesServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        QuizManager quizzesManager = (QuizManager) managersManager.getManager(QUIZ_MANAGER_STR);

        List<Quiz> quizzes = quizzesManager.getHighestRatedQuizzes(DEFAULT_NUM_QUEZZES_TO_DISPLAY);
        request.setAttribute("quizzes", quizzes);
        request.setAttribute("title", "ყველაზე მაღალრეიტინგული ქვიზები");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/web/pages/QuizListPage.jsp");
        dispatcher.forward(request, response);
    }
}
