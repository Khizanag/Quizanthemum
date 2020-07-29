<%@ page import="Controller.Classes.User.User" %><%--
  Created by IntelliJ IDEA.
  User: gigakhizanishvili
  Date: 7/27/20
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="../images/common/icon.png"/>
<link rel="stylesheet" href="/web/styles/common.css">
<link rel="stylesheet" href="/web/styles/logIn.css">
<link rel="stylesheet" href="/web/styles/breakpoints.css">

<% User user = (User) request.getServletContext().getAttribute("logedInUser"); %>
<script>
    function logout(){
        const logoutForm = document.getElementById("logoutForm");
        logoutForm.action="../../LogOut"
        const currUrl = document.getElementById("currentUrl");
        currUrl.value=window.location.href;
        logoutForm.submit();
    }
</script>

<div class="nav-section">
    <div class="container manu">
        <nav class="nav">
            <ul class="nav-items">
                <a class="nav-item" target="_self" href="/">მთავარი</a>
<%--                <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">TOP USERS</a>--%>
<%--                <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">ქვიზები</a>--%>
                <%
                    if(user != null){ %>
                <a class="nav-item" target="_self" href="/web/pages/QuizCreation.jsp">ქვიზის შექმნა</a>
                <a class="nav-item" target="_self" href="/web/pages/StartQuiz.jsp">სატესტო</a>
                <a class="nav-item" target="_self" href="/web/pages/pasuxebi.jsp">კითხვები</a>
                <a class="nav-item" target="_sefl" id="friend-list-btn-id" onclick="popupfriendList()" style="cursor: pointer;">მეგობრები</a>
                <% }
                %>
                <a class="nav-item" target="_self" href="/web/pages/Contact.jsp">კონტაქტი</a>
                    <%if(user != null){%>
                <form id="logoutForm">
                    <a class="nav-item" target="_sefl" id="logout-id" onclick="logout()" style="cursor: pointer;">გამოსვლა</a>
                    <input type="hidden" name="currentUrl" id="currentUrl"/>
                </form>
                <%} %>
            </ul>
        </nav>
        <div class="search-items">
            <input type="text" id="search-input" placeholder="რა გაინტერესებთ..." name="search">
            <button type="submit" onClick="openSearch()"><i class="fa fa-search"></i></button>
        </div>
    </div>
</div>

<jsp:include page="/web/pages/FriendsListPopup.jsp"></jsp:include>