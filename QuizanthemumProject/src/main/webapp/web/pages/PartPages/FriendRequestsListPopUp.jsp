<%@ page import="Controller.Classes.User.User" %>
<%@ page import="java.util.List" %>
<%@ page import="Controller.Classes.OtherClasses.Challenge" %>
<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="static Configs.Config.MANAGERS_MANAGER_STR" %>
<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page import="Model.Managers.ChallengesManager" %>
<%@ page import="static Configs.Config.*" %>
<%@ page import="Model.Managers.FriendRequestsManager" %>
<%@ page import="Controller.Classes.OtherClasses.FriendRequest" %>
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

<jsp:include page="/web/pages/LogedInHandler.jsp"/>

<%
    ManagersManager mm = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
    UsersManager usersManager = (UsersManager)mm.getManager(USERS_MANAGER_STR);
    FriendRequestsManager friendRequestsManager = (FriendRequestsManager) mm.getManager(FRIEND_REQUESTS_MANAGER_STR);
    User user = (User) request.getServletContext().getAttribute(LOGGED_IN_USER);
    if(user != null) {
        List<FriendRequest> sentFriendRequests = friendRequestsManager.getWaitingSentFriendRequests(user.getID());
        List<FriendRequest> receivedFriendRequests = friendRequestsManager.getWaitingReceivedFriendRequests(user.getID());
%>

<div class="friends-list-popup" id="friend-requests-list-popup-id">
    <div class="overlay"></div>
    <div class="content">
        <div class="close-btn" onclick="popUpFriendRequestsList()">&times;</div>
        <h1 style="color:orange">Friend Requests</h1>
        <br>
        <h2 style="font-size: medium; padding: 5px; padding-top: 10px;">Requests Sent to Me:</h2>
        <br>
        <hr>
        <br>
        <%
            for(int i = 0; i < receivedFriendRequests.size(); i++){
                FriendRequest friendRequest = receivedFriendRequests.get(i);
                User userWhoSent = usersManager.getUser(friendRequest.getSenderID());
        %>
        <div class = "friend-list-row">
            <span class="nav-item"  style="cursor: pointer;" onclick="displayProfile(<%=userWhoSent.getID()%>)">
                <%=userWhoSent.getUsername()%>
            </span>
            <div class = "friend-challenge-remove-btns">
                <button class="challenge-btn"  onclick="acceptFriendRequest(<%=friendRequest.getID()%>,this)" style="color: green">Accept</button>
                <button class="remove-btn" onclick="rejectFriendRequest(<%=friendRequest.getID()%>,this)" style="color: red">Reject</button>
            </div>
        </div>
        <% } %>
        <br>
        <br>
        <br>
        <h2 style="font-size: medium; padding: 5px; padding-top: 10px;">My Sent friend requests:</h2>
        <br>
        <hr>
        <br>
        <%
            for(int i = 0; i < sentFriendRequests.size(); i++){
                FriendRequest friendRequest = sentFriendRequests.get(i);
                User userWhoReceived = usersManager.getUser(friendRequest.getReceiverID());
        %>
        <div class = "friend-list-row">
                <span class="nav-item" style="cursor: pointer;" onclick="displayProfile(<%=userWhoReceived.getID()%>)">
                    <%=userWhoReceived.getUsername()%>
                </span>
            <div class = "friend-challenge-remove-btns">
                <button class="remove-btn" onclick="cancelChallenge(<%=friendRequest.getID()%>,this)" style="color: red">Cancel</button>
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

    function acceptFriendRequest(ID,ob){
        console.log('acceptFriendRequest');
        $(ob).parent().parent().remove();

    }

    function rejectFriendRequest(ID,ob){
        console.log('rejectFriendRequst');
        $(ob).parent().parent().remove();

    }
    function cancelChallenge(ID,ob){
        $(ob).parent().parent().remove();
    }


</script>