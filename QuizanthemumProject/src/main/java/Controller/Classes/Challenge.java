package Controller.Classes;

import Controller.Classes.Users.User;

import java.util.Date;

public class Challenge {

    private User challenger;
    private User challenged;
    private Date challengingDate;

    public Challenge(User challenger, User challenged, Date challengingDate){
        this.challenger = challenger;
        this.challenged = challenged;
        this.challengingDate = challengingDate;
    }


}
