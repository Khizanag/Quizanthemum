package Controller.Classes.OtherClasses;

import Controller.Classes.Quiz.QuizEvent;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
    private final String phoneNumber;
    private final String email;
    private final Date birthDate;
    private final Date registrationDate;
    private final List<Integer> friendIDs;
    private List<QuizEvent> quizEvents;
    private List<Challenge> challenges;
    private List<Achievement> achievements;

    public User(int id, String username, String password, String firstName, String lastName,
                int role, String  city, String county, String phoneNumber, String email,
                Date birthDate, Date registrationDate, List<Integer> friendIDs) {
        this.id = id;
        this.username = username;
        this.passwordHash = hashFunction(password);
        this.firstName = firstName;
        this.lastName = lastName;
        this.role = role;
        this.city = city;
        this.country = county;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.birthDate = birthDate;
        this.registrationDate = registrationDate;
        this.friendIDs = friendIDs;
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
