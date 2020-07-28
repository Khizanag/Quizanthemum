<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title> Adding Questions </title>--%>
<%--    <link rel="icon" type="image/png" href="../images/common/icon.png"/>--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
<%--    <link rel="stylesheet" href="../styles/common.css">--%>
<%--    <link rel="stylesheet" href="../styles/quizCreation.css">--%>
<%--    <link rel="stylesheet" href="../styles/breakpoints.css">--%>
<%--    <link rel="stylesheet" href="../styles/rules.css">--%>
<%--    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>--%>
<%--</head>--%>

<%--<body>--%>
<%--    <header class= "header-section">--%>
<%--        <div class="container header">--%>
<%--            <div class="header-left">--%>
<%--                <img class="logo"src="../images/common/icon.png">--%>
<%--                <h1 class="logo-text">Quizanthemum</h1>--%>
<%--            </div>--%>

<%--            <ul class="header-right">--%>
<%--                <div class= "icon-cirkle">--%>
<%--                    <a class="fa fa-instagram" target="_blank" href="https://www.instagram.com/"></a>--%>
<%--                </div>--%>
<%--                <div class= "icon-cirkle">--%>
<%--                    <a class="fa fa-facebook"  target="_blank" href="https://www.facebook.com/"></a>--%>
<%--                </div>--%>
<%--                <div class= "icon-cirkle">--%>
<%--                    <a class="fa fa-youtube"  target="_blank" href="https://www.youtube.com/"></a>--%>
<%--                </div>--%>
<%--            </ul>--%>

<%--        </div>--%>
<%--    </header>--%>

<%--    <div class="nav-section">--%>
<%--        <div class="container">--%>
<%--            <nav class="nav">--%>
<%--                <ul class="nav-items">--%>
<%--                    <a class="nav-item" target="_self" href="/">HOME</a>--%>
<%--                    <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">TOP USERS</a>--%>
<%--                    <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">QUIZ LIST</a>--%>
<%--                    <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">ABOUT US</a>--%>
<%--                </ul>--%>
<%--            </nav>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <div class="page-holder">--%>
<%--        <form class="add-question-section" action="../../QuestionCreated" method="get">--%>
<%--            <div class="container">s--%>
<%--                <h2>შეკითხვა</h2>--%>
<%--                <p>შეკითხვის დასამატებლაd შეავსეთ ქვემოთ მოყვანილი ველები.</p>--%>
<%--                <hr>--%>

<%--                <div class="input-items" id="input-items">--%>
<%--                    <label for="question-type"><b>აირჩიეთ შეკითხვის ტიპი</b></label>--%>
<%--                    <label><b>აირჩიეთ შეკითხვის ტიპი</b></label>--%>
<%--                    <select onchange="doIt()" class="drop-down" name="question-type" id="question-type">--%>
<%--                        <option value="0">-</option>--%>
<%--                        <option value="1">ტესტური</option>--%>
<%--                        <option value="2">ღია შეკითხვა</option>--%>
<%--                        <option value="3">დასაწყვილებელი</option>--%>
<%--                        <option value="4">გამოტოვებები</option>--%>
<%--                    </select>--%>
<%--                    <div id="current-question-type"></div>--%>
<%--                    <button class="button finish" type="submit">დასრულება</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </form>--%>
<%--    </div>--%>

<%--    <jsp:include page="Footer.jsp"></jsp:include>--%>

<%--</body>--%>

<%--<script language="JavaScript" type="text/javascript">--%>
<%--    function doIt() {--%>
<%--        if($("#questions-type option:selected").val() == 0) {--%>
<%--            document.getElementById('current-question-type').innerHTML='';--%>
<%--        }--%>
<%--        if($("#questions-type option:selected").val() == 1) {--%>
<%--            $('#current-question-type').load('./questionTypes/test.jsp');--%>
<%--        }--%>
<%--        if($("#questions-type option:selected").val() == 2) {--%>
<%--            $('#current-question-type').load('./questionTypes/open.jsp');--%>
<%--        }--%>
<%--        if($("#questions-type option:selected").val() == 3) {--%>
<%--            $('#current-question-type').load('./questionTypes/matching.jsp');--%>
<%--        }--%>
<%--        if($("#questions-type option:selected").val() == 4) {--%>
<%--            $('#current-question-type').load('./questionTypes/fill.jsp');--%>
<%--        }--%>
<%--    }--%>

<%--    function uploadImage(event) {--%>
<%--        if(document.getElementById('photo-url').value != "") {--%>
<%--            var image = document.getElementById('output');--%>
<%--            image.height = 100;--%>
<%--            image.src = document.getElementById('photo-url').value;--%>
<%--        }--%>
<%--    }--%>

<%--    let loadFile = function(event) {--%>
<%--        var image = document.getElementById('output');--%>
<%--        image.height = 100;--%>
<%--        image.src = URL.createObjectURL(event.target.files[0]);--%>
<%--        document.getElementById('photo-url').value = image.src;--%>
<%--    };--%>

