package Controller.Servlets;

import Configs.Config;
import Controller.Classes.User.User;
import Model.DatabaseConnector;
import Model.Managers.UsersManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.StringTokenizer;

import static Configs.UserRoles.USER;

@WebServlet(name = "RegistrationServlet", urlPatterns = "/Registration")
public class RegistrationServlet extends HttpServlet implements Config {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.printf("**********RegistrationServlet");
        UsersManager userManager = (UsersManager) request.getServletContext().getAttribute(USERS_MANAGER_STR);

        String username = request.getParameter("registration_username");

        String errorMessage = "";
        if(!userManager.isUsernameFree(username)){
            errorMessage = "მომხმარებლის ეს სახელი (username) უკვე დაკავებულია სხვა მომხმარებლის მიერ. გთხოვთ, აარჩიოთ სხვა username.";
        }

        if(errorMessage.isEmpty()){ // there were no errors during registration
            String password = request.getParameter("registration_password");
            String firstName = request.getParameter("registration_first_name");
            String lastName = request.getParameter("registration_last_name");
            String email = request.getParameter("registration_email");
            String city = request.getParameter("registration_city");
            String country = request.getParameter("registration_country");
            String mobilePhone = request.getParameter("registration_phone_number");
            String birthDateStr = request.getParameter("registration_birth_date");
            StringTokenizer strTok = new StringTokenizer(birthDateStr, "-");
            int year = Integer.parseInt(strTok.nextToken());
            int month = Integer.parseInt(strTok.nextToken());
            int day = Integer.parseInt(strTok.nextToken());
            // 1900 is base year, month should be between [0-11]
            Date birthDate = new Date(year-1900, month-1, day);
            Date registrationDate = new Date();
            String salt = generateSalt();
            userManager.setCurrentSalt(salt);
            User newUser = new User(username, password, salt, firstName, lastName, USER, city, country, mobilePhone, email, birthDate, registrationDate);
            int ID = userManager.insertUser(newUser);

            request.getServletContext().setAttribute(LOGGED_IN_USER, newUser);
            request.getServletContext().removeAttribute(errorMessage);
            response.addCookie(new Cookie(LOGGED_IN_USER_ID, "" + ID));
            response.addCookie(new Cookie(LOGGED_IN_USER_PASSWORD_HASH  , newUser.getPasswordHash()));

            response.setStatus(HttpServletResponse.SC_FOUND);//302
            response.setHeader("Location", "http://localhost:8080/Profile?id=" + ID);
        } else {
            request.getServletContext().setAttribute(ERROR_MESSAGE, errorMessage);
            response.setStatus(HttpServletResponse.SC_FOUND);//302
            response.setHeader("Location", "http://localhost:8080/web/pages/Registration.jsp");
        }
    }

    private String generateSalt() {
        int n = PASSWORD_SALT_LENGTH;
        String base = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvxyz";

        StringBuilder sb = new StringBuilder(n);
        for (int i = 0; i < n; i++) {
            int index = (int)(base.length() * Math.random());
            sb.append(base.charAt(index));
        }
        return sb.toString();
    }

}