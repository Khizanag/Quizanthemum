package Controller.Classes.Users;

import Controller.Classes.Challenge;
import Controller.Classes.Quiz.QuizEvent;

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
    private List<QuizEvent> quizEvents;
    private List<Challenge> challenges;

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

        if(friends != null)
            this.friends = friends;
        else
            this.friends = new ArrayList<>();
    }

    public String getName() {
        return name;
    }

    public String getLastName() {
        return lastName;
    }

    public String getUsername() {
        return username;
    }

    public String getCity() {
        return city;
    }

    public String getCountry() {
        return country;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public String getEmail() {
        return email;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public List<User> getFriends() {
        return friends;
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
