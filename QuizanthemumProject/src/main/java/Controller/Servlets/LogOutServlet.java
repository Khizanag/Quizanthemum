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
//        String url = request.getParameter("currentUrl");
//        String toRemove = "http://localhost:8080/";
//        url = url.substring(url.indexOf(toRemove) + toRemove.length());
//        System.out.println("url : " + url);

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            System.out.printf("is not nul; COOKIES");
            for (Cookie cookie : cookies) {
                System.out.println("cookie name : " + cookie.getName());
                if (cookie.getName().equals("Quizanthemum-loged-in-user-ID"))
                    cookie.setValue("-1");
                else if (cookie.getName().equals("Quizanthemum-loged-in-user-password-hash"))
                    cookie.setValue("-1");
                System.out.println("cookie value : " + cookie.getValue());
            }
        }

        ServletContext context = request.getServletContext();
        context.removeAttribute("logedInUser");

        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", "http://localhost:8080/");
    }
}
