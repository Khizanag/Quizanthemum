<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="Controller.Classes.OtherClasses.User" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Creating Quiz </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
    <link rel="stylesheet" href="../styles/common.css">
    <link rel="stylesheet" href="../styles/quizCreation.css">
    <link rel="stylesheet" href="../styles/breakpoints.css">
    <link rel="stylesheet" href="../styles/startQuiz.css">

    <%
        if(request.getServletContext().getAttribute("logedInUser") == null){
            for(Cookie cookie : request.getCookies()){
                if(cookie.getName().equals("logedInUserID")){
                    UsersManager usersManager = (UsersManager) request.getServletContext().getAttribute(USERS_MANAGER_STR);
                    User logedInUser = usersManager.getUser(Integer.parseInt(cookie.getValue()));
                    request.getServletContext().setAttribute("logedInUser", logedInUser);
                }
            }
        }
    %>
</head>
<body>
<header class= "header-section">
    <div class="container header">
        <div class="header-left">
            <img class="logo"src="../images/common/icon.png">
            <h1 class="logo-text">Quizanthemum</h1>
        </div>

        <ul class="header-right">
            <div class= "icon-cirkle">
                <a class="fa fa-instagram" target="_blank" href="https://www.instagram.com/"></a>
            </div>
            <div class= "icon-cirkle">
                <a class="fa fa-facebook"  target="_blank" href="https://www.facebook.com/"></a>
            </div>
            <div class= "icon-cirkle">
                <a class="fa fa-youtube"  target="_blank" href="https://www.youtube.com/"></a>
            </div>
        </ul>

    </div>
</header>

<div class="nav-section">
    <div class="container">
        <nav class="nav">
            <ul class="nav-items">
                <a class="nav-item" target="_self" href="/">HOME</a>
                <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">TOP USERS</a>
                <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">QUIZ LIST</a>
                <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">ABOUT US</a>
            </ul>
        </nav>
    </div>
</div>


<form class="start-quiz-section">
    <div class="container">
        <div class="info-holder">
            <img src="../images/homepage/c.jpg" class="quiz-main-img">
            <div class="text-holder">
                <h2>ქვიზის სახელი</h2>
                <div type="text" class="description">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                    Accusantium assumenda doloremque eaque harum iste laborum optio rem,
                    repellendus sed voluptate. Accusantium ad asperiores expedita
                    maiores nobis repellendus repudiandae, sint vero?
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                    Accusantium assumenda doloremque eaque harum iste laborum optio rem,
                    repellendus sed voluptate. Accusantium ad asperiores expedita
                    maiores nobis repellendus repudiandae, sint vero?
                </div>
            </div>
        </div>
        <p type="text" class="author"> ავტორის სახელი და გვარი </p>
        <p style=" margin-bottom: 0; color:white"> ქვიზი შექმნილია: 01.08.2020 </p>
        <button class="button" type="button"
                style="margin-top: 10px">
            ქვიზის დაწყება
        </button>
    </div>
</form>

<footer	class= "footer-section">
    <div class= "container">
        <div class= "footer-items">
            <div class= "footer left">
                All Right Reserved
            </div>
            <div class= "footer rigth">
                Quizanthemum By Our Team
            </div>
        </div>
    </div>
</footer>
</body>