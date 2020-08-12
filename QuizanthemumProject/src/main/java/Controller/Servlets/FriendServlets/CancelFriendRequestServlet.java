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

import static Configs.Config.*;
import static Configs.Config.DEFAULT_ID;

@WebServlet(name = "CancelFriendRequestServlet", urlPatterns = "/CancelFriendRequest")
public class CancelFriendRequestServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        FriendRequestsManager friendRequestsManager = (FriendRequestsManager) managersManager.getManager(FRIEND_REQUESTS_MANAGER_STR);
        String friendRequestIDAsString = request.getParameter("friend-request-id");
        int friendRequestID = Integer.parseInt(friendRequestIDAsString);
        FriendRequest friendRequest = friendRequestsManager.getFriendRequest(friendRequestID);

        friendRequestsManager.cancelRequest(friendRequest.getID());

        RequestDispatcher dispatcher = request.getRequestDispatcher("/Profile?id=" + friendRequest.getSenderID());
        dispatcher.forward(request, response);
    }
}
