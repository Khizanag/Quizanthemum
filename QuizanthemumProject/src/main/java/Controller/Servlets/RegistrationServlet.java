package Controller.Servlets;

import Configs.Config;
import Model.Managers.UsersManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegistrationServlet")
public class RegistrationServlet extends HttpServlet implements Config {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doget!!!!!!!");
        UsersManager userManager = (UsersManager) request.getAttribute(USERS_MANAGER_STR);
        if(userManager == null){
            System.out.println("USER_MANAGER WANT CREATED");
        }
//        int id = userManager.getNextID();
//        String firstName = request.getParameter("registration_first_name");
//        String lastName = request.getParameter("registration_last_name");
//        String userName = request.getParameter("registration_username");
//        String password = request.getParameter("registration_password");
//        String email = request.getParameter("registration_email");
//        String birthDateStr = request.getParameter("registration_birth_date");
//        Date birthDate = /* TODO */ new Date();
//        Date registrationDate = new Date();
//
//        String city = "";
//        String country = "";
//        String mobilePhone = "";
//
//        User newUser = new User(1, userName, password, firstName, lastName, USER, city, country, mobilePhone, email, birthDate, registrationDate, null);
//        System.out.println(newUser.toString());
        // TODO check
//        userManager.insertUser(newUser);
    }
}
