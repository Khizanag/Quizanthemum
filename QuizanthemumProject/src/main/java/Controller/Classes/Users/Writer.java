package Controller.Classes.Users;

import Controller.Classes.Quiz.Quiz;

import java.util.Date;
import java.util.List;

public class Writer extends User {

    private final List<Quiz> createdQuizes;

    public Writer(int userID, String name, String lastName, String username, String city,
                  String county, String mobileNumber, String email, Date birthDate,
                  Date registrationDate, List<User> friends, List<Quiz> createdQuizes){
        super(userID, name, lastName, username, city, county, mobileNumber, email,
                birthDate, registrationDate, friends);
        this.createdQuizes = createdQuizes;
    }

    @Override
    boolean isWriter(){
        return true;
    }

    @Override
    boolean isAdministrator(){
        return false;
    }
}
