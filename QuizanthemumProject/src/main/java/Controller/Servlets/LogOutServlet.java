package Controller.Servlets;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static Configs.Config.*;

@WebServlet(name = "LogOutServlet", urlPatterns = "/LogOut")
public class LogOutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("LogOutServlet");

        Cookie[] cookies = request.getCookies();
        if (request.getCookies() != null) {
            for (Cookie cookie : request.getCookies()) {
                response.addCookie(new Cookie(cookie.getName(), "-1"));
                if (cookie.getName().equals(LOGGED_IN_USER_ID_STR)) {
                    response.addCookie(new Cookie(cookie.getName(), "-1"));
                } else if (cookie.getName().equals(LOGGED_IN_USER_PASSWORD_HASH_STR)) {
                    response.addCookie(new Cookie(cookie.getName(), "-1"));
                }
            }
        }

        ServletContext context = request.getServletContext();
        context.removeAttribute("logedInUser");

        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", "http://localhost:8080/");
    }
}
    