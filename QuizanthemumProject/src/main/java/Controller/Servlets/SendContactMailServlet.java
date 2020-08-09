package Controller.Servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SendContactMailServlet", urlPatterns = "/SendContactMail")
public class SendContactMailServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String subject = request.getParameter("subject");
//        String mail = request.getParameter("mail");
        String mobile = request.getParameter("mobile");
        String body = request.getParameter("body");

        body = "Name: " + name + "\n" + "Mobile: " + mobile + "\n" + body;

        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", "https://mail.google.com/mail/?view=cm&fs=1&to=quizanthemum@gmail.com&su=" + subject + "&body=" + body);
    }
}
