<%@ page import="Controller.Classes.User.User" %>
<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page import="static Configs.Config.DEFAULT_ID" %>
<%@ page import="Controller.Classes.Quiz.Quiz" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="Model.Managers.QuizManager" %>
<%@ page import="static Configs.Config.*" %>
<%@ page import="java.util.Collections" %>
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


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="/web/js/profileStuff.js"></script>
    <script>
        $(document).ready(function(){
            $('.slider').load("web/slider/slider.jsp");
        });
    </script>

    <jsp:include page="/web/pages/LogedInHandler.jsp"/>
    <% User user = (User) request.getServletContext().getAttribute(LOGGED_IN_USER); %>

</head>
<%
    ServletContext context = request.getServletContext();
    ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
    QuizManager quizManager = (QuizManager) managersManager.getManager(QUIZ_MANAGER_STR);
    List<Quiz> highestRated = quizManager.getHighestRatedQuizzes(DEFAULT_NUM_QUIZZES_TO_DISPLAY);
    List<Quiz> mostPopular = quizManager.getMostPopularQuizzes(DEFAULT_NUM_QUIZZES_TO_DISPLAY);
    Collections.reverse(highestRated); // to draw in correct order
    Collections.reverse(mostPopular); // to draw in correct order

%>

<body>
    <jsp:include page="/web/pages/PartPages/Header.jsp"/>
    <jsp:include page="/web/pages/PartPages/MenuBar.jsp"/>

    <div class="slider"></div>

    <div class="highest-rated-section">
        <div class="container" style="position: relative; overflow: hidden">
            <h3 class="section-header">მაღალ რეიტინგული ქვიზები</h3>
            <div class="scroll-block">
                <% for(int i=0;i<highestRated.size();i++){ Quiz currQuiz = highestRated.get(i); %>
                <div class="top-quiz-list-item" id="top_<%=i%>" onclick="redirectToQuizStart(<%=currQuiz.getID()%>)">
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
                                <ul class="raiting-icons"   >
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
            <div class="scroll-arrow leftarr" onclick="scrollLeftTop()">
                <p style="color:white; font-size: xx-large"> < </p>
            </div>
            <div class="scroll-arrow rightarr" onclick="scrollRightTop(<%=highestRated.size()%>)">
                <p style="color:white; font-size: xx-large"> > </p>
            </div>
        </div>
    </div>

    <div class="just-added-section">
        <div class="container" style="position: relative; overflow: hidden">
            <h3 class="section-header">პოპულარული ქვიზები</h3>
            <div class="scroll-block">
                <% for(int i=0;i<mostPopular.size();i++){ Quiz currQuiz = mostPopular.get(i); %>
                <div class="top-quiz-list-item" id="popular_<%=i%>" onclick="redirectToQuizStart(<%=currQuiz.getID()%>)">
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
            <div class="scroll-arrow leftarr" onclick="scrollLeftJustAdded()">
                <p style="color:white; font-size: xx-large"> < </p>
            </div>
            <div class="scroll-arrow rightarr" onclick="scrollRightJustAdded(<%=mostPopular.size()%>)">
                <p style="color:white; font-size: xx-large"> > </p>
            </div>

        </div>
    </div>

    <form id="to_display_start_quiz_form" action="Quiz" method="get">
        <input type="hidden" value="-1" id="to_display_start_quiz_elem" name="id">
    </form>
    <jsp:include page="/web/pages/PartPages/Footer.jsp"/>
</body>

<script>
    let topLeft = 0;
    let topRight = 0;
    function scrollLeftTop() {
        if(topLeft != 0) {
            document.getElementById('top_' + (topLeft-1)).style.display = 'flex';
            topLeft--;
        }
    }

    function scrollRightTop(numElems) {
        topRight = numElems-1;
        if(topRight != topLeft+3 && numElems > 4) {
            document.getElementById('top_' + topLeft).style.display = 'none';
            topLeft++;
        }
    }

    let popularLeft = 0;
    let popularRight = 0;
    function scrollLeftJustAdded() {
        if(popularLeft != 0) {
            document.getElementById('popular_' + (popularLeft-1)).style.display = 'flex';
            popularLeft--;
        }
    }

    function scrollRightJustAdded(numElems) {
        popularRight = numElems-1;
        if(popularRight != popularLeft+3 && numElems > 4) {
            document.getElementById('popular_' + popularLeft).style.display = 'none';
            popularLeft++;
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

<style>
    .section-header {
        padding: 20px;
    }
    h3 {
        color: #f07237;
        font-size: xx-large;
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
    .scroll-block {
        display: flex;
        height: 500px;
    }

    .quiz-list-small-description-block{
        width:350px;
        height:100%;
        overflow: hidden;
        display: flex;
        flex-direction: column;
        align-items: center;
        align-content: center;
        overflow: hidden;
        margin-left: 15px;
        font-family: "Comic Sans MS", cursive, sans-serif;
    }
    .quiz-list-small-description-block h3{
        margin-top: 5%;
    }
    .quiz-list-small-description-block h3{
        cursor: pointer;
        color:wheat;
    }
    .quiz-small-description {
        margin-top: 5px;
        overflow: hidden;
        height: 90px;
        font-size: 14px;
    }
    .quiz-list-small-description-block p{
        color: white;
    }
    .top-quiz-list-item {
        margin: 15px;
        width: 282px;
        height: 400px;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        cursor: pointer;
        align-items: center;
        align-content: center;
        transition: transform .2s;
        border: 1px solid #ff751a;
    }
    .top-quiz-list-item:hover{
        transform: scale(1.1);
    }

    .quiz-list-small-image{
        width: 100%;
        height: 60%;
    }

    .scroll-arrow {
        text-align: center;
        width: 60px;
        cursor: pointer;
        background-color: #f07237;
        position: absolute;
        border-radius: 50%;
        border: none;
    }
    .leftarr {
        left: 0;
        top: 45%;
    }
    .rightarr {
        right: 0;
        top: 45%;
    }
</style>