<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="Controller.Classes.User.User" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Creating Quiz </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
    <link rel="stylesheet" href="/web/styles/common.css">
    <link rel="stylesheet" href="/web/styles/quizCreation.css">
    <link rel="stylesheet" href="/web/styles/breakpoints.css">
    <link rel="stylesheet" href="/web/styles/startQuiz.css">

    <jsp:include page="/web/pages/LogedInHandler.jsp"></jsp:include>

</head>
<body>
    <jsp:include page="/web/pages/Header.jsp"></jsp:include>
    <jsp:include page="/web/pages/MenuBar.jsp"></jsp:include>

    <form class="start-quiz-section" action="../../../QuizEventStart" method ="get">
        <div class="container">
            <div class="start-quiz-holder">
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
            <button class="button" type="submit"
                    style="margin-top: 10px">
                ქვიზის დაწყება
            </button>
        </div>
    </form>

    <jsp:include page="/web/pages/Footer.jsp"></jsp:include>
</body>