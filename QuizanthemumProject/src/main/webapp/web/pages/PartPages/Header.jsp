<%@ page import="Controller.Classes.User.User" %>
<%@ page import="static Configs.Config.LOGGED_IN_USER" %>
<%@ page import="static Configs.Config.DISPLAY_CHALLENGES" %>
<%@ page import="static Configs.Config.*" %>
<%@ page import="Model.Managers.UsersManager" %>

<%--
  Created by IntelliJ IDEA.
  User: gigakhizanishvili
  Date: 7/27/20
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="icon" type="image/png" href="/web/images/common/icon.png"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/web/styles/common.css">
<link rel="stylesheet" href="/web/styles/homePage.css">
<link rel="stylesheet" href="/web/styles/breakpoints.css">
<link rel="stylesheet" href="/web/styles/profilePage.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Rowdies:wght@700&display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>
<%
    response.setHeader("Content-Type", "text/xml; charset=UTF-8");
    User user = (User) request.getServletContext().getAttribute(LOGGED_IN_USER);
    UsersManager usersManager = (UsersManager) request.getServletContext().getAttribute(USERS_MANAGER_STR);
%>

<jsp:include page="/web/pages/PartPages/ChallengesListPopUp.jsp"/>
<jsp:include page="/web/pages/PartPages/FriendsListPopUp.jsp"/>
<jsp:include page="/web/pages/PartPages/ChallengesListPopUp.jsp"/>
<jsp:include page="/web/pages/PartPages/FriendRequestsListPopUp.jsp"/>

<header class= "header-section">
    <div class="container header">
        <div class="header-left" style="cursor: pointer;" onclick="openMainPage()">
            <img class="logo" src="/web/images/common/icon.png">
            <h1 class="logo-text">Quizanthemum</h1>
        </div>
        <% if(user == null){ %>
        <ul class="header-right">
            <button class="log-in-button button logIn" onclick="openRegistration()" style="margin-top: 0;">Login</button>
        </ul>
        <% } else { %>
        <ul class="header-right">
            <img class = "profile-picture right-menu" id="small-prof-pic-id"
                 src = "<%=usersManager.getProfilePicture(user.getID())%>"
                onerror="this.src='/web/images/common/defProfPic.jpg';" href=""onclick="openSidebar()">
            <span class = "profile-name-text" onclick="openSidebar()"><%=user.getUsername()%></span>
        </ul>
        <% } %>
    </div>
</header>

<% if(user != null) { %>
<div id="mySidebar" class="sidebar">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a onclick="openMyProfilePage()">
        <i class="material-icons my-mat-icon">account_box</i>
        Profile
    </a>
    <a  onclick="popUpFriendsList()" style="cursor:pointer;">
        <i class="material-icons my-mat-icon">people_outline</i>
        Friends
    </a>
    <a  onclick="popUpFriendRequestsList()" style="cursor:pointer;">
        <i class="material-icons my-mat-icon">person_add</i>
        Friend Requests
    </a>
    <a  onclick="popUpChallengesList()" style="cursor:pointer;">
        <i class="material-icons my-mat-icon">sports_mma</i>
        Challenges
    </a>
    <form id="logoutForm">
        <a onclick="logout()" style="cursor:pointer;">
            <i class="material-icons my-mat-icon">arrow_back</i>
            Log out
        </a>
        <input type="hidden" name="currentUrl" id="currentUrl"/>
    </form>

    <% Boolean displayFriends = (Boolean) request.getSession().getAttribute(DISPLAY_FRIENDS);
        if((displayFriends != null && displayFriends)){ %>
            <script>popUpFriendsList();</script>
            <% request.getSession().removeAttribute(DISPLAY_FRIENDS);
    }%>

    <% Boolean displayFriendRequests = (Boolean) request.getSession().getAttribute(DISPLAY_FRIEND_REQUESTS);
        if((displayFriendRequests != null && displayFriendRequests)){ %>
            <script> popUpFriendRequestsList();</script>
            <% request.getSession().removeAttribute(DISPLAY_FRIEND_REQUESTS);
    }%>

    <% Boolean displayChallenges = (Boolean) request.getSession().getAttribute(DISPLAY_CHALLENGES);
        if((displayChallenges != null && displayChallenges)){ %>
        <script> popUpChallengesList();</script>
        <% request.getSession().removeAttribute(DISPLAY_CHALLENGES);
    }%>

</div>

    <%------------------------------ FORMS ------------------------------%>
    <form id="open-my-profile-page-form" action="/Profile" method="get">
        <input type="hidden" name="id" value="<%=user.getID()%>">
    </form>
<% } %>

<%--<marquee style="padding-top: 5px; color: #d48a33;">ქვიზანთემა მუშაობს სატესტო რეჟიმში, შესაბამისად თუ რაიმე შეფერხდა, გთხოვთ მოგვიტევოთ და შეგვატყობინოთ <3!</marquee>--%>

<script>

    function openMyProfilePage(){
        document.getElementById('open-my-profile-page-form').submit();
    }
    function openMainPage(){
        window.location.href = "/";
    }
    function openRegistration() {
        window.location.href = "/web/pages/LogInPage.jsp";
    }
    function openSearch() {
        window.localStorage.setItem('item', document.getElementById('search-input').value);
        window.location.href = "/SearchPage.jsp";
    }
    function openSidebar() {
        document.getElementById("mySidebar").style.width = "300px";
        document.getElementById("mySidebar").style.height = "280px";
        document.getElementById("mySidebar").style.marginLeft="150px";
        document.getElementById("mySidebar").style.border="1px dashed #f07237";
    }
    /* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
    function closeNav() {
        document.getElementById("mySidebar").style.width = "0";
        document.getElementById("mySidebar").style.marginLeft = "0";
        document.getElementById("mySidebar").style.border="";
    }

</script>