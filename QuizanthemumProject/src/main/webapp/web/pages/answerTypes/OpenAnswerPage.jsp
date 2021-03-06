<%@ page import="Controller.Classes.Quiz.Question.Question" %>
<%@ page import="Controller.Classes.Quiz.Question.QuestionEvent" %>
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
<style>
    .question-img {
        width:40%;
        margin-top: 10px;
    }
</style>
<body>
<jsp:include page="/web/pages/PartPages/Header.jsp"></jsp:include>
<jsp:include page="/web/pages/PartPages/MenuBar.jsp"></jsp:include>

<form class="add-question-section" action="../../../QuestionEventFinished" method="get">
    <div class="container">
        <h2>Question #<%=request.getServletContext().getAttribute("question_number")%></h2>
        <%QuestionEvent questionEvent = (QuestionEvent) request.getServletContext().getAttribute("question_event");%>
        <%Question question = questionEvent.getQuestion();%>
        <img src="<%=question.getPictureStatementURL()%>" class="question-img"
             onerror="this.style.display='none'">
        <p><%=question.getTextStatement()%></p>
        <p><%=question.getHeaderStatement()%></p>
        <hr>
        <div class="input-items" id="input-items">
            <label><b>Enter Your Answer Here: </b></label>
            <textarea class="ans-toFill" id="question_event_answer_0" name="question_event_answer_0"></textarea>
            <p> Entered <span id="words-counter">0</span> word(s)</p>
        </div><hr>
        <button class="button" type="submit">  Submit Answer </button>
    </div>
</form>

<jsp:include page="../PartPages/Footer.jsp"></jsp:include>
</body>

<script>
    document.querySelector("textarea").addEventListener('keyup', count);

    function count(){
        let resultArray = [];
        let str = this.value.replace(/[\t\n\r\.\?\!]/gm,' ');
        let wordArray = str.split(" ");
        for (let i = 0; i < wordArray.length; i++) {
            let item = wordArray[i].trim();
            if(item.length > 0){
                resultArray.push(item);
            }
        }
        document.getElementById("words-counter").innerText = resultArray.length;
    }
</script>