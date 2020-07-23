<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <title> Registration </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
    <link rel="stylesheet" href="../styles/common.css">
    <link rel="stylesheet" href="../styles/logIn.css">
    <link rel="stylesheet" href="../styles/breakpoints.css">
</head>
<body style="padding:0px; margin:0px; font-family:arial,helvetica,sans-serif,verdana,'Open Sans'">
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
<form class="registration-section">
    <div class="container">
        <h2>რეგისტრაცია</h2>
        <p>გთხოვთ შეავსოთ ფორმა პროფილის შესაქმნელად.</p>
        <hr>

        <div class="input-items">
            <label for="name"><b>სახელი / გვარი</b></label>
            <input type="text" placeholder="შეიყვანეთ თქვენი სახელი და გვარი" name="name" id="name" required>

            <label for="email"><b>იმეილი</b></label>
            <input type="text" placeholder="შეიყვანეთ იმეილი" name="email" id="email" required>

            <label for="psw"><b>პაროლი</b></label>
            <input type="password" placeholder="შეიყვანეთ პაროლი" name="psw" id="psw" required>

            <label for="psw-repeat"><b>გაიმეორეთ პაროლი</b></label>
            <input type="password" placeholder="გთხოვთ თავიდან შეიყვანოთ პაროლი" name="psw-repeat" id="psw-repeat" required>
        </div>
        <hr>
        <p>ახალი პროგილის შქმნა გულისხმობს, რომ თქვენ ეთანხმებით ჩვენს
            <a href="#rules" data-rules-target="#rules">წესებსა და მოთხოვნებს</a>.
        </p>
<%--        <div class="rules" id="rules">--%>
<%--            <div class="rules-header">--%>
<%--                <div class="title">დაიცვი წესები თორე დაგენძრევა</div>--%>
<%--                <input type="button" close-rules class="close-button" value="X">--%>
<%--            </div>--%>
<%--            <div class="rules-body">--%>
<%--                იტოგში მისმინე!<br><br>--%>
<%--                წესები წესები წესები წესები წესები წესები წესები წესები--%>
<%--                წესები წესები წესები წესები წესები წესები წესები წესები--%>
<%--                წესები წესები წესები წესები წესები წესები წესები წესები--%>
<%--                წესები წესები წესები წესები წესები წესები წესები წესები--%>
<%--                წესები წესები წესები წესები წესები წესები წესები წესები--%>
<%--                წესები წესები წესები წესები წესები წესები წესები წესები--%>
<%--                წესები წესები წესები წესები წესები წესები წესები წესები--%>
<%--                წესები წესები წესები წესები წესები წესები წესები წესები--%>
<%--                წესები წესები წესები წესები წესები წესები წესები წესები--%>
<%--                წესები წესები წესები წესები წესები წესები წესები წესები--%>
<%--                წესები წესები წესები წესები წესები წესები წესები წესები--%>
<%--                წესები წესები წესები წესები წესები წესები წესები წესები--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div id="popup"></div>--%>
        <button type="submit" class="button">რეგისტრაცია</button>
    </div>

    <div class="container signin">
        <p>უკვე ხართ ამ გვერდის მომხმარებელი? <a href="SignIn.jsp">შედით თქვენს პროფილზე</a>.</p>
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

<script >
    const openRulesEvent = document.querySelectorAll('[data-rules-target]');
    const closeRulesEvent = document.querySelectorAll('[close-rules]');
    const popUpElem = document.getElementById('popup');

    openRulesEvent.forEach(button => {
        button.addEventListener('click', () => {
            const rules = document.querySelector(button.dataset.rulesTarget);
            if (rules == null) {
                return;
            }
            rules.classList.add('active');
            popUpElem.classList.add('active');
        });
    });

    closeRulesEvent.forEach(button => {
        button.addEventListener('click', () => {
            const rules = button.closest('.rules');
            if (rules == null) {
                return;
            }
            rules.classList.remove('active');
            popUpElem.classList.remove('active');
        });
    });
</script>
