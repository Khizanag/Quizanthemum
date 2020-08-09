package Controller.Servlets.AuthorizationServlets;

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
        Cookie[] cookies = request.getCookies();
        if (request.getCookies() != null) {
            for (Cookie cookie : request.getCookies()) {
                response.addCookie(new Cookie(cookie.getName(), "-1"));
                if (cookie.getName().equals(LOGGED_IN_USER_ID)) {
                    response.addCookie(new Cookie(cookie.getName(), "-1"));
                } else if (cookie.getName().equals(LOGGED_IN_USER_PASSWORD_HASH)) {
                    response.addCookie(new Cookie(cookie.getName(), "-1"));
                }
            }
        }

        ServletContext context = request.getServletContext();
        context.removeAttribute(LOGGED_IN_USER);

        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", "http://localhost:8080/");
    }
}
    