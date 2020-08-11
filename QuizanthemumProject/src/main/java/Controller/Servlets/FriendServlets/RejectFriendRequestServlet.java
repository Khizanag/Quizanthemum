package Controller.Servlets.FriendServlets;

import Controller.Classes.OtherClasses.FriendRequest;
import Model.Managers.FriendRequestsManager;
import Model.Managers.ManagersManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.concurrent.ForkJoinPool;

import static Configs.Config.FRIENDSHIPS_MANAGER_STR;
import static Configs.Config.MANAGERS_MANAGER_STR;

@WebServlet(name = "RejectFriendRequestServlet", urlPatterns = "/RejectFriendRequest")
public class RejectFriendRequestServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("RejectFriendRequestServlet");

        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        FriendRequestsManager friendRequestsManager = (FriendRequestsManager) managersManager.getManager(FRIENDSHIPS_MANAGER_STR);
        int friendRequestID = Integer.parseInt(request.getParameter("friend-request-id"));
        FriendRequest friendRequest = friendRequestsManager.getFriendRequest(friendRequestID);
        friendRequest.receive(false);
        friendRequestsManager.commitFriendRequestReceive(friendRequest);

        request.setAttribute("is-friend-request-accept", true);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/Profile?id=" + friendRequest.getReceiverID());
        dispatcher.forward(request, response);
    }
}
