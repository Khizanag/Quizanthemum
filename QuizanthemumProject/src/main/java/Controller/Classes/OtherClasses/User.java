package Controller.OtherClasses;

import Controller.Classes.Quiz.QuizEvent;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class User {

    private final int id;
    private final String username;
    private final String passwordHash;
    private final String firstName;
    private final String lastName;
    private final int role;
    private final String city;
    private final String country;
    private final String mobileNumber;
    private final String email;
    private final Date birthDate;
    private final Date registrationDate;
    private final List<User> friends;
    private List<QuizEvent> quizEvents;
    private List<Challenge> challenges;
    private List<Achievement> achievements;

    public User(int id, String username, String password, String firstName, String lastName,
                int role, String  city, String county, String mobileNumber, String email,
                Date birthDate, Date registrationDate, List<User> friends){
        this.id = id;
        this.username = username;
        // TODO create passwordHash
        this.passwordHash = password;
        String passwordHash;
        this.firstName = firstName;
        this.lastName = lastName;
        this.role = role;
        this.city = city;
        this.country = county;
        this.mobileNumber = mobileNumber;
        this.email = email;
        passwordHash = hashFunction(password);
        this.birthDate = birthDate;
        this.registrationDate = registrationDate;
        this.friends = friends;
    }

    public int getId(){ return id; }

    public String getUsername() {
        return username;
    }

    private String hashFunction(String password) {
        // TODO
        return password;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
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

    boolean isAdministrator(){
        return false;
    }

    void addFriend(User user){
        friends.add(user);
    }

    public void challengeOtherUser(Challenge challenge){
        // insert challenge into database
        if(challenges == null)
            updateChallengesInfo();
        challenges.add(challenge);
    }

    private void updateChallengesInfo(){
        // TODO
    }


    public void wasChallenged(Challenge challenge){
        if(challenge == null)
            updateChallengesInfo();
        challenges.add(challenge);
    }

    public int getID() {
        return id;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public boolean isCorrectPassword (String password) {
        return passwordHash.equals(hashFunction(password));
    }
}
