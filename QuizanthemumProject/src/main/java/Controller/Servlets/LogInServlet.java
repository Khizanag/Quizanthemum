package Controller.Servlets;

import Configs.Config;
import Controller.Classes.OtherClasses.User;
import Model.Managers.UsersManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LogInServlet")
public class LogInServlet extends HttpServlet implements Config {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = request.getServletContext();
        String username = request.getParameter("log_in_username");
        String password = request.getParameter("log_in_password");
        UsersManager usersManager = (UsersManager) request.getServletContext().getAttribute(USERS_MANAGER_STR);
        User targetUser = usersManager.getUser(username);
        if(targetUser.isCorrectPassword(password)){
            request.getServletContext().setAttribute("logedInUser", targetUser);
            response.addCookie(new Cookie("logedInUserID", ""+targetUser.getID()));
            response.setStatus(HttpServletResponse.SC_FOUND);//302
            response.setHeader("Location", "http://localhost:8080/web/pages/profilePage-logged.html");
        } else {
            context.setAttribute("errorMessage", "მომხმარებლის სახელი ან პაროლი არასწორია. სცადეთ თავიდან.");
            response.setStatus(HttpServletResponse.SC_FOUND);//302
            response.setHeader("Location", "http://localhost:8080/web/pages/SignIn.jsp");
        }
    }
    
}
