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
    <link rel="stylesheet" href="/web/styles/common.css">
    <link rel="stylesheet" href="/web/styles/homePage.css">
    <link rel="stylesheet" href="/web/styles/breakpoints.css">
    <link rel="stylesheet" href="/web/styles/profilePage.css">
    <link rel="stylesheet" href="/web/styles/quizCreation.css">
    <link rel="stylesheet" href="/web/styles/scroll.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="/web/js/profileStuff.js"></script>
    <script>
        $(document).ready(function(){
            $('.slider').load("web/slider/slider.jsp");
        });
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
<style>
    .section-header {
        padding: 20px;
    }
    h3 {
        color: #f07237;
        font-size: x-large;
    }
    .fa:hover {
        color: white;
    }
    .toHover {
        display: flex;
        align-items: center;
        position: relative;
    }
    .onHover {
        position: absolute;
        right: 65px;
        bottom: 0;
        display: none;
    }
    .toHover:hover + .onHover {
        display: block;
        color: white;
    }
</style>
<body>
    <jsp:include page="/web/pages/Header.jsp"></jsp:include>
    <jsp:include page="/web/pages/MenuBar.jsp"></jsp:include>

    <div class="slider"></div>

    <div class="just-added-section">
        <div class="container" style="position: relative; overflow: hidden">
            <h3 class="section-header">ბოლოს დამატებული ქვიზები</h3>
            <div class="scroll-block">
                <% for(int i=0;i<topQuizzes.size();i++){ Quiz currQuiz = topQuizzes.get(i); %>
                <div class="top-quiz-list-item" id="<%=i%>" onclick="redirectToQuizStart(<%=currQuiz.getID()%>)">
                    <img class= "quiz-list-small-image" src="<%=currQuiz.getIconUrl()%>" onerror="this.src='/web/images/common/Quiz1.jpg';">
                    <div class= "quiz-list-small-description-block" style="position: relative">
                        <h3 class= "quiz-title" style="font-size: 16px; text-align: center">
                            <%=currQuiz.getName()%>
                        </h3>
                        <p class="quiz-small-description" style="width: 282px;">
                            <%=currQuiz.getDescription()%>
                        </p>
                        <div class="toHover">
                            <div class="raiting-icons-holder" style="margin-bottom: 0; color:white">
                                <ul class="raiting-icons" id="stars-holder">
                                    <% for(int j = 1; j <= quizManager.getQuizRating(currQuiz.getID()); j++) { %>
                                    <a class="fa fa-star" style="margin-right: 2px;"></a>
                                    <%}%>
                                    <% for(int j = quizManager.getQuizRating(currQuiz.getID())+1; j <= 5; j++) { %>
                                    <a class="fa fa-star-o" style="margin-right: 2px;"></a>
                                    <%}%>
                                </ul>
                            </div>
                        </div>
                        <p class="onHover"> <%=quizManager.getQuizRating(currQuiz.getID())%>/5</p>
                    </div>
                    <input type="hidden" name="quiz_event_quiz_id" id="currQuizId<%=currQuiz.getID()%>"/>
                </div>
                <%}%>
            </div>
            <div class="scroll-arrow leftarr" onclick="scrlLeft()">
                <p style="color:white; font-size: xx-large"> < </p>
            </div>
            <div class="scroll-arrow rightarr" onclick="scrollRight(<%=topQuizzes.size()%>)">
                <p style="color:white; font-size: xx-large"> > </p>
            </div>
            <form id="to_display_start_quiz_form" action="/web/pages/StartQuiz.jsp" method="get">
                <input type="hidden" value="-1" id="to_display_start_quiz_elem" name="quiz_id">
            </form>
        </div>
    </div>


    <jsp:include page="/web/pages/Footer.jsp"></jsp:include>
</body>

<script>
    let indexLeft = 0;
    let indexRight = 3;
    function scrlLeft() {
        if(indexLeft != 0) {
            console.log(indexLeft);
            document.getElementById(indexLeft-1).style.display = 'flex';
            indexLeft--;
        }
    }

    function scrollRight(numElems) {
        if(indexRight != indexLeft+3 || numElems > 4) {
            document.getElementById(indexLeft).style.display = 'none';
            indexLeft++;
        }
    }

    function redirectToQuizStart(id){
        const inp=document.getElementById("currQuizId"+id);
        inp.value=id;
        const form = document.getElementById("to_display_start_quiz_form");
        document.getElementById("to_display_start_quiz_elem").value = id;
        form.submit();
    }
</script>
