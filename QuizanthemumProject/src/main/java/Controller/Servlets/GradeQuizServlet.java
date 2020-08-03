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

@WebServlet(name = "GradeQuizServlet", urlPatterns = "/GetRating")
public class GradeQuizServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String gradePoint = (String)request.getParameter("stars_rating");
        int score = Integer.parseInt(gradePoint);
        String quiz_id = (String)request.getParameter("quiz_id");
        int quizId = Integer.parseInt(quiz_id);
        String user_id = (String)request.getParameter("user_id");
        int userId = Integer.parseInt(user_id);

        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        QuizManager quizzesManager = (QuizManager) managersManager.getManager(QUIZ_MANAGER_STR);
//        Quiz currQuiz = quizzesManager.getQuiz(quizId);
//
//        UsersManager usersManager = (UsersManager) managersManager.getManager(USERS_MANAGER_STR);
//        User currUser = usersManager.getUser(userId);

        quizzesManager.rateQuiz(userId, quizId, score);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/web/pages/profilePageLogged.jsp");
        dispatcher.forward(request, response);
    }
}
