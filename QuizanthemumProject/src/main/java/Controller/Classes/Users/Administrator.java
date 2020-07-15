package Controller.Classes.Users;

import java.util.Date;
import java.util.List;

public class Administrator extends User {

    public Administrator(int userID, String name, String lastName, String username, String city,
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
        return true;
    }
}
