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

    <jsp:include page="/web/pages/Header.jsp"></jsp:include>
    <jsp:include page="/web/pages/MenuBar.jsp"></jsp:include>

    <div class="page-holder">
        <form class="add-question-section">
            <div class="container">
                <h2>შეკითხვა</h2>
                <p>შეკითხვის დასამატებლაd შეავსეთ ქვემოთ მოყვანილი ველები.</p>
                <hr>

                <div class="input-items" id="input-items">
                    <label for="questions-type"><b>აირჩიეთ შეკითხვის ტიპი</b></label>
                    <label><b>აირჩიეთ შეკითხვის ტიპი</b></label>
                    <select onchange="doIt()" class="drop-down" name="questions-type" id="questions-type">
                        <option value="0">-</option>
                        <option value="1">ღია პასუხი</option>
                        <option value="2">გამოტოვებების შევსება</option>
                        <option value="3">ტესტური კითხვა</option>
                        <option value="4">რამდენიმე პასუხიანი ტესტური კითხვა</option>
                        <option value="5">დასაწყვილებელი</option>
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
            window.location.href = './answerTypes/OpenAnswerPage.jsp';
        }
        if($("#questions-type option:selected").val() == 2) {
            window.location.href = './answerTypes/FillTextAnswerPage.jsp';
        }
        if($("#questions-type option:selected").val() == 3) {
            window.location.href = './answerTypes/MultiChoiceAnswerPage.jsp';
        }
        if($("#questions-type option:selected").val() == 4) {
            window.location.href = './answerTypes/MultiChoiceMultiAnswerAnswerPage.jsp';
        }
        if($("#questions-type option:selected").val() == 5) {
            window.location.href = './answerTypes/MatchingAnswerPage.jsp';
        }
    }
</script>