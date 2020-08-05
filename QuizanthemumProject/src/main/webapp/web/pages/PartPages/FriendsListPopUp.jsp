<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="static Configs.Config.MANAGERS_MANAGER_STR" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page import="Controller.Classes.User.User" %>
<%@ page import="static Configs.Config.*" %>
<%@ page import="Model.Managers.ChallengesManager" %>
<%@ page import="Controller.Classes.OtherClasses.Challenge" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Managers.FriendshipsManager" %>
<%--
  Created by IntelliJ IDEA.
  User: gigakhizanishvili
  Date: 7/29/20
  Time: 06:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ManagersManager mm = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
    FriendshipsManager friendshipsManager = (FriendshipsManager) mm.getManager(FRIENDSHIPS_MANAGER_STR);
    User user = (User) request.getServletContext().getAttribute(LOGGED_IN_USER);
    if(user != null) {
        List<User> friends = friendshipsManager.getFriendsOf(user.getID());
    }
%>

<div class="friends-list-popup" id="friends-list-popup-id">
    <div class="overlay"></div>
    <div class="content">
        <div class="close-btn" onclick="popUpFriendsList()">&times;</div>
        <h1 style="color:orange">მეგობრები</h1>
        <br>



    </div>
</div>

<script>
    function popUpFriendsList(){
        console.log('popUpFriendsList in FriendsListPopUp.jsp');
        document.getElementById("friends-list-popup-id").classList.toggle("active");
    }
</script>