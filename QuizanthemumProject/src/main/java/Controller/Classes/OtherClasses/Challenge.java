package Controller.Classes.OtherClasses;

import Configs.Config;
import Controller.Classes.Quiz.QuizEvent;
import Model.Managers.ChallengeManager;
import Model.Managers.QuizEventManager;
import Model.Managers.QuizManager;
import Model.Managers.UserManager;

import java.sql.Date;

public class Challenge implements Config {

    private int ID;
    private boolean isFinished;
    private int winnerUserID;
    private final ChallengeManager manager;

    // challenger info
    private final int challengerUserID;
    private User challengerUser;
    private final int challengerQuizEventID;
    private QuizEvent challengerQuizEvent;
    private final Date challengingDate;

    // challenged user info
    private final int challengedUserID;
    private final int challengedQuizEventID;
    private  User challengedUser;
    private QuizEvent challengedQuizEvent;
    private Date acceptingDate;

    public Challenge(int ID, int challengerUserID, int challengedUserID, int challengerQuizEventID, int challengedQuizEventID,
                     boolean isFinished, int winnerUserID, Date challengingDate, Date acceptingDate, ChallengeManager manager){
        this.ID = ID;
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
    public Challenge(int challengerUserID, int challengedUserID, int challengerQuizEventID, int challengedQuizEventID,
                     Date challengingDate, ChallengeManager manager){
        this(-1, challengerUserID, challengedUserID, challengerQuizEventID, challengedQuizEventID,
                false, -1, challengingDate, null, manager);
    }

    /**************** Getter methods ****************/

    public int getID() {
        return ID;
    }

    public int getWinnerUserID() {
        return winnerUserID;
    }

    public ChallengeManager getManager() {
        return manager;
    }

    public int getChallengerUserID() {
        return challengerUserID;
    }

    public User getChallengerUser(){
        if(challengerUser == null) {
            UserManager userManager = (UserManager) manager.getContext().getAttribute(USER_MANAGER_STR);
            challengerUser = userManager.getUser(challengerUserID);
        }
        return challengerUser;
    }

    public User getChallengedUser(){
        if(challengedUser == null) {
            UserManager userManager = (UserManager) manager.getContext().getAttribute(USER_MANAGER_STR);
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
            QuizEventManager quizEventManager = (QuizEventManager) manager.getContext().getAttribute(QUIZ_EVENT_MANAGER_STR);
            challengerQuizEvent = quizEventManager.getQuizEvent(challengerUserID);
        }
        return challengerQuizEvent;
    }

    public QuizEvent getChallengedQuizEvent() {
        if(challengerQuizEvent == null) {
            QuizEventManager quizEventManager = (QuizEventManager) manager.getContext().getAttribute(QUIZ_EVENT_MANAGER_STR);
            challengedQuizEvent = quizEventManager.getQuizEvent(challengedUserID);
        }
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

    public void accept(Date acceptingDate){
        this.isFinished = true;
        this.acceptingDate = acceptingDate;

        // TODO change in database
    }

}
