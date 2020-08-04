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
<body>
<jsp:include page="/web/pages/PartPages/Header.jsp"></jsp:include>
<jsp:include page="/web/pages/PartPages/MenuBar.jsp"></jsp:include>

<form class="add-question-section" action="../../../QuestionEventFinished" method="get">
    <div class="container">
        <h2>შეკითხვა #<%=request.getServletContext().getAttribute("question_number")%></h2>
        <%QuestionEvent questionEvent = (QuestionEvent) request.getServletContext().getAttribute("question_event");%>
        <%Question question = questionEvent.getQuestion();%>
        <img src="<%=question.getPictureStatementURL()%>" class="question-img"
             onerror="this.style.display='none'">
        <p><%=question.getTextStatement()%></p>
        <p><%=question.getHeaderStatement()%></p>
        <hr>
        <div class="input-items" id="input-items">
            <label><b> შეიყვანეთ <%=question.getStatementsCount()%> პასუხი </b></label>
            <div style="display: flex; flex-direction: column; margin-top: 10px">
            <% for(int i = 0; i < question.getStatementsCount(); i ++) {%>
                <input style="width: 50%" type="text" id="<%=i%>"
                       name="question_event_answer_<%=i%>"
                       placeholder="შეიყვანეთ პასუხი N <%=i+1%>">
            <% } %>
            </div>
        </div><hr>
        <button class="button" type="submit"> პასუხის დადასტურება </button>
    </div>
</form>

<jsp:include page="../PartPages/Footer.jsp"></jsp:include>
</body>

<script>

</script>