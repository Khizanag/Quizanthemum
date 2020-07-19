package Controller.Classes.Users;

import Controller.Classes.Challenge;
import Controller.Classes.Quiz.QuizEvent;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class User {

    private final int userID;
    private final String name;
    private final String lastName;
    private final String username;
    private final String city;
    private final String country;
    private final String mobileNumber;
    private final String email;
    private final Date birthDate;
    private final Date registrationDate;
    private final List<User> friends;
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
