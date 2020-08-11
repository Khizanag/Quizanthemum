<%@ page import="Controller.Classes.User.User" %>
<%@ page import="java.util.List" %>
<%@ page import="Controller.Classes.OtherClasses.Challenge" %>
<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="static Configs.Config.MANAGERS_MANAGER_STR" %>
<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page import="Model.Managers.ChallengesManager" %>
<%@ page import="static Configs.Config.*" %>
<%@ page import="static Configs.AchievementTypes.*" %>
<%@ page import="Model.Managers.AchievementsManager" %>
<%@ page import="Controller.Classes.User.Achievement" %>
<%--
  Created by IntelliJ IDEA.
  User: gigakhizanishvili
  Date: 8/2/20
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="icon" type="image/png" href="web/images/common/icon.png"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/web/styles/common.css">
<%--<link rel="stylesheet" href="/web/styles/homePage.css">--%>
<link rel="stylesheet" href="/web/styles/breakpoints.css">
<%--<link rel="stylesheet" href="/web/styles/profilePage.css">--%>
<%--<link rel="stylesheet" href="/web/styles/quizCreation.css">--%>

<jsp:include page="/web/pages/LogedInHandler.jsp"/>

<%
    ServletContext context = request.getServletContext();
    ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
    AchievementsManager achievementsManager = (AchievementsManager) managersManager.getManager(ACHIEVEMENTS_MANAGER_STR);


    int achievementType = (Integer) context.getAttribute("achievementType");
    Achievement currAchievement = achievementsManager.getAchievement(achievementType);
%>

<div class="friends-list-popup" id="achievement-popup-id">
    <div class="overlay"></div>
    <div class="content" style="height: auto; width: 650px">
        <div class="close-btn" onclick="popUpChallengesList()">&times;</div>
        <h1 style="color:orange; margin-top: 30px">New Achievement Unlocked!</h1>
        <br>
        <div style="margin-top: 50px">
            <div class="top-quiz-items" style="justify-content: center; align-items: center">
                <div class="top-quiz-item" style="width: 545px; margin: 0">
                    <img class="quiz-small-image" src="<%=currAchievement.getIconURL()%>"
                         onerror="this.src='/web/images/common/Quiz1.jpg';" style="padding-left: 10px;">
                    <div class="quiz-small-description-block">
                        <h3 class="quiz-title">
                            <%=currAchievement.getTitle()%>
                        </h3><br>
                        <p class="quiz-small-description">
                            <%=currAchievement.getDescription()%>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function popUpChallengesList(){
        document.getElementById("achievement-popup-id").classList.toggle("active");
    }
</script>