package Controller.OtherClasses;

import java.util.Date;

public class AchievementEvent {

    private final int id;
    private final Achievement achievement;
    private final User user;
    private final Date achieveDate;

    public AchievementEvent(int id, Achievement achievement, User user, Date achieveDate){
        this.id = id;
        this.achievement = achievement;
        this.user = user;
        this.achieveDate = achieveDate;
    }

    /* getter methods */

    public int getId() { return id; }

    public Achievement getAchievement() { return achievement; }

    public User getUser() { return user; }

    public Date getAchieveDate() { return achieveDate; }
}
