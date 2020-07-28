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
        <p>  Lorem ipsum dolor sit amet, consectetur adipisicing elit. A
            aliquid aperiam architecto ea earum fugit hic iste maxime molestiae
            molestias, qui quisquam ratione repellendus sunt vel veritatis
            vero voluptas voluptatem! Lorem ipsum dolor sit amet,
            consectetur adipisicing elit. Minima natus nobis odit
            perspiciatis quasi. Accusantium alias aliquid animi at error,
            exercitationem modi porro quas ratione
            sapiente tempore veniam vero voluptate? </p>
        <p>ავტორის მინიშნება/მოთხოვნა, მაგალითად: (კაიაჟერს ერითმება)</p>
        <hr>
        <div class="input-items" id="input-items">
            <input type="checkbox" id="1" name="test_answer_1"
                   onclick="selectOnlyThis(this)">
            <label for="1"><b> ბანანი თიმთიმ თანანი </b></label><br>
            <input type="checkbox" id="2" name="test_answer_2"
                   onclick="selectOnlyThis(this)">
            <label for="2"><b> ვოიაჟერი </b></label><br>
            <input type="checkbox" id="3" name="test_answer_3"
                   onclick="selectOnlyThis(this)">
            <label for="3"><b> შაურმა თიმთიმ თაურმა </b></label><br>
            <input type="checkbox" id="4" name="test_answer_4"
                   onclick="selectOnlyThis(this)">
            <label for="4"><b> ძმდებო ძღმდებო </b></label><br><br>
        </div><hr>
        <button class="button" type="button"> პასუხის დადასტურება </button>
    </div>
</form>

<jsp:include page="../Footer.jsp"></jsp:include>
</body>

<script>
    function selectOnlyThis(elem){
        var myCheckbox = document.getElementsByTagName("input");
        Array.prototype.forEach.call(myCheckbox,function(el){
            el.checked = false;
        });
        elem.checked = true;
    }
</script>