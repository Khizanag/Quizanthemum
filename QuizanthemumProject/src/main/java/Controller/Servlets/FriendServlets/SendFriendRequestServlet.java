package Controller.Servlets.FriendServlets;

import Controller.Classes.OtherClasses.FriendRequest;
import Controller.Classes.User.User;
import Model.Managers.CategoriesManager;
import Model.Managers.FriendRequestsManager;
import Model.Managers.ManagersManager;
import Model.Managers.QuizManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static Configs.Config.*;

@WebServlet(name = "SendFriendRequestServlet", urlPatterns = "/SendFriendRequest")
public class SendFriendRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        FriendRequestsManager friendRequestsManager = (FriendRequestsManager) managersManager.getManager(FRIEND_REQUESTS_MANAGER_STR);
        String url = (String) request.getParameter("url");
        User loggedUser = (User) request.getServletContext().getAttribute(LOGGED_IN_USER);
        int senderID = loggedUser.getID();
        int receiverID = Integer.parseInt(request.getParameter("user-id"));
        FriendRequest friendRequest = new FriendRequest(senderID, receiverID, friendRequestsManager);
        friendRequestsManager.insertFriendRequest(friendRequest);

        request.getSession().setAttribute(DISPLAY_FRIEND_REQUESTS, true);

        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", url);
    }
}