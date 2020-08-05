<%@ page import="Controller.Classes.Quiz.Quiz" %>
<%@ page import="static Configs.Config.QUIZ_CREATING_NOW" %>
<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="static Configs.Config.MANAGERS_MANAGER_STR" %>
<%@ page import="Model.Managers.QuizManager" %>
<%@ page import="static Configs.Config.*" %>
<%@ page import="java.util.List" %>
<%@ page import="Controller.Classes.User.User" %>
<%@ page import="Model.Managers.UsersManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <title> Search </title>
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/web/styles/common.css">
    <link rel="stylesheet" href="/web/styles/QuizzesPage.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<style>
    .section-header {
        padding: 20px;
    }
    h3 {
        color: #f07237;
        font-size: xx-large;
    }
    .found-elems-container {
        display: flex;
        flex-wrap: wrap;
    }
    .top-quiz-list-item {
        width: 376px;
    }
    .quiz-small-description {
        font-size: x-small;
    }
    .search-bth {
        cursor: pointer;
        padding: 6px 10px;
        background: #f07237;
        font-size: 18px;
        height: 40px;
        border: none;
        border-radius: 5px;
        margin-left: 10px;
        position: absolute;
        bottom: 0;
        right: 100px;
    }
    b{
        color:#b3bdbe;
        font-family: "Comic Sans MS", cursive, sans-serif;
        margin-bottom: 5px;
    }
    .input-items {
        margin-top: 10px;
        width: 100%;
        display: flex;
        flex-direction: row;
        position: relative;
    }
    .search-item {
        width: 20%;
        display: flex;
        flex-direction: column;
        margin-left: 10px;
    }
    .drop-down {
        width: 100%;
        background: #f1f1f1;
        border-radius: 5px;
        padding: 15px;
        margin: 5px 0 22px 0;
    }
</style>

<body>
<jsp:include page="/web/pages/PartPages/Header.jsp"/>
<jsp:include page="/web/pages/PartPages/MenuBar.jsp"/>
<%
    User logedInUser = (User) request.getServletContext().getAttribute("logedInUser");
    ServletContext context = request.getServletContext();
    ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
    UsersManager usersManager = (UsersManager) managersManager.getManager(USERS_MANAGER_STR);
    List<User> topUsers = usersManager.getTopUsersByFilter(DEFAULT_NUM_TOP_USERS_TO_DISPLAY, LOCATION_TYPE_NONE, "", false, -1, false);
//    List<String> cities = usersManager.getCities();
//    List<String> countries = usersManager.getCities();
%>


<div class="search-inputs-section">
    <div class="container" style="position: relative;">
        <h3 class="section-header"> საძიებო ფილტრი: </h3>
        <form style="margin-left: 20px" action="/DisplayTopUsers" method="get">
            <div class="input-items" id="input-items">
                <div class="search-item">
                    <label for="locationType"><b>აირჩიეთ ლოკაციის ტიპი</b></label>
                    <select onchange="getLocType(this)" class="drop-down"
                            name="questions-type" id="locationType">
                        <option value="0">-</option>
                        <option value="1">ქალაქი</option>
                        <option value="2">ქვეყანა</option>
                    </select>
                </div>
                <div class="search-item" id="city"style="display: none">
                    <label for="city"><b> ქალაქები </b></label>
                    <select class="drop-down" name="questions-type">
                        <option value="0">-</option>
<%--                        <% for(int i = 1; i <= cities.size(); i++) {%>--%>
<%--                            <option value="<%=i%>"><%=cities.get(i-1)%></option>--%>
<%--                        <%}%>--%>
                    </select>
                </div>
                <div class="search-item" id="country"style="display: none">
                    <label for="country"><b> ქვეყნები </b></label>
                    <select class="drop-down" name="questions-type">
                        <option value="0">-</option>
<%--                        <% for(int i = 1; i <= countries.size(); i++) {%>--%>
<%--                            <option value="<%=i%>"><%=countries.get(i-1)%></option>--%>
<%--                        <%}%>--%>
                    </select>
                </div>
                <button type="submit" class="search-bth"><i class="fa fa-search"></i></button>
            </div>
        </form>
    </div>
</div>

<div class="found-users-section">
    <div class="container" style="position: relative;">
        <h3 class="section-header"> ნაპოვნი მომხმარებლები:</h3>
        <div class="found-elems-container">
            <% for(User currUser : topUsers) { %>
            <div class="top-quiz-list-item"
                 onclick="redirectToProfile(<%=currUser.getID()%>)">
                <img class= "quiz-list-small-image" src="awefqwefqwef"
                     onerror="this.src='/web/images/common/defProfPic.jpg';">
                <div class= "quiz-list-small-description-block" style="position: relative">
                    <h3 class= "quiz-title" style="font-size: 16px">
                        <%=currUser.getUsername()%>
                    </h3>
                    <p class="quiz-small-description" style="overflow: hidden; height: 75px; font-size: 14px">
                        <%=currUser.getFirstName()%> <%=currUser.getLastName()%>
                    </p>
                    <p class="quiz-small-description" style="overflow: hidden; height: 75px;">
                        <%=currUser.getEmail()%>
                    </p>
                    <p class="quiz-small-description" style="overflow: hidden; height: 75px; font-size: 14px">
                        <%=currUser.getBirthDate()%>
                    </p>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</div>

<jsp:include page="/web/pages/PartPages/Footer.jsp"/>
</body>

<script>

    function redirectToQuizStart(id){
        const inp=document.getElementById("currQuizId"+id);
        inp.value=id;
        const form = document.getElementById("to_display_start_quiz_form");
        document.getElementById("to_display_start_quiz_elem").value = id;
        form.submit();
    }
    function redirectToProfile(id){
        const inp=document.getElementById("currUser"+id);
        inp.value=id;
        const form = document.getElementById("to_display_profile_form");
        document.getElementById("to_display_profile_elem").value = id;
        form.submit();
    }

    function getLocType(elem) {
        let locType = document.getElementById(elem.id).value;
        if(locType == 0) {
            document.getElementById("city").style.display = "none"
            document.getElementById("country").style.display = "none"
        } else if(locType == 1) {
            document.getElementById("city").style.display = "flex"
            document.getElementById("country").style.display = "none"
        } else if(locType == 2) {
            document.getElementById("country").style.display = "flex"
            document.getElementById("city").style.display = "none"
        }
    }

</script>