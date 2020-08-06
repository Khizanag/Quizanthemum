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
<%--<linkა rel="stylesheet" href="/web/styles/quizCreation.css">--%>
<link rel="stylesheet" href="/web/styles/scroll.css">

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

<div class="friends-list-popup" id="friend-requests-list-popup-id">
    <div class="overlay"></div>
    <div class="content">
        <div class="close-btn" onclick="popUpFriendRequestsList()">&times;</div>
        <h1 style="color:orange">'ვიმეგობროთ'ები</h1>
        <br>
        <h2 style="font-size: medium; padding: 5px; padding-top: 10px;">შემოთავაზებული 'ვიმეგობროთ'ები:</h2>
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
                        ქვიზი
                    </span>
            <div class = "friend-challenge-remove-btns">
                <button class="challenge-btn"  onclick="acceptChallenge(<%=challenge.getID()%>)" style="color: green">დათანხმება</button>
                <button class="remove-btn" onclick="rejectChallenge(<%=challenge.getID()%>)" style="color: red">უარყოფა</button>
            </div>
        </div>
        <% } %>
        <br>
        <br>
        <br>
        <h2 style="font-size: medium; padding: 5px; padding-top: 10px;">ჩემს მიერ შეთავაზებული 'ვიმეგობროთ'ები:</h2>
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
                        ქვიზი
                </span>
            <div class = "friend-challenge-remove-btns">
                <button class="remove-btn" onclick="cancelChallenge(<%=challenge.getID()%>)" style="color: red">გაუქმება</button>
            </div>
        </div>
        <% } %>

    </div>
</div>
<% } %>



<%-------------------------------- FORMS --------------------------------%>



<%-------------------------------- JAVASCRIPT --------------------------------%>

<script>

    function popUpFriendRequestsList(){
        console.log('popUpChallengesList in popUpChallengesList.jsp');
        document.getElementById("friend-requests-list-popup-id").classList.toggle("active");
    }

</script>