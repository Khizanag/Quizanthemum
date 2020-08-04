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

<jsp:include page="/web/pages/LogedInHandler.jsp"/>

<%
    ManagersManager mm = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
    UsersManager usersManager = (UsersManager)mm.getManager(USERS_MANAGER_STR);
    ChallengesManager challengesManager = (ChallengesManager) mm.getManager(CHALLENGE_MANAGER_STR);
    User user = (User) request.getServletContext().getAttribute("logedInUser");
%>

<% if(user != null) {
    List<Challenge> challenges = challengesManager.getChallengesOf(user.getID());
    user.setChallenges(challenges);
    List<Challenge> waitingChallengedChallenges = user.getWaitingChallengedChallenges();
    List<Challenge> waitingChallengerChallenges = user.getWaitingChallengerChallenges();
%>

    <div class="friends-list-popup" id="challenges-list-popup-id">
        <div class="overlay"></div>
        <div class="content">
            <div class="close-btn" onclick="popUpChallengesList()">&times;</div>
            <h1 style="color:orange">გამოწვევები</h1>
            <br>
            <h2 style="font-size: medium; padding: 5px; padding-top: 10px;">მეტოქის მიერ შექმნილი მომლოდინე გამოწვევები:</h2>
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
            <br>
            <h2 style="font-size: medium; padding: 5px; padding-top: 10px;">ჩემს მიერ შექმნილი მომლოდინე გამოწვევები:</h2>
            <br>
            <hr>
            <br>
            <%
                for(int i = 0; i < waitingChallengerChallenges.size(); i++){
                    Challenge challenge = waitingChallengerChallenges.get(i);
                    User challengedUser = challenge.getChallengedUser();
            %>
            <div class = "friend-list-row">
                <span class="nav-item" style="cursor: pointer;"><%=challengedUser.getUsername()%></span>
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

<form id="display-profile-form" action="../../Profile" method="get">
    <input type="hidden" id="user-id-holder" name="id">
</form>

<form id="display-quiz-form" action="QuizOverview" method="get">
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
        document.getElementById("challenges-list-popup-id").classList.toggle("active");
    }

    function displayProfile(userID){
        console.log("displayProfile");
        const form = document.getElementById('display-profile-form');
        document.getElementById('user-id-holder').value = userID;
        form.submit();
    }

    function displayQuiz(quizID){
        console.log('displayQuiz');
        const form = document.getElementById('display-quiz-form');
        document.getElementById('quiz-id-holder').value = quizID;
        form.submit();
    }

    function acceptChallenge(challengeID){
        console.log('acceptChallenge');
        const form = document.getElementById('accept-challenge-form');
        document.getElementById('challenge-id-holder-in-accept-form').value = challengeID;
        form.submit();
    }

    function rejectChallenge(challengeID){
        console.log("rejectChallenge");
        const form = document.getElementById('reject-challenge-form');
        document.getElementById('challenge-id-holder-in-reject-form').value = challengeID;
        form.submit();
    }

    function  cancelChallenge(challengeID){
        console.log("cancelChallenge");
        const form = document.getElementById('cancel-challenge-form');
        document.getElementById('challenge-id-holder-in-cancel-form').value = challengeID;
        form.submit();
    }
</script>