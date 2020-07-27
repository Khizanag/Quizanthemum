package Controller.Servlets;

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

@WebServlet(name = "LogInServlet", urlPatterns = "/LogInServlet")
public class LogInServlet extends HttpServlet implements Config {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("test") == null){
            System.out.println("att TEST is null");
            request.getSession().setAttribute("test", "zamtaria magari");
        } else {
            System.out.println(request.getSession().getAttribute("test"));
        }


        ServletContext context = request.getServletContext();
        String username = request.getParameter("log_in_username");
        String password = request.getParameter("log_in_password");
        UsersManager usersManager = (UsersManager) request.getServletContext().getAttribute(USERS_MANAGER_STR);
        User targetUser = usersManager.getUser(username);

        if(targetUser != null && targetUser.isCorrectPassword(password)){
            request.getServletContext().setAttribute("logedInUser", targetUser);
            context.removeAttribute("errorMessage");
            response.addCookie(new Cookie("Quizanthemum-loged-in-user-ID", ""+targetUser.getID()));
            response.addCookie(new Cookie("Quizanthemum-loged-in-user-password-hash", targetUser.getPasswordHash()));
            response.setStatus(HttpServletResponse.SC_FOUND);//302
            response.setHeader("Location", "http://localhost:8080/web/pages/profilePageLogged.jsp");
        } else {
            context.setAttribute("errorMessage", "მომხმარებლის სახელი ან პაროლი არასწორია. სცადეთ თავიდან.");
            response.setStatus(HttpServletResponse.SC_FOUND);//302
            response.setHeader("Location", "http://localhost:8080/web/pages/SignIn.jsp");
        }
    }

}
