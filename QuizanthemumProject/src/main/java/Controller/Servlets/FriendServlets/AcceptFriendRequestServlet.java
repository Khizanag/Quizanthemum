package Controller.Servlets.FriendServlets;

import Controller.Classes.OtherClasses.FriendRequest;
import Controller.Classes.User.Friendship;
import Model.Managers.FriendRequestsManager;
import Model.Managers.FriendshipsManager;
import Model.Managers.ManagersManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.concurrent.ForkJoinPool;

import static Configs.Config.*;

@WebServlet(name = "AcceptFriendRequestServlet", urlPatterns = "/AcceptFriendRequest")
public class AcceptFriendRequestServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("AcceptFriendRequestServlet");

        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        FriendRequestsManager friendRequestsManager = (FriendRequestsManager) managersManager.getManager(FRIEND_REQUESTS_MANAGER_STR);
        String friendRequestIDAsString = request.getParameter("friend-request-id");
        System.out.println("friendRequestIDAsString: " + friendRequestIDAsString);
        int friendRequestID = Integer.parseInt(friendRequestIDAsString);
        System.out.println("friendRequestID: " + friendRequestID);
        FriendRequest friendRequest = friendRequestsManager.getFriendRequest(friendRequestID);
        friendRequest.receive(true);
        friendRequestsManager.commitFriendRequestReceive(friendRequest);

        FriendshipsManager friendshipsManager = (FriendshipsManager) managersManager.getManager(FRIENDSHIPS_MANAGER_STR);
        friendshipsManager.insertFriendship(new Friendship(DEFAULT_ID, friendRequest.getSenderID(), friendRequest.getReceiverID(), new Date(),  friendshipsManager));

        request.setAttribute("is-friend-request-accept", true);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/Profile?id=" + friendRequest.getReceiverID());
        dispatcher.forward(request, response);
    }
}
