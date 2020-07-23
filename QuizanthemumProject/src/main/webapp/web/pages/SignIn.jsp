<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Sign In </title>
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../styles/common.css">
    <link rel="stylesheet" href="../styles/logIn.css">
    <link rel="stylesheet" href="../styles/breakpoints.css">
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

<form class="sign-in-section">
    <div class="container">
        <h2>შესვლა</h2>
        <p>გთხოვთ შეიყვანოთ მითითებული მონაცემები პროფილზე შესასვლელად.</p>
        <hr>

        <div class="input-items">
            <label for="email"><b>იმეილი</b></label>
            <input type="text" placeholder="შეიყვანეთ იმეილი" name="email" id="email" required>

            <label for="psw"><b>პაროლი</b></label>
            <input type="password" placeholder="შეიყვანეთ პაროლი" name="psw" id="psw" required>

        </div>
        <button type="submit" class="button">შესვლა</button>
    </div>

    <div class="container signin">
        <p>არ გაქვს პროფილი? <a href="Registration.jsp">ახალი პროფილის შექმნა</a>.</p>
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
