<%--
  Created by IntelliJ IDEA.
  User: gigakhizanishvili
  Date: 7/27/20
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="../images/common/icon.png"/>
<link rel="stylesheet" href="../styles/common.css">
<link rel="stylesheet" href="../styles/logIn.css">
<link rel="stylesheet" href="../styles/breakpoints.css">

<div class="nav-section">
    <div class="container manu">
        <nav class="nav">
            <ul class="nav-items">
                <a class="nav-item" target="_self" href="./">HOME</a>
                <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">TOP USERS</a>
                <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">QUIZ LIST</a>
                <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">ABOUT US</a>
                <a class="nav-item" target="_self" href="web/pages/QuizCreation.jsp">CREATE QUIZ</a>
                <a class="nav-item" target="_self" href="web/pages/StartQuiz.jsp">სატესტო</a>
            </ul>
        </nav>
        <div class="search-items">
            <input type="text" id="search-input" placeholder="რა გაინტერესებთ..." name="search">
            <button type="submit" onClick="openSearch()"><i class="fa fa-search"></i></button>
        </div>
    </div>
</div>