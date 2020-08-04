<%@ page import="Controller.Classes.User.User" %>
<%@ page import="static Configs.Config.LOGGED_IN_USER" %>
<%--
  Created by IntelliJ IDEA.
  User: gigakhizanishvili
  Date: 7/27/20
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<link rel="icon" type="image/png" href="/web/images/common/icon.png"/>--%>
<%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
<link rel="stylesheet" href="/web/styles/common.css">
<link rel="stylesheet" href="/web/styles/homePage.css">
<link rel="stylesheet" href="/web/styles/breakpoints.css">
<link rel="stylesheet" href="/web/styles/scroll.css">
<%----%>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Rowdies:wght@700&display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>--%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setHeader("Content-Type", "text/xml; charset=UTF-8");
    User user = (User) request.getServletContext().getAttribute(LOGGED_IN_USER);
%>

<jsp:include page="/web/pages/FriendsListPopup.jsp"/>
<jsp:include page="/web/pages/ChallengesListPopUp.jsp"/>

<header class= "header-section">
    <div class="container header">
        <div class="header-left" style="cursor: pointer;" onclick="openMainPage()">
            <img class="logo" src="/web/images/common/icon.png">
            <h1 class="logo-text">Quizanthemum</h1>
        </div>
        <% if(user == null){ %>
            <ul class="header-right">
                <button class="log-in-button button logIn" onclick="openRegistration()" style="margin-top: 0;">შესვლა</button>
            </ul>
        <% } else { %>
            <ul class="header-right">
                <img class = "profile-picture right-menu" id="small-prof-pic-id" src="" onerror="this.src='/web/images/common/defProfPic.jpg';" href=""onclick="openSidebar()">
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
            პროფილი
        </a>

        <a  onclick="popupfriendList()" style="cursor:pointer;">
            <i class="material-icons my-mat-icon">people_outline</i>
            მეგობრები
        </a>

        <a  onclick="popUpChallengesList()" style="cursor:pointer;">
            <i class="material-icons my-mat-icon">vertical_align_center</i>
            გამოწვევები
        </a>

        <form id="logoutForm">
            <a onclick="logout()" style="cursor:pointer;">
                <i class="material-icons my-mat-icon">arrow_back</i>
                გასვლა
            </a>
            <input type="hidden" name="currentUrl" id="currentUrl"/>
        </form>

    </div>

<%------------------------------ FORMS ------------------------------%>

    <form id="open-my-profile-page-form" action="/Profile" method="get">
        <input type="hidden" name="id" value="<%=user.getID()%>">
    </form>

<% } %>


<script>
    function openMyProfilePage(){
        document.getElementById('open-my-profile-page-form').submit();
    }

    function openMainPage(){
        window.location.href = "/";
    }

    function openRegistration() {
        window.location.href = "/web/pages/SignIn.jsp";
    }

    function openSearch() {
        window.localStorage.setItem('item', document.getElementById('search-input').value);
        window.location.href = "SearchPage.jsp";
    }

    function openSidebar() {
        document.getElementById("mySidebar").style.width = "300px";
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

