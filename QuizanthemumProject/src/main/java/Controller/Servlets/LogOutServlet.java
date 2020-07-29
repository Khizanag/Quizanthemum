package Controller.Servlets;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LogOutServlet", urlPatterns = "/LogOut")
public class LogOutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("LogOutServlet");
        String url = request.getParameter("currentUrl");
        String toRemove = "http://localhost:8080/";
        url = url.substring(url.indexOf(toRemove) + toRemove.length());
        System.out.println("url : " + url);

        Cookie[] cookies = request.getCookies();
        if (cookies != null)
            for (Cookie cookie : cookies) {
                cookie.setValue("");
                cookie.setPath("/");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }

        ServletContext context = request.getServletContext();
        context.removeAttribute("logedInUser");

        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", url);
    }
}
