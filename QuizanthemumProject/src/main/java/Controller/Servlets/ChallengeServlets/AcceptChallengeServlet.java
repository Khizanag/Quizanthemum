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

import static Configs.Config.CHALLENGE_MANAGER_STR;
import static Configs.Config.MANAGERS_MANAGER_STR;

@WebServlet(name = "AcceptChallengeServlet", urlPatterns = "/AcceptChallenge")
public class AcceptChallengeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        ChallengesManager challengesManager = (ChallengesManager) managersManager.getManager(CHALLENGE_MANAGER_STR);
        System.out.println("id = " + request.getParameter("id"));
        int challengeID = Integer.parseInt(request.getParameter("id"));
        Challenge challenge = challengesManager.getChallenge(challengeID);
        request.getSession().setAttribute("challenge-id", challengeID);

//        request.setAttribute("challenge-id", challengeID);

        response.setStatus(HttpServletResponse.SC_FOUND);//302
        response.setHeader("Location", "http://localhost:8080/Quiz?id=" + challenge.getQuizID());
    }
}
