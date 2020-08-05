package Controller.Classes.User;

import Model.Managers.FriendshipsManager;

import java.util.Date;

public class Friendship {

    private int ID;
    private int firstFriendID;
    private int secondFriendID;
    private Date makeFriendDate;
    private FriendshipsManager manager;

    public Friendship(int ID, int firstFriendID, int secondFriendID, Date makeFriendDate, FriendshipsManager friendshipsManager){
        this.ID = ID;
        this.firstFriendID = firstFriendID;
        this.secondFriendID = secondFriendID;
        this.makeFriendDate = makeFriendDate;
        this.manager = friendshipsManager;
    }

    public int getID() {
        return ID;
    }

    public int getFirstFriendID() {
        return firstFriendID;
    }

    public int getSecondFriendID() {
        return secondFriendID;
    }

    public Date getMakeFriendDate() {
        return makeFriendDate;
    }


    public FriendshipsManager getManager() {
        return manager;
    }

    /******************** SETTER methods ********************/

    public void setID(int ID){
        this.ID = ID;
    }

    public void setMakeFriendDate(Date makeFriendDate){
        this.makeFriendDate = makeFriendDate;
    }

}
