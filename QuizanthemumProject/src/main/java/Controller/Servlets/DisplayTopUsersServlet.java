package Controller.Servlets;

import Controller.Classes.Quiz.Quiz;
import Controller.Classes.User.User;
import Model.Managers.ManagersManager;
import Model.Managers.QuizManager;
import Model.Managers.UsersManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static Configs.Config.*;

@WebServlet(name = "DisplayTopUsersServlet", urlPatterns = "/DisplayTopUsers")
public class DisplayTopUsersServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        UsersManager usersManager = (UsersManager) managersManager.getManager(USERS_MANAGER_STR);

        int locationType = Integer.parseInt(request.getParameter("location_type"));
        String location = "";
        String city = request.getParameter("city");
        if(locationType == LOCATION_TYPE_CITY) {
            if(city.equals("empty")) locationType = LOCATION_TYPE_NONE;
            location = city;
        }

        String country = request.getParameter("country");
        if(locationType == LOCATION_TYPE_COUNTRY) {
            if(country.equals("empty")) locationType = LOCATION_TYPE_NONE;
            location = country;
        }

        String is_friend = request.getParameter("is_friend");
        boolean isFriend = (is_friend != null);

        int userID = Integer.parseInt(request.getParameter("user_id"));

        String is_author = request.getParameter("is_author");
        boolean isAuthor = (is_author != null);

        List<User> users = usersManager.getTopUsersByFilter(DEFAULT_NUM_TOP_USERS_TO_DISPLAY, locationType, location,
                isFriend, userID, isAuthor);
        request.setAttribute("users", users);
        request.setAttribute("title", "ტოპ მომხმარებლები");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/web/pages/TopUsersPage.jsp");
        dispatcher.forward(request, response);
    }

}
