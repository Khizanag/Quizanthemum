<%@ page import="Controller.Classes.Quiz.Question.QuestionEvent" %>
<%@ page import="Controller.Classes.Quiz.Question.Question" %>
<%@ page import="java.util.List" %>
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


    <jsp:include page="/web/pages/Header.jsp"></jsp:include>
    <jsp:include page="/web/pages/MenuBar.jsp"></jsp:include>

    <form class="add-question-section" action="../../../QuestionEventFinished" method="get">
        <div class="container">
            <h2>შეკითხვა #<%=request.getServletContext().getAttribute("question_number")%></h2>
            <%QuestionEvent questionEvent = (QuestionEvent) request.getServletContext().getAttribute("question_event");%>
            <%Question question = questionEvent.getQuestion();%>
            <%List<String> statements = question.getStatements();%>
            <p><%=question.getTextStatement()%></p>
            <p><%=question.getHeaderStatement()%></p>
            <hr>
            <div class="input-items" id="input-items">
                <% for(int i = 0; i < question.getStatementsCount(); i++) { %>
                <input type="checkbox" id=<%=i%> name="question_event_answer_<%=i%>"
                       onclick="selectOnlyThis(this)">
                <label for=<%=i%>><b> <%=statements.get(i)%> </b></label><br>
                <% } %>
            </div><hr>
            <button class="button" type="submit"> პასუხის დადასტურება </button>
        </div>
    </form>

    <jsp:include page="../Footer.jsp"></jsp:include>
</body>
