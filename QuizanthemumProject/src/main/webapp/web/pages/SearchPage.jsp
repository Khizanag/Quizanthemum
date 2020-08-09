<%@ page import="Controller.Classes.Quiz.Quiz" %>
<%@ page import="static Configs.Config.QUIZ_CREATING_NOW" %>
<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="static Configs.Config.MANAGERS_MANAGER_STR" %>
<%@ page import="Model.Managers.QuizManager" %>
<%@ page import="static Configs.Config.*" %>
<%@ page import="java.util.List" %>
<%@ page import="Controller.Classes.User.User" %>
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
        right: 40%;
        bottom: 0px;
        display: none;
    }
    .toHover:hover + .onHover {
        display: block;
        color: white;
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
</style>

<body>
    <jsp:include page="/web/pages/PartPages/Header.jsp"/>
    <jsp:include page="/web/pages/PartPages/MenuBar.jsp"/>

    <%
        ServletContext context = request.getServletContext();
        ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
        QuizManager quizManager = (QuizManager) managersManager.getManager(QUIZ_MANAGER_STR);
        List<User> users = (List<User>) request.getAttribute("users");
        List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");
        String searchingFor = (String) request.getAttribute("search");
        searchingFor = searchingFor.toLowerCase();
    %>

    <div class="found-quiz-section">
        <div class="container" style="position: relative;">
            <h3 class="section-header"> ნაპოვნი ქვიზები:</h3>
            <div class="found-elems-container">
            <%  int numQuizzes = 0;
                for(Quiz currQuiz : quizzes) {
                String name = currQuiz.getName().toLowerCase();
                String description = currQuiz.getDescription().toLowerCase();
                if(name.contains(searchingFor) || description.contains(searchingFor)) { numQuizzes++;%>
                    <div class="top-quiz-list-item"
                         onclick="redirectToQuizStart(<%=currQuiz.getID()%>)">

                        <img class= "quiz-list-small-image" src="<%=currQuiz.getIconUrl()%>"
                             onerror="this.src='/web/images/common/Quiz1.jpg';">
                        <div class= "quiz-list-small-description-block" style="position: relative">
                            <h3 class= "quiz-title" style="font-size: 16px">
                                <%=currQuiz.getName()%>
                            </h3>
                            <p class="quiz-small-description" style="overflow: hidden; height: 75px;">
                                <%=currQuiz.getDescription()%>
                            </p>
                            <div class="toHover">
                                <div class="raiting-icons-holder" style="margin-bottom: 0; color:white;">
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
                        <div class = "quiz-score"><%=currQuiz.getMaxScore()%></div>
                        <input type="hidden" name="quiz_event_quiz_id" id="currQuizId<%=currQuiz.getID()%>"/>
                    </div>
                <%}%>
            <%}%>
            <% if(numQuizzes == 0) { %>
                <p style="color: white; font-size: large; margin-left: 50px">
                    ამ ინფორმაციის შემცველი ქვიზი არ მოიძებნა
                </p>
            <%}%>
            </div>
            <form id="to_display_start_quiz_form" action="Quiz" method="get">
                <input type="hidden" value="-1" id="to_display_start_quiz_elem" name="id">
            </form>
        </div>
    </div>

    <div class="found-quiz-section">
        <div class="container" style="position: relative;">
            <h3 class="section-header"> ნაპოვნი მომხმარებლები:</h3>
            <div class="found-elems-container">
            <%  int numUsers = 0;
                for(User currUser : users) {
                String firstName = currUser.getFirstName().toLowerCase();
                String lastName = currUser.getLastName().toLowerCase();
                String userName = currUser.getUsername().toLowerCase();
                if(firstName.contains(searchingFor) || lastName.contains(searchingFor)
                    || userName.contains(searchingFor)) { numUsers++;%>
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
                        <input type="hidden" name="quiz_event_quiz_id" id="currUser<%=currUser.getID()%>"/>
                    </div>
                <%}%>
            <%}%>
            <% if(numUsers == 0) { %>
                <p style="color: white; font-size: large; margin-left: 50px">
                    ამ მონაცემების მქონე მომხმარებელი არ მოიძებნა
                </p>
            <%}%>
            </div>
            <form id="to_display_profile_form" action="Profile" method="get">
                <input type="hidden" value="-1" id="to_display_profile_elem" name="id">
            </form>
        </div>
    </div>

    <jsp:include page="/web/pages/PartPages/Footer.jsp"/>
</body>

<script>
    <% if(numQuizzes == numUsers && numQuizzes == 0) {%>
        setTimeout(function(){
            let ans = confirm('Did you mean "a"?');
            if (ans) {
                window.location.href = 'http://localhost:8080/SearchPage?search=a'
            }
        }, 100);
    <%}%>
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
</script>