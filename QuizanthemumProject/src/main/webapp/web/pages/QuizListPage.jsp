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
    List<Quiz> topQuizzes = quizManager.getMostPopularQuizzes(10);
%>
<div class="quiz-list-holder">
    <div class="full-wrapper">
        <div class = "header-wrapper">
            <div class = "content-header-container">
                <h2>ქვიზები</h2>
            </div>
        </div>
        <form id="QuizzListForm" >
        <div class="top-quizzes-list-container">
            <div class= "top-quiz-list-items">
            <% for(Quiz currQuiz:topQuizzes){ %>
                <div class="top-quiz-list-item" onclick="redirectToQuizStart(<%=currQuiz.getID()%>)">
                        <img class= "quiz-list-small-image" src="<%=currQuiz.getIconUrl()%>"  onerror="this.src='../slider/img/Quiz1.jpg';" >
                        <div class= "quiz-list-small-description-block">
                            <h3 class= "quiz-title" >
                                <%=currQuiz.getName()%>
                            </h3><br>
                            <p class="quiz-small-description">
                              <%=currQuiz.getDescription()%>
                            </p>
                        </div>
                    <div class = "quiz-score"><%=currQuiz.getMaxScore()%></div>
                    <input type="hidden" name="quiz_event_quiz_id" id="currQuizId<%=currQuiz.getID()%>"/>
                </div>
            <%}%>
            </div>
        </div>
        </form>
    </div>
</div>
<jsp:include page="/web/pages/Footer.jsp"></jsp:include>
</body>
<script>
    //TODO !!!
    function redirectToQuizStart(id){
        console.log(id);
        const inp=document.getElementById("currQuizId"+id);
        inp.value=id;
        console.log(inp);
        const form = document.getElementById("QuizzListForm");
        form.action="QuizEventStartServlet";
        form.submit();
    }
</script>
