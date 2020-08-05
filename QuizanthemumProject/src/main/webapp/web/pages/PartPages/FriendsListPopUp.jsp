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
    UsersManager usersManager = (UsersManager) mm.getManager(USERS_MANAGER_STR);
    User user = (User) request.getServletContext().getAttribute(LOGGED_IN_USER);
    if(user != null) { %>
        <div class="friends-list-popup" id="friends-list-popup-id">
            <div class="overlay"></div>
            <div class="content">
                <div class="close-btn" onclick="popUpFriendsList()">&times;</div>
                <h1 style="color:orange">მეგობრები</h1>
                <br>

                <%
                    for(int friendID : user.getFriendIDs()){
                        User friend = usersManager.getUser(friendID); %>

                        <div class = "friend-list-row">
                            <span class="nav-item" style="cursor: pointer;" onclick="displayProfile(<%=friend.getID()%>)">
                                <%=friend.getUsername()%>
                            </span>
                            <div class = "friend-challenge-remove-btns">
                                <button class="challenge-btn"  onclick="acceptFriendRequest(<%=friend.getID()%>)" style="color: green">დათანხმება</button>
                                <button class="remove-btn" onclick="rejectFriendRequest(<%=friend.getID()%>)" style="color: red">უარყოფა</button>
                            </div>
                        </div>



                    <% }
                %>



            </div>
        </div>

<% } %>

<script>
    function acceptFriendRequest(ID){
        console.log('acceptFriendRequest');
    }

    function rejectFriendRequst(ID){
        console.log('rejectFriendRequst');
    }

    function popUpFriendsList(){
        console.log('popUpFriendsList in FriendsListPopUp.jsp');
        document.getElementById("friends-list-popup-id").classList.toggle("active");
    }
</script>