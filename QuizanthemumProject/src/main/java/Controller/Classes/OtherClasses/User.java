package Controller.Classes.OtherClasses;

import Controller.Classes.Quiz.QuizEvent;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static Configs.Config.DEFAULT_ID;

public class User {

    private int id;
    private String username;
    private String passwordHash;
    private String firstName;
    private String lastName;
    private int role;
    private String city;
    private String country;
    private String phoneNumber;
    private String email;
    private Date birthDate;
    private Date registrationDate;
    private List<Integer> friendIDs;
    private List<QuizEvent> quizEvents;
    private List<Challenge> challenges;
    private List<Achievement> achievements;

    // for creating object from DB
    public User(int id, String username, String passwordHash, String firstName, String lastName,
                int role, String  city, String county, String phoneNumber, String email,
                Date birthDate, Date registrationDate, List<Integer> friendIDs) {
        this(username, firstName, lastName, role, city, county, phoneNumber, email, birthDate, registrationDate, friendIDs);
        this.id = id;
        this.passwordHash = passwordHash;
        this.friendIDs = friendIDs;
    }

    // for first time creating
    public User(String username, String password, String firstName, String lastName,
                int role, String  city, String county, String phoneNumber, String email,
                Date birthDate, Date registrationDate){
        this.id = DEFAULT_ID;
        this.passwordHash = hashFunction(password);
        this.friendIDs = new ArrayList<>();
    }

    // helper constructor used by other ones
    private User(String username, String firstName, String lastName,
                 int role, String  city, String county, String phoneNumber, String email,
                 Date birthDate, Date registrationDate, List<Integer> friendIDs){
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.role = role;
        this.city = city;
        this.country = county;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.birthDate = birthDate;
        this.registrationDate = registrationDate;
    }

    public int getId(){ return id; }

    public String getUsername() {
        return username;
    }

    private String hashFunction(String password) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA");
        } catch (NoSuchAlgorithmException e) { }
        md.update(password.getBytes());
        byte[] hash = md.digest();
        String hashed = hexToString(hash);
        return hashed;
    }

    /*
	 * Given a byte[] array, produces a hex String,
	 * such as "234a6f". with 2 chars for each byte in the array.
	 * helper method for hash function
	 */
    public static String hexToString(byte[] bytes) {
        StringBuffer buff = new StringBuffer();
        for (int i=0; i<bytes.length; i++) {
            int val = bytes[i];
            val = val & 0xff;  // remove higher bits, sign
            if (val<16) buff.append('0'); // leading 0
            buff.append(Integer.toString(val, 16));
        }
        return buff.toString();
    }


    public int getID() {
        return id;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public int getRole(){ return role; }

    public String getCity() {
        return city;
    }

    public String getCountry() {
        return country;
    }

    public String getMobileNumber() {
        return phoneNumber;
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
        if(friendIDs == null){
            // TODO get ids from base
        }
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

    public boolean isCorrectPassword (String password) {
        return passwordHash.equals(hashFunction(password));
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", passwordHash='" + passwordHash + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", role=" + role +
                ", city='" + city + '\'' +
                ", country='" + country + '\'' +
                ", mobileNumber='" + phoneNumber + '\'' +
                ", email='" + email + '\'' +
                ", birthDate=" + birthDate +
                ", registrationDate=" + registrationDate +
                ", friendIDs=" + friendIDs +
                ", quizEvents=" + quizEvents +
                ", challenges=" + challenges +
                ", achievements=" + achievements +
                '}';
    }
}
