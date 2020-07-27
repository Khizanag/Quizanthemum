<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Quiz In Progress </title>
    <link rel="icon" type="image/png" href="../../images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../styles/common.css">
    <link rel="stylesheet" href="../../styles/quizCreation.css">
    <link rel="stylesheet" href="../../styles/breakpoints.css">
    <link rel="stylesheet" href="../../styles/answers.css">
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<header class= "header-section">
    <div class="container header">
        <div class="header-left">
            <img class="logo"src="../../images/common/icon.png">
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

<form class="add-question-section">
    <div class="container">
        <h2>შეკითხვა (აქ იქნება N)</h2>
        <p> დააწყვილეთ ქვემოთ მოყვანილი სიტყვები აზრობრივარ</p>
        <p>ავტორის მინიშნება/მოთხოვნა, მაგალითად: (ძაღლი -> შინაური ცხოველი)</p>
        <hr>
        <div class="input-items" id="input-items">
            <div class="matching-holder">
                <input type="button" name="matching-elem" value="შიკოლათი"
                       id="1" class="matching-elem" onclick="doMatch(1)" >
                <input type="button" name="matching-elem" value="კოკაკოლა"
                       id="2" class="matching-elem" onclick="doMatch(2)" >
                <input type="button" name="matching-elem" value="რეკორდი მაქვს"
                       id="3" class="matching-elem" onclick="doMatch(3)" >
                <input type="button" name="matching-elem" value="ძმაო"
                       id="4" class="matching-elem" onclick="doMatch(4)" >
                <input type="button" name="matching-elem" value="ჩემო"
                       id="5" class="matching-elem" onclick="doMatch(5)" >
                <input type="button" name="matching-elem" value="მოხსნილი"
                       id="6" class="matching-elem" onclick="doMatch(6)" >
                <input type="button" name="matching-elem" value="ხაშურის ლიმონათი"
                       id="7" class="matching-elem" onclick="doMatch(7)" >
                <input type="button" name="matching-elem" value="მარმალათი"
                       id="8" class="matching-elem" onclick="doMatch(8)" >
            </div>
        </div><hr>
        <button class="button" type="button"> პასუხის დადასტურება </button>
    </div>
</form>

<jsp:include page="../Footer.jsp"></jsp:include>
</body>

<script>
    function getRandomColor() {
        let letters = '0123456789ABCDEF';
        let color = '#33';
        for (let i = 0; i < 4; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }

    let numClick = 0;
    let prevId = 0;
    let color = '';
    let before = false;
    function doMatch(id) {

        if (id == prevId && !before) {
            document.getElementById(id).style.backgroundColor = "#ffffff";
            before = true;
        } else before = false;

        if (numClick % 2 == 1 && id != prevId && id % 2 == prevId % 2) {
            prevId = id;
            return;
        }

        if (numClick % 2 == 0 && id != prevId) {
            color = getRandomColor();
            document.getElementById(id).style.backgroundColor = color;
        } else {
            if (id % 2 != prevId % 2) {
                document.getElementById(id).style.backgroundColor = color;
                color = getRandomColor();
            }
        }
        prevId = id;
        numClick++;
    }
</script>