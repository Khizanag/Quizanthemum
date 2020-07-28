package Controller.Classes.User;

import java.util.Date;

public class AchievementEvent {

    private final int id;
    private final int achievementID;
    private final int userID;
    private final Date achieveDate;

    public AchievementEvent(int id, int achievementID, int userID, Date achieveDate){
        this.id = id;
        this.achievementID = achievementID;
        this.userID = userID;
        this.achieveDate = achieveDate;
    }

    /* getter methods */

    public int getID() { return id; }

    public int getAchievementID() { return achievementID; }

    public int getUserID() { return userID; }

    public Date getAchieveDate() { return achieveDate; }

    @Override
    public String toString() {
        return "AchievementEvent{" +
                "id=" + id +
                ", achievementID=" + achievementID +
                ", userID=" + userID +
                ", achieveDate=" + achieveDate +
                '}';
    }
}
