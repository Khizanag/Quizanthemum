<%@ page import="Controller.Classes.User.User" %>
<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page import="static Configs.Config.DEFAULT_ID" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Quizanthemum </title>
    <link rel="icon" type="image/png" href="web/images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="web/styles/common.css">
    <link rel="stylesheet" href="web/styles/homePage.css">
    <link rel="stylesheet" href="web/styles/breakpoints.css">
    <link rel="stylesheet" href="web/styles/profilePage.css">
    <link rel="stylesheet" href="web/styles/quizCreation.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="/web/js/profileStuff.js"></script>
    <script>
        $(document).ready(function(){
            $('.slider').load("web/slider/slider.jsp");
        });

        function openRegistration() {
            window.location.href = "web/pages/SignIn.jsp";
        }
        function openSearch() {
            window.localStorage.setItem('item', document.getElementById('search-input').value);
            window.location.href = "SearchPage.jsp";
        }
    </script>

    <jsp:include page="/web/pages/LogedInHandler.jsp"></jsp:include>
    <% User user = (User) request.getServletContext().getAttribute("logedInUser"); %>

</head>

<body>

    <jsp:include page="/web/pages/Header.jsp"></jsp:include>
    <jsp:include page="/web/pages/MenuBar.jsp"></jsp:include>

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

    <jsp:include page="/web/pages/Footer.jsp"></jsp:include>
</div>
</body>
