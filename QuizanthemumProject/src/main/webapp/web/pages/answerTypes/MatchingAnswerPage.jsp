<%@ page import="Controller.Classes.Quiz.Question.Question" %>
<%@ page import="Controller.Classes.Quiz.Question.QuestionEvent" %>
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
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
    <jsp:include page="/web/pages/PartPages/Header.jsp"></jsp:include>
    <jsp:include page="/web/pages/PartPages/MenuBar.jsp"></jsp:include>

    <form class="add-question-section" id="matching-form" action="../../../QuestionEventFinished" method="get">
        <div class="container">
            <h2>Question #<%=request.getServletContext().getAttribute("question_number")%></h2>
            <%QuestionEvent questionEvent = (QuestionEvent) request.getServletContext().getAttribute("question_event");%>
            <%Question question = questionEvent.getQuestion();%>
            <%List<String> left = question.getMatchingLeft();%>
            <%List<String> right = question.getMatchingRight();%>
            <p><%=question.getHeaderStatement()%></p>
            <hr>
            <div class="input-items" id="input-items">
                <div class="matching-holder" id="matching-holder">
                    <% for(int i = 0; i < question.getStatementsCount(); i++) { %>
                        <% if(i%2 == 0) { %>
                            <input type="label" name="question_event_answer_<%=i%>" value="<%=left.get(i/2)%>"
                            id="<%=i+1%>" class="matching-elem" onclick="doMatch(<%=i+1%>)" readonly>
                            <input type="hidden" id="color<%=i+1%>" name="question_event_matching_color_<%=i%>">
                        <% } else { %>
                            <input type="label" name="question_event_answer_<%=i%>" value="<%=right.get(i/2)%>"
                            id="<%=i+1%>" class="matching-elem" onclick="doMatch(<%=i+1%>)" readonly>
                            <input type="hidden" id="color<%=i+1%>" name="question_event_matching_color_<%=i%>">
                    <% } %>
                    <% } %>
                </div>
            </div><hr>
            <button class="button" type="submit"> Submit Answer </button>
            <input type="hidden" name="answers" id="answers">
        </div>
    </form>

    <jsp:include page="../PartPages/Footer.jsp"></jsp:include>
</body>

<script>

    let colors = ["#616A6B" , "#9B59B6", "#3498DB", "#17A589",
                    "#D35400", "#F39C12", "#1B4F72", "#C0392B"];

    let numClick = 0;
    let prevId = 0;
    let color = '';
    let before = false;
    function doMatch(id) {

        if (id == prevId && !before) {
            document.getElementById(id).style.backgroundColor = "#ffffff";
            document.getElementById("color" + id).value = "#ffffff";
            before = true;
        } else before = false;

        if (numClick % 2 == 1 && id != prevId && id % 2 == prevId % 2) {
            prevId = id;
            return;
        }

        if (numClick % 2 == 0 && id != prevId) {
            color = colors.pop();
            document.getElementById(id).style.backgroundColor = color;
            document.getElementById("color" + id).value = color;
        } else {
            if (id % 2 != prevId % 2) {
                document.getElementById(id).style.backgroundColor = color;
                document.getElementById("color" + id).value = color;
            }
        }
        prevId = id;
        numClick++;
    }
</script>