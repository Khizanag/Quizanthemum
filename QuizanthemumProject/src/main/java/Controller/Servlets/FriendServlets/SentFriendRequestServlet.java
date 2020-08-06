package Controller.Servlets.FriendServlets;

import Controller.Classes.OtherClasses.FriendRequest;
import Model.Managers.CategoriesManager;
import Model.Managers.FriendRequestsManager;
import Model.Managers.ManagersManager;
import Model.Managers.QuizManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static Configs.Config.*;

@WebServlet(name = "SentFriendRequestServlet", urlPatterns = "/SentFriendRequst")
public class SentFriendRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        FriendRequestsManager friendRequestsManager = (FriendRequestsManager) managersManager.getManager(FRIEND_REQUESTS_MANAGER_STR);
        int senderID = (int) request.getServletContext().getAttribute(LOGGED_IN_USER);
        int receiverID = Integer.parseInt(request.getParameter("user-id"));
        FriendRequest friendRequest = new FriendRequest(senderID, receiverID, friendRequestsManager);
        friendRequestsManager.insertFriendRequest(friendRequest);
    }
}
