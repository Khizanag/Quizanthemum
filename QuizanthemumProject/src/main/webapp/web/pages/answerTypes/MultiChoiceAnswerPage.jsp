<%@ page import="Controller.Classes.Quiz.Question.Question" %>
<%@ page import="Controller.Classes.Quiz.Question.QuestionEvent" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Quiz In Progress </title>
    <link rel="icon" type="image/png" href="../../images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/web/styles/common.css">
    <link rel="stylesheet" href="/web/styles/quizCreation.css">
    <link rel="stylesheet" href="/web/styles/breakpoints.css">
    <link rel="stylesheet" href="/web/styles/answers.css">
</head>

<style>
    .question-img {
        width: 40%;
        margin-top: 10px;
    }
</style>
<body>

    <jsp:include page="/web/pages/Header.jsp"></jsp:include>
    <jsp:include page="/web/pages/MenuBar.jsp"></jsp:include>

    <form class="add-question-section" action="../../../QuestionEventFinished" method="get">
        <div class="container">
            <h2>შეკითხვა #<%=request.getServletContext().getAttribute("question_number")%></h2>
            <%QuestionEvent questionEvent = (QuestionEvent) request.getServletContext().getAttribute("question_event");%>
            <%Question question = questionEvent.getQuestion();%>
            <%List<String> statements = question.getShuffledStatements();%>

            <img src="<%=question.getPictureStatementURL()%>" class="question-img"
                 onerror="this.style.display='none'">
            <p><%=question.getTextStatement()%></p>
            <p><%=question.getHeaderStatement()%></p>
            <hr>
            <div class="input-items" id="input-items">
                <% for(int i = 0; i < question.getStatementsCount(); i++) { %>
                <input type="hidden" name="real_value" />
                <input type="checkbox" id="<%=i%>" name="question_event_multi_answer_<%=i%>"
                       onclick="selectOnlyThis(this)" value="<%=statements.get(i)%>">
                <label for=<%=i%>><b> <%=statements.get(i)%> </b></label><br>
                <% } %>
            </div><hr>
            <button class="button" type="submit"> პასუხის დადასტურება </button>
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