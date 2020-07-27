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
<form class="registration-section" action="../../Registration" method="get">
    <div class="container">
        <h2>რეგისტრაცია</h2>
        <p>გთხოვთ შეავსოთ ფორმა პროფილის შესაქმნელად.</p>
        <hr>
        <%
            if(request.getServletContext().getAttribute("errorMessage") != null) { %>
                <p class="error_message"> ${errorMessage}</p> <%
                request.removeAttribute("errorMessage");
            }
        %>
        <div class="input-items">

            <div class="input-item">
                <label><b>სახელი</b></label>
                <input type="text" placeholder="შეიყვანეთ თქვენი სახელი"
                       name="registration_first_name" id="registration_first_name" required
                >
                <label><b>გვარი</b></label>
                <input type="text" placeholder="შეიყვანეთ თქვენი გვარი"
                       name="registration_last_name" id="registration_last_name" required
                >
            </div>

            <div class="input-item" style="width: 30%">
            <label><b>დაბადების თარიღი</b></label>
            <input type="date" name="registration_birth_date"
                   value="2000-01-01" id="registration_birth_date"
                    min= "1980-01-01" max="2020-01-01">
            </div>
            <label><b>მომხმარებლის სახელი (USERNAME)</b></label>
            <input type="text" placeholder="შეიყვანეთ თქვენი მომხმარებლის სახელი"
                   name="registration_username" id="registration_username" required>

            <label><b>E-mail</b></label>
            <input type="email" placeholder="შეიყვანეთ email" name="registration_email"
                   id="registration_email" required>

            <label><b>პაროლი</b></label>
            <input type="password" placeholder="შეიყვანეთ პაროლი"
                   name="registration_password" id="registration_password" required>

            <label for="psw-repeat"><b>გაიმეორეთ პაროლი</b></label>
            <input type="password" placeholder="გთხოვთ თავიდან შეიყვანოთ პაროლი"
                   name="psw-repeat" id="psw-repeat" required>
        </div>
        <hr>
        <p>ახალი პროგილის შქმნა გულისხმობს, რომ თქვენ ეთანხმებით ჩვენს
            <a href="https://sites.google.com/site/lawdeepsearch/CivilCodeofGeorgia"
               target="_blank">წესებსა და მოთხოვნებს</a>.
        </p>
        <button type="submit" class="button" onclick="checkAndRedirect()">რეგისტრაცია</button>
    </div>

    <div class="container signin">
        <p>უკვე ხართ ამ გვერდის მომხმარებელი? <a href="SignIn.jsp">შედით თქვენს პროფილზე</a>.</p>
    </div>
</form>

<%--    <footer	class= "footer-section">--%>
<%--        <div class= "container">--%>
<%--            <div class= "footer-items">--%>
<%--                <div class= "footer left">--%>
<%--                    All Right Reserved--%>
<%--                </div>--%>
<%--                <div class= "footer rigth">--%>
<%--                    Quizanthemum By Our Team--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </footer>--%>
    <jsp:include page="Footer.jsp"></jsp:include>
</body>

<script >
    function checkAndRedirect() {
        let f_name = document.getElementById("registration_first_name").value !== '';
        let l_name = document.getElementById("registration_last_name").value !== '';
        let username = document.getElementById("registration_username").value !== '';
        let email = document.getElementById("registration_email").value !== '';
        let password = document.getElementById("registration_password").value ;
        let rep_pwd = document.getElementById("psw-repeat").value;

        if(password != rep_pwd) {
            alert( "\n" + "პაროლი და განმეორებით შეყვანილი პაროლი არ ემთხვევა" + "\n" +
                   "\n" + "გთხოვთ გადაამოწმოთ შეყვანილი მონაცემები");
            return;
        }

        if (f_name && l_name && username && email && password !== '') {
            // window.location.href = "";
            //TODO
        }
    }
</script>
