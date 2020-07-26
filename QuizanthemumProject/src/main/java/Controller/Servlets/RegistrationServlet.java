package Controller.Servlets;

import Configs.Config;
import Controller.Classes.OtherClasses.User;
import Model.Managers.UsersManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

import static Configs.UserRoles.USER;

@WebServlet(name = "RegistrationServlet", urlPatterns = "/Registration")
public class RegistrationServlet extends HttpServlet implements Config {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UsersManager userManager = (UsersManager) request.getServletContext().getAttribute(USERS_MANAGER_STR);

        int id = userManager.getNextID();
        String firstName = request.getParameter("registration_first_name");
        String lastName = request.getParameter("registration_last_name");
        String username = request.getParameter("registration_username");
        String password = request.getParameter("registration_password");
        String email = request.getParameter("registration_email");
        String city = request.getParameter("registration_city");
        String country = request.getParameter("registration_country");
        String mobilePhone = request.getParameter("registration_phone_number");
        String birthDateStr = request.getParameter("registration_birth_date");
        Date birthDate = /* TODO */ new Date();
        Date registrationDate = new Date();

        User newUser = new User(id, username, password, firstName, lastName, USER, city, country, mobilePhone, email, birthDate, registrationDate, null);

        String errorMessage = "";

        if(!userManager.isUsernameFree(username)){
            errorMessage = "მომხმარებლის ეს სახელი (username) უკვე დაკავებულია სხვა მომხმარებლის მიერ. გთხოვთ, აარჩიოთ სხვა username.";
        }

        if(errorMessage.isEmpty()){ // there were no errors during registration
            Cookie userIDCookie = new Cookie("currentUserID", ""+id);
            response.addCookie(userIDCookie);
            response.setStatus(HttpServletResponse.SC_FOUND);//302
            response.setHeader("Location", "http://localhost:8080/web/pages/profilePage-logged.html");
        } else {
            request.getServletContext().setAttribute("errorMessage", errorMessage);
            response.setStatus(HttpServletResponse.SC_FOUND);//302
            response.setHeader("Location", "http://localhost:8080/web/pages/Registration.jsp");
        }
//                userManager.insertUser(newUser);
    }
}
