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
    <title> Quizanthemum </title>
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
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
    <jsp:include page="/web/pages/Header.jsp"></jsp:include>
    <jsp:include page="/web/pages/MenuBar.jsp"></jsp:include>

    <br><br>
    <div class="full-wrapper">
        <div class = "header-wrapper">
                <div class = "content-header-container">
                    <h2>დატოვე მონაცემები, ჩვენ დაგიკავშირდებით</h2>
                </div>
        </div>
        <div class = "form-content-wrapper">
            <div class = "main-container">
                <div class="form-content ">
                    <form id="contact" action="../../SendContactMailServlet" class="contact-form">
                        <input class="inp-text" type="text" placeholder="სახელი" tabindex="1" required autofocus>
                        <input class="inp-text" type="email" placeholder="მეილის მისამართი" tabindex="2" required >
                        <input class="inp-text" type="text" placeholder="მობილურის ნომერი(არა აუცილებელი)" tabindex="3">
                        <textarea class="big-inp-text"placeholder="აკრიფე ტექსტი" tabindex="4" required></textarea>
                        <button class="submit-btn" name="submit" type="submit" id="contact-submit" data-submit="...Sending">გაგზავნა</button>
                    </form>

                </div>
                <div class="info-content">
                    <span class="info-row">
                        <i class="material-icons">place</i>
                        <span>მისამართი: თავისუფალი უნივერსიტეტი</span>
                    </span>
                    <span class="info-row">
                        <i class="material-icons">local_phone</i>
                        <span>ტელ: +995598322837</span>
                    </span>
                    <span class="info-row">
                        <i class="material-icons">local_post_office</i>
                        <span>ელ-ფოსტა: quizanthemumTeam@gmail.com</span>
                    </span>
                    <span class="info-row">
                        ჩვენს შესახებ:
                        <div class ="about-us-text">
                            <p >
                                ჩვენ ვართ ხუთკაციანი დეველოპერული ჯგუფი , რომელთა მიზანიცაა ქართულ ბაზარზე
                                დანერგონ ხარისხიანი პლატფორმა ქვიზების მოყვარულთათვის. <strong>Quzianthemum</strong> _ს დიდი ისტორია აქვს
                                უკან , რომელიც დაწერილია უძილო ღამეებით და დატვირთული დღეებით , იმისათვის რომ , თქვენამდე მოგვეტანა
                                ხარისხიანი , ესთეტიკური პროდუქტი , სადაც შეძლებთ ითამაშოთ უცხო ქვიზები , თქვენ თვითონ შექმნათ თქვენი სასურველი ქვიზი და ...

                            </p>
                        </div>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/web/pages/Footer.jsp"></jsp:include>
</body>
</html>
