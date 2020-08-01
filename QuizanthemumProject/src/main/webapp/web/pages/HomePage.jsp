<%@ page import="Controller.Classes.User.User" %>
<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page import="static Configs.Config.DEFAULT_ID" %>
<%@ page import="Controller.Classes.Quiz.Quiz" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="Model.Managers.QuizManager" %>
<%@ page import="static Configs.Config.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Quizanthemum </title>
    <link rel="icon" type="image/png" href="web/images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="web/styles/common.css">
    <link rel="stylesheet" href="web/styles/homePage.css">
    <link rel="stylesheet" href="web/styles/breakpoints.css">
    <link rel="stylesheet" href="web/styles/profilePage.css">
    <link rel="stylesheet" href="web/styles/quizCreation.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="/web/js/profileStuff.js"></script>
    <script>
        $(document).ready(function(){
            $('.slider').load("web/slider/slider.jsp");
        });

        function openRegistration() {
            window.location.href = "/web/pages/SignIn.jsp";
        }
        function openSearch() {
            window.localStorage.setItem('item', document.getElementById('search-input').value);
            window.location.href = "SearchPage.jsp";
        }
    </script>

    <jsp:include page="/web/pages/LogedInHandler.jsp"></jsp:include>
    <% User user = (User) request.getServletContext().getAttribute("logedInUser"); %>

</head>
<%
    ServletContext context = request.getServletContext();
    ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
    QuizManager quizManager = (QuizManager) managersManager.getManager(QUIZ_MANAGER_STR);
    List<Quiz> topQuizzes = quizManager.getMostPopularQuizzes(10);
%>
<body>

    <jsp:include page="/web/pages/Header.jsp"></jsp:include>
    <jsp:include page="/web/pages/MenuBar.jsp"></jsp:include>

    <div class="slider"></div>

    <div class="main-section">
        <div class="container">
            <div class= "info-items">
                <% for(Quiz currQuiz:topQuizzes){ %>

                <div class="info-item" onclick="redirectToQuizStart(<%=currQuiz.getID()%>)">
                    <img class= "info-image a" src="<%=currQuiz.getIconUrl()%>"  onerror="this.src='/web/images/common/Quiz1.jpg';"></img>
                    <div class= "info-text">
                        <h3 class= "info-title">
                            <%=currQuiz.getName()%>
                        </h3>
                        <div class="author">ავტორი: <%=currQuiz.getAuthor().getUsername()%></div>
                        <p class="info-paragraf">
                            <%=currQuiz.getDescription()%>
                        </p>
                    </div>
                    <input type="hidden" name="quiz_event_quiz_id" id="currQuizId<%=currQuiz.getID()%>"/>

                </div>
                <%}%>
                <form id="to_display_start_quiz_form" action="web/pages/StartQuiz.jsp" method="get">
                    <input type="hidden" value="-1" id="to_display_start_quiz_elem" name="quiz_id">
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="/web/pages/Footer.jsp"></jsp:include>
</body>

<script>
    function redirectToQuizStart(id){
        const inp=document.getElementById("currQuizId"+id);
        inp.value=id;
        const form = document.getElementById("to_display_start_quiz_form");
        document.getElementById("to_display_start_quiz_elem").value = id;
        form.submit();
    }
</script>