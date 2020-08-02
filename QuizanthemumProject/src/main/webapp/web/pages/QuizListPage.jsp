<%@ page import="Controller.Classes.Quiz.Quiz" %>
<%@ page import="static Configs.Config.QUIZ_CREATING_NOW" %>
<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="static Configs.Config.MANAGERS_MANAGER_STR" %>
<%@ page import="Model.Managers.QuizManager" %>
<%@ page import="static Configs.Config.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">

    <title> Adding Questions </title>
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/web/styles/QuizzesPage.css">
</head>
<style>
    .quiz-list-holder {
        width: 100%;
    }

</style>
<body>
<jsp:include page="/web/pages/Header.jsp"></jsp:include>
<jsp:include page="/web/pages/MenuBar.jsp"></jsp:include>
<%
    ServletContext context = request.getServletContext();
    ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
    QuizManager quizManager = (QuizManager) managersManager.getManager(QUIZ_MANAGER_STR);
    List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");
//
%>
<div class="quiz-list-holder">
    <div class="full-wrapper">
        <div class = "header-wrapper">
            <div class = "content-header-container">
                <%
                    String title = (String) request.getAttribute("title");
                    if(title != null) { %>
                    <h2> <%=title%> </h2>
                <% } else { %>
                    <h2>ქვიზები</h2>
                <% } %>
            </div>
        </div>
        <div class="top-quizzes-list-container">
            <div class= "top-quiz-list-items">
            <% for(Quiz currQuiz: quizzes){ %>
                <div class="top-quiz-list-item" onclick="redirectToQuizStart(<%=currQuiz.getID()%>)">
                        <img class= "quiz-list-small-image" src="<%=currQuiz.getIconUrl()%>" onerror="this.src='/web/images/common/Quiz1.jpg';">
                        <div class= "quiz-list-small-description-block" style="position: relative">
                            <h3 class= "quiz-title" style="font-size: 16px">
                                <%=currQuiz.getName()%>
                            </h3>
                            <p class="quiz-small-description" style="overflow: hidden; height: 75px; font-size: 14px">
                              <%=currQuiz.getDescription()%>
                            </p>
                            <div class="raiting-icons-holder" style="position: absolute; bottom: 5px; color:white">
                                <ul class="raiting-icons" id="stars-holder">
                                    <% for(int i = 1; i <= 3; i++) { %>
                                        <a class="fa fa-star" style="margin-right: 2px;"></a>
                                    <%}%>
                                    <% for(int i = 4; i <= 5; i++) { %>
                                        <a class="fa fa-star-o" style="margin-right: 2px;"></a>
                                    <%}%>
                                </ul>
                            </div>
                        </div>
                    <div class = "quiz-score"><%=currQuiz.getMaxScore()%></div>
                    <input type="hidden" name="quiz_event_quiz_id" id="currQuizId<%=currQuiz.getID()%>"/>
                </div>
            <%}%>
            </div>
        </div>
        <form id="to_display_start_quiz_form" action="/web/pages/StartQuiz.jsp" method="get">
            <input type="hidden" value="-1" id="to_display_start_quiz_elem" name="quiz_id">
        </form>
    </div>
</div>
<jsp:include page="/web/pages/Footer.jsp"></jsp:include>
</body>

<script>
    function redirectToQuizStart(id){
        console.log(id);
        const inp=document.getElementById("currQuizId"+id);
        inp.value=id;
        console.log(inp);
        const form = document.getElementById("to_display_start_quiz_form");
        document.getElementById("to_display_start_quiz_elem").value = id;
        form.submit();
    }
</script>
