    <%@ page import="Controller.Classes.User.User" %>
<%@ page import="java.util.List" %>
<%@ page import="Controller.Classes.OtherClasses.Challenge" %>
<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="static Configs.Config.MANAGERS_MANAGER_STR" %>
<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page import="Model.Managers.ChallengesManager" %>
<%@ page import="static Configs.Config.*" %>
<%--
  Created by IntelliJ IDEA.
  User: gigakhizanishvili
  Date: 8/2/20
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="icon" type="image/png" href="web/images/common/icon.png"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/web/styles/common.css">
<%--<link rel="stylesheet" href="/web/styles/homePage.css">--%>
<link rel="stylesheet" href="/web/styles/breakpoints.css">
<%--<link rel="stylesheet" href="/web/styles/profilePage.css">--%>
<%--<link rel="stylesheet" href="/web/styles/quizCreation.css">--%>

<jsp:include page="/web/pages/LogedInHandler.jsp"/>

<%
    ManagersManager mm = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
    UsersManager usersManager = (UsersManager)mm.getManager(USERS_MANAGER_STR);
    ChallengesManager challengesManager = (ChallengesManager) mm.getManager(CHALLENGE_MANAGER_STR);
    User user = (User) request.getServletContext().getAttribute(LOGGED_IN_USER);
    if(user != null) {
        List<Challenge> challenges = challengesManager.getChallengesOf(user.getID());
        user.setChallenges(challenges);
        List<Challenge> waitingChallengedChallenges = user.getWaitingChallengedChallenges();
        List<Challenge> waitingChallengerChallenges = user.getWaitingChallengerChallenges();
%>

<div class="friends-list-popup" id="challenges-list-popup-id">
    <div class="overlay"></div>
    <div class="content">
        <div class="close-btn" onclick="popUpChallengesList()">&times;</div>
        <h1 style="color:orange">Challenges</h1>
        <br>
        <h2 style="font-size: medium; padding: 5px; padding-top: 10px;">Challenges Waiting for me :</h2>
        <br>
        <hr>
        <br>
        <%
            for(int i = 0; i < waitingChallengedChallenges.size(); i++){
                Challenge challenge = waitingChallengedChallenges.get(i);
                User challengerUser = challenge.getChallengerUser();
        %>
        <div class = "friend-list-row">
                    <span class="nav-item" style="cursor: pointer;" onclick="displayProfile(<%=challengerUser.getID()%>)">
                        <%=challengerUser.getUsername()%>
                    </span>
            <span class="nav-item" style="cursor: pointer;" onclick="displayQuiz(<%=challenge.getQuizID()%>)">
                        Quizz
                    </span>
            <div class = "friend-challenge-remove-btns">
                <button class="challenge-btn"  onclick="acceptChallenge(<%=challenge.getID()%>)" style="color: green">Accept</button>
                <button class="remove-btn" onclick="rejectChallenge(<%=challenge.getID()%>)" style="color: red">Reject</button>
            </div>
        </div>
        <% } %>
        <br>
        <br>
        <br>
        <h2 style="font-size: medium; padding: 5px; padding-top: 10px;">Awaiting challenges created by Me:</h2>
        <br>
        <hr>
        <br>
        <%
            for(int i = 0; i < waitingChallengerChallenges.size(); i++){
                Challenge challenge = waitingChallengerChallenges.get(i);
                User challengedUser = challenge.getChallengedUser();
        %>
        <div class = "friend-list-row">
                <span class="nav-item" style="cursor: pointer;" onclick="displayProfile(<%=challengedUser.getID()%>)">
                    <%=challengedUser.getUsername()%>
                </span>
            <span class="nav-item" style="cursor: pointer;" onclick="displayQuiz(<%=challenge.getQuizID()%>)">
                        Quizz
                </span>
            <div class = "friend-challenge-remove-btns">
                <button class="remove-btn" onclick="cancelChallenge(<%=challenge.getID()%>)" style="color: red">Cancel</button>
            </div>
        </div>
        <% } %>

    </div>
</div>
<% } %>



<%-------------------------------- FORMS --------------------------------%>

<form id="display-profile-form" action="Profile" method="get">
    <input type="hidden" id="user-id-holder" name="id">
</form>

<form id="display-quiz-form" action="Quiz" method="get">
    <input type="hidden"  id="quiz-id-holder" name="id">
</form>

<form id="accept-challenge-form" action="AcceptChallenge" method="get">
    <input type="hidden" id="challenge-id-holder-in-accept-form" name="id">
</form>

<form id="reject-challenge-form" action="RejectChallenge" method="get">
    <input type="hidden" id="challenge-id-holder-in-reject-form" name="id">
</form>

<form id="cancel-challenge-form" action="CancelChallenge" method="get">
    <input type="hidden" id="challenge-id-holder-in-cancel-form" name="id">
</form>



<%-------------------------------- JAVASCRIPT --------------------------------%>

<script>

    function popUpChallengesList(){
        console.log('popUpChallengesList in popUpChallengesList.jsp');
        document.getElementById("challenges-list-popup-id").classList.toggle("active");
    }

    function displayProfile(userID){
        const form = document.getElementById('display-profile-form');
        document.getElementById('user-id-holder').value = userID;
        form.submit();
    }

    function displayQuiz(quizID){
        const form = document.getElementById('display-quiz-form');
        document.getElementById('quiz-id-holder').value = quizID;
        form.submit();
    }

    function acceptChallenge(challengeID){
        const form = document.getElementById('accept-challenge-form');
        document.getElementById('challenge-id-holder-in-accept-form').value = challengeID;
        form.submit();
    }

    function rejectChallenge(challengeID){
        const form = document.getElementById('reject-challenge-form');
        document.getElementById('challenge-id-holder-in-reject-form').value = challengeID;
        form.submit();
    }

    function  cancelChallenge(challengeID){
        const form = document.getElementById('cancel-challenge-form');
        document.getElementById('challenge-id-holder-in-cancel-form').value = challengeID;
        form.submit();
    }
</script>