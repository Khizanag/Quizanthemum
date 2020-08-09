package Controller.Classes.OtherClasses;

import Configs.FriendRequestsTableConfig;
import Model.Managers.FriendRequestsManager;
import Model.Managers.FriendshipsManager;

import java.util.Date;

import static Configs.Config.DEFAULT_ID;

public class FriendRequest {

    private int ID;
    private final int senderID;
    private final int receiverID;
    private final Date sendingDate;
    private Date receivingDate;
    private boolean isReceived;
    private boolean isAccepted;

    private FriendRequestsManager manager;

    public FriendRequest(int senderID, int receiverID, FriendRequestsManager manager){
        this(DEFAULT_ID, senderID, receiverID, new Date(), null, false, false, manager);
    }

    public FriendRequest(int ID, int senderID, int receiverID, Date sendingDate, Date receivingDate,
                         boolean isReceived, boolean isAccepted, FriendRequestsManager manager){
        this.ID = ID;
        this.senderID = senderID;
        this.receiverID = receiverID;
        this.sendingDate = sendingDate;
        this.receivingDate = receivingDate;
        this.isReceived = isReceived;
        this.isAccepted = isAccepted;
        this.manager = manager;
    }

    public FriendRequest(int senderID, int receiverID, Date sendingDate, FriendRequestsManager manager){
        this(DEFAULT_ID, senderID, receiverID, sendingDate, null, false, false, manager);
    }

    /*************** GETTER methods ***************/

    public int getID(){ return this.ID; }

    public int getSenderID(){ return this.senderID; }

    public int getReceiverID(){ return this.receiverID; }

    public Date getSendingDate() { return sendingDate; }

    public Date getReceivingDate() { return receivingDate; }

    public boolean isReceived() { return isReceived; }

    public boolean isAccepted() { return isAccepted; }



    /*************** SETTER methods ***************/

    public void setID(int ID) { this.ID = ID; }


    public void receive(boolean isAccepted){
        this.isReceived = true;
        this.isAccepted = isAccepted;
        this.receivingDate = new Date();
        manager.commitFriendRequestReceive(this);
    }

}
