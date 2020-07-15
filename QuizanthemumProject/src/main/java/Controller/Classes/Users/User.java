package Controller.Classes.Users;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class User {

    private int userID;
    private String name;
    private String lastName;
    private String username;
    private String city;
    private String country;
    private String mobileNumber;
    private String email;
    private Date birthDate;
    private Date registrationDate;
    private List<User> friends;

    public User(int userID, String name, String lastName, String username, String city,
                String county, String mobileNumber, String email, Date birthDate,
                Date registrationDate, List<User> friends){
        this.userID = userID;
        this.name = name;
        this.lastName = lastName;
        this.username = username;
        this.city = city;
        this.country = county;
        this.mobileNumber = mobileNumber;
        this.email = email;
        this.birthDate = birthDate;
        this.registrationDate = registrationDate;
        this.friends = friends;
    }

    boolean isWriter(){
        return false;
    }

    boolean isAdministrator(){
        return false;
    }

    void addFriend(User user){
        friends.add(user);
    }

}
