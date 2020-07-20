package Controller.Classes;

import Controller.Classes.Quiz.QuizEvent;
import Controller.OtherClasses.Achievements;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class User {

    private final int id;
    private final String firstName;
    private final String lastName;
    private final String username;
    private final String password;
    private final String city;
    private final String country;
    private final String mobileNumber;
    private final String email;
    private final Date birthDate;
    private final Date registrationDate;
    private final List<User> friends;
    private List<QuizEvent> quizEvents;
    private int wonChallengesCount;
    private List<Challenge> challenges;
    private List<Achievements> achievements;

    public User(int id, String firstName, String lastName, String username,
                String password, String  city, String county, String mobileNumber, String email,
                Date birthDate, Date registrationDate, List<User> friends){
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.city = city;
        this.country = county;
        this.mobileNumber = mobileNumber;
        this.email = email;
        this.password = password;
        this.birthDate = birthDate;
        this.registrationDate = registrationDate;

        if(friends != null)
            this.friends = friends;
        else
            this.friends = new ArrayList<>();
    }

    public String getFirstName() {
        return firstName;
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

    public void challengeOtherUser(Challenge challenge){
        // insert challenge into database
        if(challenge == null)
            updateChallengesInfo();
        challenges.add(challenge);
    }

    private void updateChallengesInfo(){

    }

    public void wasChallenged(Challenge challenge){
        if(challenge == null)
            updateChallengesInfo();
        challenges.add(challenge);
    }

    public int getId() {
        return id;
    }
}
