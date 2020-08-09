package Controller.Servlets.ChallengeServlets;

import Controller.Classes.OtherClasses.Challenge;
import Model.Managers.ChallengesManager;
import Model.Managers.ManagersManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static Configs.Config.*;

@WebServlet(name = "RejectChallengeServlet", urlPatterns = "/RejectChallenge")
public class RejectChallengeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        ChallengesManager challengesManager = (ChallengesManager) managersManager.getManager(CHALLENGE_MANAGER_STR);
        int challengeID = Integer.parseInt(request.getParameter("id"));
        challengesManager.deleteChallenge(challengeID);
        request.getSession().setAttribute(DISPLAY_CHALLENGES, true);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/");
        dispatcher.forward(request, response);
    }
}
