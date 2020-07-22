package Controller.Classes.OtherClasses;

import Controller.Classes.Quiz.QuizEvent;

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
    private final List<Integer> friendIDs;
    private List<QuizEvent> quizEvents;
    private List<Challenge> challenges;
    private List<Achievement> achievements;

    public User(int id, String username, String password, String firstName, String lastName,
                int role, String  city, String county, String mobileNumber, String email,
                Date birthDate, Date registrationDate, List<Integer> friendIDs){
        this.id = id;
        this.username = username;
        this.passwordHash = hashFunction(password);
        this.friendIDs = friendIDs;
        this.firstName = firstName;
        this.lastName = lastName;
        this.role = role;
        this.city = city;
        this.country = county;
        this.mobileNumber = mobileNumber;
        this.email = email;
        this.birthDate = birthDate;
        this.registrationDate = registrationDate;
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

    public List<Integer> getFriendIDs() {
        return friendIDs;
    }

    boolean isAdministrator(){
        return false;
    }

    void addFriend(int friendId){
        friendIDs.add(friendId);
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
