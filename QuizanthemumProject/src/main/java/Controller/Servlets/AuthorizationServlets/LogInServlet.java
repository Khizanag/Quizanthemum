package Controller.Servlets.AuthorizationServlets;

import Configs.Config;
import Controller.Classes.User.User;
import Model.Managers.UsersManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static javax.servlet.RequestDispatcher.ERROR_MESSAGE;

@WebServlet(name = "LogInServlet", urlPatterns = "/LogIn")
public class LogInServlet extends HttpServlet implements Config {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("LogInServlet");
        ServletContext context = request.getSession().getServletContext();
        String username = request.getParameter("log_in_username");
        String password = request.getParameter("log_in_password");
        UsersManager usersManager = (UsersManager) request.getServletContext().getAttribute(USERS_MANAGER_STR);
        User targetUser = usersManager.getUser(username);

        if(targetUser != null && targetUser.isCorrectPassword(password)){
            request.getServletContext().setAttribute(LOGGED_IN_USER, targetUser);
            context.removeAttribute(ERROR_MESSAGE);
            response.addCookie(new Cookie(LOGGED_IN_USER_ID, ""+targetUser.getID()));
            response.addCookie(new Cookie(LOGGED_IN_USER_PASSWORD_HASH, targetUser.getPasswordHash()));
            response.setStatus(HttpServletResponse.SC_FOUND);//302
            response.setHeader("Location", "http://localhost:8080/Profile?id=" + targetUser.getID());
        } else {
            context.setAttribute(ERROR_MESSAGE, "მომხმარებლის სახელი ან პაროლი არასწორია. სცადეთ თავიდან.");
            response.setStatus(HttpServletResponse.SC_FOUND);//302
            response.setHeader("Location", "http://localhost:8080/web/pages/LogInPage.jsp");
        }
    }

}
