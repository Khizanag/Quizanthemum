<%@ page import="Controller.Classes.User.User" %>
<%@ page import="java.util.List" %>
<%@ page import="Controller.Classes.OtherClasses.Challenge" %>
<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="static Configs.Config.MANAGERS_MANAGER_STR" %>
<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
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
    User user = (User) request.getServletContext().getAttribute("logedInUser");
    List<Challenge> waitingChallengedChallenges = (user == null) ? null : user.getWaitingChallengedChallenges();
    List<Challenge> waitingChallengerChallenges = (user == null) ? null : user.getWaitingChallengerChallenges();
%>

<% if(user != null) { %>

<div class="friends-list-popup" id="challenges-list-popup-id">
    <div class="overlay"></div>
    <div class="content">
        <div class="close-btn" onclick="popUpChallengesList()">&times;</div>
        <h1 style="color:orange">გამოწვევები</h1>

        <br>
        <h2 style="font-size: medium">მეტოქის მიერ შექმნილი მომლოდინე გამოწვევები:</h2>
        <br> <hr> <br>
        <%
            if( waitingChallengedChallenges != null){
            for(int i = 0; i < waitingChallengedChallenges.size(); i++){
                Challenge challenge = waitingChallengedChallenges.get(i);
                User challengerUser = challenge.getChallengerUser();
        %>
            <div class = "friend-list-row">
                <span><%=challengerUser.getUsername()%></span>
                <div class = "friend-challenge-remove-btns">
                    <button class="challenge-btn" id="challenge-btn-id-0_" onclick="acceptChallenge(this)" style="color: green">დათანხმება</button>
                    <button class="remove-btn" id="remove-btn-id-1_" onclick="rejectChallenge(this)" style="color: red">უარყოფა</button>
                </div>
            </div>
        <% } %>
        <%}%>

        <br> <br> <br>
        <h2 style="font-size: medium">მეტოქის მიერ შექმნილი მომლოდინე გამოწვევები:</h2>
        <br> <hr> <br>
        <%
            for(int i = 0; i < waitingChallengerChallenges.size(); i++){
                Challenge challenge = waitingChallengerChallenges.get(i);
                User challengerUser = challenge.getChallengedUser();
        %>
        <div class = "friend-list-row">
            <span><%=challengerUser.getUsername()%></span>
            <div class = "friend-challenge-remove-btns">
                <button class="challenge-btn" id="challenge-btn-id-1" onclick="acceptChallenge(this)" style="color: green">დათანხმება</button>
                <button class="remove-btn" id="remove-btn-id-1" onclick="rejectChallenge(this)" style="color: red">უარყოფა</button>
            </div>
        </div>
        <% } %>



    </div>
</div>
<% } %>

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
</script>