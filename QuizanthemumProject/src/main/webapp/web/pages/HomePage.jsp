<%@ page import="Controller.Classes.OtherClasses.User" %>
<%@ page import="Controller.Classes.OtherClasses.User" %>
<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Quizanthemum </title>
    <link rel="icon" type="image/png" href="web/images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="web/styles/common.css">
    <link rel="stylesheet" href="web/styles/homePage.css">
    <link rel="stylesheet" href="web/styles/breakpoints.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.slider').load("web/slider/slider.jsp");
        });

        function openRegistration() {
            window.location.href = "web/pages/SignIn.jsp";
        }
        function openSearch() {
            window.localStorage.setItem('item', document.getElementById('search-input').value);
            window.location.href = "search.html";
        }
    </script>

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
            <img class="logo" src="web/images/common/icon.png">
            <h1 class="logo-text">Quizanthemum</h1>
        </div>


        <ul class="header-right">
            <button class="button logIn" onClick="openRegistration()">შესვლა</button>
        </ul>

    </div>
</header>

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
<div class="page-holder">
    <div class="slider"></div>

    <div class="main-section">
        <div class="container">
            <div class= "info-items">
                <div class="info-item">
                    <image class= "info-image a"></image>
                    <div class= "info-text">
                        <h3 class= "info-title">
                            კაიაჟერი ვოიაჟერი
                        </h3>
                        <div class="author"> ვინცხა ვინცხა</div>
                        <p class="info-paragraf">
                            ძან მაგარი ქვიზია ძან მაგარი ქვიზია ძან მაგარი ქვიზია
                            ძან მაგარი ქვიზია ძან მაგარი ქვიზია ძან მაგარი ქვიზია
                        </p>
                    </div>
                </div>
                <div class="info-item">
                    <image class= "info-image b"></image>
                    <div class= "info-text">
                        <h3 class= "info-title">
                            კაიაჟერი ვოიაჟერი
                        </h3>
                        <div class="author"> ვინცხა ვინცხა</div>
                        <p class="info-paragraf">
                            ძან მაგარი ქვიზია ძან მაგარი ქვიზია ძან მაგარი ქვიზია
                            ძან მაგარი ქვიზია ძან მაგარი ქვიზია ძან მაგარი ქვიზია
                        </p>
                    </div>
                </div>
                <div class="info-item">
                    <image class= "info-image c"></image>
                    <div class= "info-text">
                        <h3 class= "info-title">
                            კაიაჟერი ვოიაჟერი
                        </h3>
                        <div class="author"> ვინცხა ვინცხა</div>
                        <p class="info-paragraf">
                            ძან მაგარი ქვიზია ძან მაგარი ქვიზია ძან მაგარი ქვიზია
                            ძან მაგარი ქვიზია ძან მაგარი ქვიზია ძან მაგარი ქვიზია
                        </p>
                    </div>
                </div>
                <div class="info-item">
                    <image class= "info-image d"></image>
                    <div class= "info-text">
                        <h3 class= "info-title">
                            კაიაჟერი ვოიაჟერი
                        </h3>
                        <div class="author"> ვინცხა ვინცხა</div>
                        <p class="info-paragraf">
                            ძან მაგარი ქვიზია ძან მაგარი ქვიზია ძან მაგარი ქვიზია
                            ძან მაგარი ქვიზია ძან მაგარი ქვიზია ძან მაგარი ქვიზია
                        </p>
                    </div>
                </div>
                <div class="info-item">
                    <image class= "info-image c"></image>
                    <div class= "info-text">
                        <h3 class= "info-title">
                            კაიაჟერი ვოიაჟერი
                        </h3>
                        <div class="author"> ვინცხა ვინცხა</div>
                        <p class="info-paragraf">
                            ძან მაგარი ქვიზია ძან მაგარი ქვიზია ძან მაგარი ქვიზია
                            ძან მაგარი ქვიზია ძან მაგარი ქვიზია ძან მაგარი ქვიზია
                        </p>
                    </div>
                </div>
                <div class="info-item">
                    <image class= "info-image d"></image>
                    <div class= "info-text">
                        <h3 class= "info-title">
                            კაიაჟერი ვოიაჟერი
                        </h3>
                        <div class="author"> ვინცხა ვინცხა</div>
                        <p class="info-paragraf">
                            ძან მაგარი ქვიზია ძან მაგარი ქვიზია ძან მაგარი ქვიზია
                            ძან მაგარი ქვიზია ძან მაგარი ქვიზია ძან მაგარი ქვიზია
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
</div>
</body>
