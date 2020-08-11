package Controller.Classes.OtherClasses;

import Configs.Config;
import Controller.Classes.Quiz.QuizEvent;
import Controller.Classes.User.User;
import Model.Managers.ChallengesManager;
import Model.Managers.QuizEventManager;
import Model.Managers.UsersManager;

import java.util.Date;

public class Challenge implements Config {

    private int ID;
    private int quizID;
    private boolean isFinished;
    private int winnerUserID;
    private final ChallengesManager manager;

    // challenger info
    private final int challengerUserID;
    private User challengerUser;
    private int challengerQuizEventID;
    private QuizEvent challengerQuizEvent;
    private final Date challengingDate;

    // challenged user info
    private final int challengedUserID;
    private int challengedQuizEventID;
    private  User challengedUser;
    private QuizEvent challengedQuizEvent;
    private Date acceptingDate;

    public Challenge(int ID, int quizID, int challengerUserID, int challengedUserID, int challengerQuizEventID, int challengedQuizEventID,
                     boolean isFinished, int winnerUserID, Date challengingDate, Date acceptingDate, ChallengesManager manager){
        this.ID = ID;
        this.quizID = quizID;
        this.challengerUserID = challengerUserID;
        this.challengedUserID = challengedUserID;
        this.challengerQuizEventID = challengerQuizEventID;
        this.challengedQuizEventID = challengedQuizEventID;
        this.isFinished = isFinished;
        this.winnerUserID = winnerUserID;
        this.challengingDate = challengingDate;
        this.acceptingDate = acceptingDate;
        this.manager = manager;
    }

    /* this constructor could be called immediately after user challenges someone and it is not accepted yet */
    public Challenge(int quizID, int challengerUserID, int challengedUserID, int challengerQuizEventID, int challengedQuizEventID,
                     Date challengingDate, ChallengesManager manager){
        this(-1, quizID, challengerUserID, challengedUserID, challengerQuizEventID, challengedQuizEventID,
                false, -1, challengingDate, null, manager);
    }

    /**************** Getter methods ****************/

    public int getID() {
        return ID;
    }

    public int getQuizID(){ return this.quizID; }

    public int getWinnerUserID() {
        return winnerUserID;
    }

    public ChallengesManager getManager() {
        return manager;
    }

    public int getChallengerUserID() {
        return challengerUserID;
    }

    public User getChallengerUser(){
        if(challengerUser == null) {
            UsersManager userManager = (UsersManager) manager.getManager().getManager(USERS_MANAGER_STR);
            challengerUser = userManager.getUser(challengerUserID);
        }
        return challengerUser;
    }

    public User getChallengedUser(){
        if(challengedUser == null) {
            UsersManager userManager = (UsersManager) manager.getManager().getManager(USERS_MANAGER_STR);
            challengedUser = userManager.getUser(challengedUserID);
        }
        return challengedUser;
    }

    public int getChallengedUserID() {
        return challengedUserID;
    }

    public int getChallengerQuizEventID() {
        return challengerQuizEventID;
    }

    public int getChallengedQuizEventID() {
        return challengedQuizEventID;
    }

    public QuizEvent getChallengerQuizEvent() {
        if(challengerQuizEvent == null) {
            QuizEventManager quizEventManager = (QuizEventManager) manager.getManager().getManager(QUIZ_EVENT_MANAGER_STR);
//            System.out.println("challengerUserID : " + challengerUserID);
            challengerQuizEvent = quizEventManager.getQuizEvent(challengerQuizEventID);
        }
        return challengerQuizEvent;
    }

    public QuizEvent getChallengedQuizEvent() {
        if(challengedQuizEvent == null) {
//            System.out.println("challengedQuizEvent is null in getChallengedQuizEvent");
            QuizEventManager quizEventManager = (QuizEventManager) manager.getManager().getManager(QUIZ_EVENT_MANAGER_STR);
            challengedQuizEvent = quizEventManager.getQuizEvent(challengedQuizEventID);
        }
//        System.out.println("return challengedQuizEvent");
        return challengedQuizEvent;
    }

    public Date getChallengingDate() {
        return challengingDate;
    }

    public Date getAcceptingDate(){
        return acceptingDate;
    }

    public boolean isFinished(){
        return isFinished;
    }

    public boolean isAccepted(){ return this.acceptingDate != null; }


    public void setChallengedQuizEvent(QuizEvent challengedQuizEvent) {
        this.challengedQuizEvent = challengedQuizEvent;
        this.challengedQuizEventID = challengedQuizEvent.getId();
    }

    public void setChallengerQuizEvent(QuizEvent challengerQuizEvent) {
        this.challengerQuizEvent = challengerQuizEvent;
        this.challengerQuizEventID = challengerQuizEvent.getId();
    }

    public void accept(){
        this.acceptingDate = new Date();
    }

    public void finish(){
        this.isFinished = true;
        getChallengerQuizEvent().getUserScore();
        getChallengedQuizEvent().getUserScore();
        if(getChallengerQuizEvent().getUserScore() > getChallengedQuizEvent().getUserScore())
            this.winnerUserID = getChallengerUserID();
        else
            this.winnerUserID = getChallengedUserID();

    }

    @Override
    public String toString() {
        return "Challenge{" +
                "ID=" + ID +
                ", isFinished=" + isFinished +
                ", winnerUserID=" + winnerUserID +
                ", manager=" + manager +
                ", challengerUserID=" + challengerUserID +
                ", challengerUser=" + challengerUser +
                ", challengerQuizEventID=" + challengerQuizEventID +
                ", challengerQuizEvent=" + challengerQuizEvent +
                ", challengingDate=" + challengingDate +
                ", challengedUserID=" + challengedUserID +
                ", challengedQuizEventID=" + challengedQuizEventID +
                ", challengedUser=" + challengedUser +
                ", challengedQuizEvent=" + challengedQuizEvent +
                ", acceptingDate=" + acceptingDate +
                '}';
    }
}