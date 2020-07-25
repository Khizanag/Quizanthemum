package Controller.Servlets;

import Controller.Classes.OtherClasses.User;
import Model.Managers.UserManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

import static Configs.Config.USER_MANAGER_STR;
import static Configs.UserRoles.USER;

@WebServlet(name = "RegistrationServlet", urlPatterns = "/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doget!!!!!!!");
//        UserManager userManager = (UserManager) request.getServletContext().getAttribute(USER_MANAGER_STR);

//        int id = userManager.getNextID();
        String firstName = request.getParameter("registration_first_name");
        String lastName = request.getParameter("registration_last_name");
        String userName = request.getParameter("registration_username");
        String password = request.getParameter("registration_password");
        String email = request.getParameter("registration_email");
        String birthDateStr = request.getParameter("registration_birth_date");
        Date birthDate = /* TODO */ new Date();
        Date registrationDate = new Date();

        String city = "";
        String country = "";
        String mobilePhone = "";

        User newUser = new User(1, userName, password, firstName, lastName, USER, city, country, mobilePhone, email, birthDate, registrationDate, null);
        System.out.println(newUser.toString());
        // TODO check
//        userManager.insertUser(newUser);
    }
}
