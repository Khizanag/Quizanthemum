package Controller.Classes.Users;

import java.util.Date;
import java.util.List;

public class Writer extends User {

    public Writer(int userID, String name, String lastName, String username, String city,
                  String county, String mobileNumber, String email, Date birthDate,
                  Date registrationDate, List<User> friends){
        super(userID, name, lastName, username, city, county, mobileNumber, email,
                birthDate, registrationDate, friends);
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
