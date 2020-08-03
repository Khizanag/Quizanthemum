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
    List<Challenge> waitingChallengedChallenges = (user == null) ? null : user.getWaitingChallengedChallenges();
    List<Challenge> waitingChallengerChallenges = (user == null) ? null : user.getWaitingChallengerChallenges();
%>

    <div class="friends-list-popup" id="challenges-list-popup-id">
        <div class="overlay"></div>
        <div class="content">
            <div class="close-btn" onclick="popUpChallengesList()">&times;</div>
            <h1 style="color:orange">გამოწვევები</h1>

            <br>
            <h2 style="font-size: medium; padding: 5px; padding-top: 10px;">მეტოქის მიერ შექმნილი მომლოდინე გამოწვევები:</h2>
            <br> <hr> <br>
            <%
                for(int i = 0; i < waitingChallengedChallenges.size(); i++){
                    Challenge challenge = waitingChallengedChallenges.get(i);
                    User challengerUser = challenge.getChallengerUser();
            %>
                <div class = "friend-list-row">
                <span class="nav-item" style="cursor: pointer;"><%=challengerUser.getUsername()%></span>
                <div class = "friend-challenge-remove-btns">
                    <button class="challenge-btn" id="challenge-btn-id-0_" onclick="acceptChallenge(this)" style="color: green">დათანხმება</button>
                    <button class="remove-btn" id="remove-btn-id-1_" onclick="rejectChallenge(this)" style="color: red">უარყოფა</button>
                </div>
            </div>
        <% } %>


            <br> <br> <br> <br>
            <h2 style="font-size: medium; padding: 5px; padding-top: 10px;">ჩემს მიერ შექმნილი მომლოდინე გამოწვევები:</h2>
            <br> <hr> <br>
            <%
                for(int i = 0; i < waitingChallengerChallenges.size(); i++){
                    Challenge challenge = waitingChallengerChallenges.get(i);
                    User challengerUser = challenge.getChallengedUser();
            %>
            <div class = "friend-list-row">
                <span class="nav-item" style="cursor: pointer;"><%=challengerUser.getUsername()%></span>
                <div class = "friend-challenge-remove-btns">
                    <button class="remove-btn" value="<%=challenge.getID()%>" onclick="abolishMyChallenge(this)" style="color: red">გაუქმება</button>
                </div>
            </div>
            <% } %>

        </div>
    </div>
<% } %>

<form id="abolish-my-challenge-form" action="RejectMyChallenge" method="get">
    <input type="hidden" name="url" id="url-hidden-variable" value="TODO">
    <input type="hidden" name="challenge-id" id="abolish-my-challenge-form-challenge-id" value="-1">
</form>

<script>
    function popUpChallengesList(){
        console.log("popUpChallengesList");
        document.getElementById("challenges-list-popup-id").classList.toggle("active");
    }

    function acceptChallenge(btn){
        console.log("acceptChallenge");
    }

    function rejectChallenge(btn){
        console.log("rejectChallenge");
    }

    function  abolishMyChallenge(btn){
        console.log("abolishMyChallenge");
        // document.getElementById("url-hidden-variable").value = ;
        document.getElementById("abolish-my-challenge-form-challenge-id").value = btn.value;
        console.log("challenge-id" + btn.value);
        document.getElementById("abolish-my-challenge-form").submit();
    }
</script>