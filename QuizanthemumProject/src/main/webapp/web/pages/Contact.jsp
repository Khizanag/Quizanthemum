<%--
  Created by IntelliJ IDEA.
  User: gigakhizanishvili
  Date: 7/29/20
  Time: 06:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="UTF-8">
    <title> Contacts </title>
    <link rel="icon" type="image/png" href="web/images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/web/styles/common.css">
    <link rel="stylesheet" href="/web/styles/homePage.css">
    <link rel="stylesheet" href="/web/styles/breakpoints.css">
    <link rel="stylesheet" href="/web/styles/quizzSummaryPage.css">
    <link rel="stylesheet" href="/web/styles/profilePage.css">
    <link rel="stylesheet" href="/web/styles/ContactPage.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../js/profileStuff.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Ranchers&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<head>
    <title>Contact</title>
</head>
<body>
    <jsp:include page="/web/pages/PartPages/Header.jsp"/>
    <jsp:include page="/web/pages/PartPages/MenuBar.jsp"/>

    <br><br>
    <div class="full-wrapper">
        <div class = "header-wrapper">
                <div class = "content-header-container">
                    <h2>Leave Your info , We will contact you</h2>
                </div>
        </div>
        <div class = "form-content-wrapper">
            <div class = "main-container">
                <div class="form-content ">
                    <form id="contact" action="/SendContactMail" class="contact-form">
                        <input class="inp-text" type="text" placeholder="name" name="name" tabindex="1" required autofocus>
<%--                        <input class="inp-text" type="email" placeholder="მეილის მისამართი" name="mail" tabindex="2" required >--%>
                        <input class="inp-text" type="text" placeholder="subject..." name="subject" tabindex="2" required >
                        <input class="inp-text" type="text" placeholder="Phone number(optional)" name="mobile" tabindex="3">
                        <textarea class="big-inp-text"placeholder="enter text" name="body" tabindex="4" required></textarea>
                        <button class="submit-btn" name="submit" type="submit" id="contact-submit" data-submit="...Sending">Send</button>
                    </form>

                </div>
                <div class="info-content">
                    <span class="info-row">
                        <i class="material-icons">place</i>
                        <span>address: Free University</span>
                    </span>
                    <span class="info-row">
                        <i class="material-icons">local_phone</i>
                        <span>phone: +995598322837</span>
                    </span>
                    <span class="info-row">
                        <i class="material-icons">local_post_office</i>
                        <span>e-mail: quizanthemumTeam@gmail.com</span>
                    </span>
                    <span class="info-row">
                        About Us:
                        <div class ="about-us-text">
                            <p>
                                We are fiveMan development group, whose aim is to
                                provide quality quizz platform for quiz lovers. <strong><span style="color:#f07237">Quizanthemum</span></strong> has big history .
                                To achive our aim , we have worked hard . The Sleepless nights , the tensions , the sweat and
                                the unbroken will to deliver the quality product is what we have been through . But ALL OF IT WAS WORTH IT.
                            </p>
                        </div>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/web/pages/PartPages/Footer.jsp"></jsp:include>
</body>
</html>