<%--    function checkAndRedirect() {--%>
<%--        let name = document.getElementById('question').value != '';--%>
<%--        let description = document.getElementById('description').value != '';--%>
<%--        if((name && description)) {--%>
<%--            window.location.href = "web/pages/addingQuestions.jsp";--%>
<%--        }--%>
<%--    }--%>

<%--    function addNextWrongAns() {--%>
<%--        let parent = document.getElementById('added-wrongs');--%>
<%--        let e = document.createElement('div');--%>
<%--        let toAdd = '<input type="text"  placeholder="გთხოვთ შეუყვანოთ სავარაუდო პასუხი"'+--%>
<%--            'name="wrong-answer-1" id="wrong-answer-1" required>';--%>
<%--        e.innerHTML += toAdd;--%>
<%--        parent.insertBefore(e, null);--%>
<%--    }--%>

<%--    function addToFill() {--%>
<%--        let text = document.getElementById("toFill").value;--%>
<%--        let prev = document.getElementById("fill-question").value;--%>
<%--        document.getElementById("fill-question").innerText = prev + ' ' + text;--%>
<%--        document.getElementById("toFill").value = '';--%>
<%--    }--%>

<%--    function addFillWith() {--%>
<%--        let text = document.getElementById("fillWith").value;--%>
<%--        let prev = document.getElementById("fill-question").value;--%>
<%--        if(text === '') return;--%>
<%--        document.getElementById("fill-question").innerText = prev + ' ({(<_ ' + text + ' _>)}';--%>
<%--        document.getElementById("fillWith").value = '';--%>
<%--    }--%>
<%--</script>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <title> Adding Questions </title>
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../styles/common.css">
    <link rel="stylesheet" href="../styles/quizCreation.css">
    <link rel="stylesheet" href="../styles/breakpoints.css">
    <link rel="stylesheet" href="../styles/rules.css">
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
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

    <div class="page-holder">
        <form class="add-question-section">
            <div class="container">
                <h2>შეკითხვა</h2>
                <p>შეკითხვის დასამატებლაd შეავსეთ ქვემოთ მოყვანილი ველები.</p>
                <hr>

                <div class="input-items" id="input-items">
                    <label for="selector"><b>აირჩიეთ შეკითხვის ტიპი</b></label>
                    <label><b>აირჩიეთ შეკითხვის ტიპი</b></label>
                    <select onchange="doIt()" class="drop-down" name="questions-type" id="questions-type">
                        <option value="0">-</option>
                        <option value="1">ტესტური</option>
                        <option value="2">ღია შეკითხვა</option>
                        <option value="3">დასაწყვილებელი</option>
                        <option value="4">გამოტოვებები</option>
                    </select>
                    <div id="current-question-type"></div>
                    <button class="button finish" type="button">დასრულება</button>
                </div>
            </div>
        </form>
    </div>
    <jsp:include page="Footer.jsp"></jsp:include>
</body>

<script language="JavaScript" type="text/javascript">
    function doIt() {
        if($("#questions-type option:selected").val() == 0) {
            document.getElementById('current-question-type').innerHTML='';
        }
        if($("#questions-type option:selected").val() == 1) {
            $('#current-question-type').load('./questionTypes/test.jsp');
        }
        if($("#questions-type option:selected").val() == 2) {
            $('#current-question-type').load('./questionTypes/open.jsp');
        }
        if($("#questions-type option:selected").val() == 3) {
            $('#current-question-type').load('./questionTypes/matching.jsp');
        }
        if($("#questions-type option:selected").val() == 4) {
            $('#current-question-type').load('./questionTypes/fill.jsp');
        }
    }

    function uploadImage(event) {
        if(document.getElementById('photo-url').value != "") {
            var image = document.getElementById('output');
            image.height = 100;
            image.src = document.getElementById('photo-url').value;
        }
    }

    let loadFile = function(event) {
        var image = document.getElementById('output');
        image.height = 100;
        image.src = URL.createObjectURL(event.target.files[0]);
        document.getElementById('photo-url').value = image.src;
    };

    function checkAndRedirect() {
        let name = document.getElementById('question').value != '';
        let description = document.getElementById('description').value != '';
        if((name && description)) {
            window.location.href = "web/pages/addingQuestions.jsp";
        }
    }

    function addNextWrongAns() {
        let parent = document.getElementById('added-wrongs');
        let e = document.createElement('div');
        let toAdd = '<input type="text"  placeholder="გთხოვთ შეუყვანოთ სავარაუდო პასუხი"'+
            'name="wrong-ans" id="wrong-ans" required>';
        e.innerHTML += toAdd;
        parent.insertBefore(e, null);
    }

    function addToFill() {
        let text = document.getElementById("toFill").value;
        let prev = document.getElementById("fill-question").value;
        document.getElementById("fill-question").innerText = prev + ' ' + text;
        document.getElementById("toFill").value = '';
    }

    function addFillWith() {
        let text = document.getElementById("fillWith").value;
        let prev = document.getElementById("fill-question").value;
        if(text === '') return;
        document.getElementById("fill-question").innerText = prev + ' {(<_' + text + '_>)})';
        document.getElementById("fillWith").value = '';
    }
</script>