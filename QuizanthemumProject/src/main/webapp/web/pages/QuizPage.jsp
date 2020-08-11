<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="Controller.Classes.User.User" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page import="Controller.Classes.Quiz.Quiz" %>
<%@ page import="Model.Managers.QuizManager" %>
<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="static Configs.Config.*" %>
<%@ page import="static Configs.AchievementTypes.NO_ACHIEVEMENT" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Start Quiz </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
    <link rel="stylesheet" href="/web/styles/common.css">
    <link rel="stylesheet" href="/web/styles/quizCreation.css">
    <link rel="stylesheet" href="/web/styles/breakpoints.css">
    <link rel="stylesheet" href="/web/styles/startQuiz.css">

    <jsp:include page="/web/pages/LogedInHandler.jsp"/>

</head>

<style>
    .quiz-date-and-rait-holder {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
    }
    .fa:hover {
        color: white;
    }
    .toHover {
        display: flex;
        align-items: center;
    }
    .onHover {
        display: none;
    }
    .toHover:hover + .onHover {
        display: flex;
        color: white;
    }

</style>
<body>
    <jsp:include page="/web/pages/PartPages/Header.jsp"/>
    <jsp:include page="/web/pages/PartPages/MenuBar.jsp"/>
    <jsp:include page="/web/pages/PartPages/AchivementPopUp.jsp"/>

    <%
        if(request.getServletContext().getAttribute("quiz-that-was-created-lastly") != null){ %>
            <div style="text-align: center">
                <p style="color: orange; font-weight: bold; font-style: italic; font-size: large">Quiz Created Successfully.</p>
            </div>
    <%
            request.getServletContext().removeAttribute("quiz-that-was-created-lastly");
        }
        ServletContext context = request.getServletContext();
        ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
        QuizManager quizManager = (QuizManager) managersManager.getManager(QUIZ_MANAGER_STR);
        UsersManager usersManager = (UsersManager) managersManager.getManager(USERS_MANAGER_STR);
        Quiz quiz = quizManager.getQuiz(Integer.parseInt(request.getParameter("id")));
        User user = (User) request.getServletContext().getAttribute(LOGGED_IN_USER);
        int achievementType = (Integer) request.getServletContext().getAttribute("achievementType");
    %>

    <%if(achievementType != NO_ACHIEVEMENT) {%>
        <script>
            document.getElementById("achievement-popup-id").classList.toggle("active");
        </script>
    <%}%>

    <form class="start-quiz-section" action="/QuizEventStart" method ="get">
        <div class="container">
            <div class="start-quiz-holder">
                <img src="<%=quiz.getIconUrl()%>" class="quiz-main-img" onerror="this.src='/web/images/common/Quiz1.jpg';">
                <div class="text-holder">
                    <h2><%=quiz.getName()%></h2>
                    <div type="text" class="description">
                        <%=quiz.getDescription()%>
                    </div>
                </div>
            </div>

            <p style="color:white"> Author: <%=quiz.getAuthor().getFirstName()%> <%=quiz.getAuthor().getLastName()%></p>
            <div class="quiz-date-and-rait-holder">
                <p style=" margin-bottom: 0; color:white"> Created on : <%=quiz.getCreationDate()%> </p>
                <div style="display: flex; align-items:center; flex-direction: column; margin-top: -30px">
                    <div class="toHover">
                        <div class="raiting-icons-holder" style="margin-bottom: 0; color:white">
                            <ul class="raiting-icons" id="stars-holder">
                                <% for(int j = 1; j <= quizManager.getQuizRating(quiz.getID()); j++) { %>
                                <a class="fa fa-star" style="margin-right: 2px;"></a>
                                <%}%>
                                <% for(int j = quizManager.getQuizRating(quiz.getID())+1; j <= 5; j++) { %>
                                <a class="fa fa-star-o" style="margin-right: 2px;"></a>
                                <%}%>
                            </ul>
                        </div>
                    </div>
                    <p class="onHover"> <%=quizManager.getQuizRating(quiz.getID())%>/5</p>
                </div>
            </div>
            <br>

            <label><b>Gym Mode:</b></label>
            <input class="checkbox" type="checkbox"  name="practice-mode" id="practice-mode-holder" onchange="changePracticeMoveValue()">
            <br>

            <% if(user != null){ %>

                <label for="challenged-id-holder"><b>Challenge Friend:</b></label>
                <input type="checkbox" class="checkbox" id="is-challenge-holder" name="is-challenge" onchange="changeFriendsDisplayForChallenges()" value="false">
                <select id="challenged-id-holder" class="drop-down" name="challenged-id" style="display: none" value="PZDC"> <%-- TODO right --%>
                    <% for(int friendID : user.getFriendIDs()){
                        User friend = usersManager.getUser(friendID);%>
                    <option value="<%=friend.getID()%>"><%=friend.getFirstName()%> <%=friend.getLastName()%> (<%=friend.getUsername()%>)</option>
                    <% } %>
                </select>

            <% } %>

            <button class="button" type="submit" style="margin-top: 10px">
                Start Quiz
            </button>
        </div>
        <input type="hidden" value="<%=quiz.getID()%>" name="quiz_id">
    </form>
    <jsp:include page="/web/pages/PartPages/Footer.jsp"/>

</body>

<script>
    function changeFriendsDisplayForChallenges(){
        let challengedIDHolder = document.getElementById('challenged-id-holder');
        if(document.getElementById('is-challenge-holder').checked){
            challengedIDHolder.style.display = 'flex';
            document.getElementById('is-challenge-holder').value = 'true';
        } else {
            challengedIDHolder.style.display = 'none';
            document.getElementById('is-challenge-holder').value = 'false';
        }
    }

    function changePracticeMoveValue(){
        let elem = document.getElementById('practice-mode-holder');
        if(elem.checked){
            elem.value = 'true';
        } else {
            elem.value = 'false';
        }
    }
</script>