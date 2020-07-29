<%@ page import="Controller.Classes.User.User" %><%--
  Created by IntelliJ IDEA.
  User: gigakhizanishvili
  Date: 7/27/20
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="icon" type="image/png" href="web/images/common/icon.png"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/web/styles/common.css">
<link rel="stylesheet" href="/web/styles/homePage.css">
<link rel="stylesheet" href="/web/styles/breakpoints.css">
<link rel="stylesheet" href="/web/styles/profilePage.css">
<link rel="stylesheet" href="/web/styles/quizCreation.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/web/js/profileStuff.js"></script>

<% User user = (User) request.getServletContext().getAttribute("logedInUser"); %>

<header class= "header-section">
    <div class="container header">
        <div class="header-left">
            <img class="logo" src="/web/images/common/icon.png">
            <h1 class="logo-text">Quizanthemum</h1>
        </div>

        <% if(user == null){ %>
            <ul class="header-right">
                <button class="button logIn" onClick="openRegistration()">შესვლა</button>
            </ul>
        <% } else { %>
            <ul class="header-right">
                <img class = "profile-picture right-menu" id="small-prof-pic-id" src="" onerror="this.src='/web/images/common/defProfPic.jpg';" onclick="redirectToProfPage()">

                <span class = "profile-name-text" onclick="redirectToProfPage()"><%=user.getUsername()%></span>

<%--                <div class="right-menu">--%>
<%--                    <button class="menu-button">ps</button>--%>
<%--                    <div class="dropdown-menu">--%>
<%--                        <a href="#">პროფილი</a>--%>
<%--                        <a href="#">პროფილი</a>--%>
<%--                        <a href="#">პროფილი</a>--%>
<%--                        <a href="#">პროფილი</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </ul>
        <% } %>

    </div>
</header>