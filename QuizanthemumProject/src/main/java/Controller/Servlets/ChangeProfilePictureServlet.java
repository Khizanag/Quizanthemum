package Controller.Servlets;

import Controller.Classes.User.User;
import Model.Managers.UsersManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static Configs.Config.LOGGED_IN_USER;
import static Configs.Config.USERS_MANAGER_STR;

@WebServlet(name = "ChangeProfilePictureServlet", urlPatterns = "/ChangeProfilePicture")
public class ChangeProfilePictureServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UsersManager usersManager = (UsersManager) request.getServletContext().getAttribute(USERS_MANAGER_STR);
        User user = (User) request.getServletContext().getAttribute(LOGGED_IN_USER);
        String url = request.getParameter("photo-url");
        usersManager.insertNewProfilePicture(user.getID(), url);

        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", "http://localhost:8080/Profile?id=" + user.getID());

    }
}
