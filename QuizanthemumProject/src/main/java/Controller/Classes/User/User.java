package Controller.Classes.User;

import Controller.Classes.OtherClasses.Challenge;
import Controller.Classes.Quiz.QuizEvent;
import Model.Managers.ManagersManager;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static Configs.Config.DEFAULT_ID;

public class User {

    private static final String DEFAULT_PICTURE = "/web/images/common/defProfPic.jpg";

    private int id;
    private final String username;
    private String passwordHash;
    private final String firstName;
    private final String lastName;
    // TODO
    private String passwordSalt;
    private String pictureURL;
    private final int role;
    private final int quizzesPlayed;
    private final int quizzesMade;
    private final int challengesPlayed;
    private final int challengesWon;
    private final String city;
    private final String country;
    private final String phoneNumber;
    private final String email;
    private final Date birthDate;
    private final Date registrationDate;
    private List<Integer> friendIDs;
    private List<QuizEvent> quizEvents;
    private List<Challenge> challenges;
    private List<Achievement> achievements;

    // for creating object from DB
    public User(int id, String username, String passwordHash, String firstName, String lastName,
                int role, String  city, String county, String phoneNumber, String email,
                Date birthDate, Date registrationDate, String pictureURL, String passwordSalt, List<Integer> friendIDs) {
        this(username, firstName, lastName, role, city, county, phoneNumber, email, birthDate, registrationDate, pictureURL);
        this.id = id;
        this.passwordHash = passwordHash;
        this.passwordSalt = passwordSalt;
        this.friendIDs = friendIDs;
    }

    // for first time creating
    public User(String username, String password, String passwordSalt, String firstName, String lastName,
                int role, String  city, String county, String phoneNumber, String email,
                Date birthDate, Date registrationDate){
        this(username, firstName, lastName, role, city, county, phoneNumber, email, birthDate, registrationDate, DEFAULT_PICTURE);
        this.passwordSalt = passwordSalt;
        this.id = DEFAULT_ID;
        this.passwordHash = hashFunction(password + passwordSalt);
        this.friendIDs = new ArrayList<>();
    }

    // helper constructor used by other ones
    private User(String username, String firstName, String lastName,
                 int role, String  city, String county, String phoneNumber, String email,
                 Date birthDate, Date registrationDate, String pictureURL){
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
        this.pictureURL = pictureURL;
        this.challengesPlayed = 0;
        this.challengesWon = 0;
        this.quizzesMade = 0;
        this.quizzesPlayed = 0;
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

    public String getUsername() {
        return username;
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

    public int getQuizzesPlayed(){ return quizzesPlayed; }

    public int getChallengesPlayed(){ return challengesPlayed; }

    public int getQuizzesMade(){ return quizzesMade; }

    public int getChallengesWon(){ return challengesWon; }

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


    /********** SETTER methods **********/

    public void setID(int ID) {
        this.id = ID;
    }

    public void setChallenges(List<Challenge> challenges){
        this.challenges = challenges;
    }

    public List<Integer> getFriendIDs() {
        if(friendIDs == null){
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
        String fullPassword = password + passwordSalt;
        return passwordHash.equals(hashFunction(fullPassword));
    }

    public List<Challenge> getChallenges(){
        if(challenges == null){
            challenges = new ArrayList<>();
        }
        return challenges;
    }

    public List<Challenge> getWaitingChallengedChallenges() {
        List<Challenge> challenges = new ArrayList<>();
        for(Challenge challenge: getChallenges()){
            if(!challenge.isFinished() && challenge.getChallengedUserID() == this.id){
                challenges.add(challenge);
            }
        }
        return challenges;
    }

    public List<Challenge> getWaitingChallengerChallenges(){
        List<Challenge> challenges = new ArrayList<>();
        for(Challenge challenge: getChallenges()){
            if(!challenge.isFinished() && challenge.getChallengerUserID() == this.id){
                challenges.add(challenge);
            }
        }
        return challenges;
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

    public String getPhotoURL() {
        return pictureURL;
    }

    // TODO get rid of public getter
    public String getPasswordSalt() {
        return passwordSalt;
    }

}
