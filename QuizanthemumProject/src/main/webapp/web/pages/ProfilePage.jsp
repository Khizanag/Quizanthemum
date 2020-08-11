<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Controller.Classes.User.User" %>
<%@ page import="Controller.Classes.Quiz.Quiz" %>
<%@ page import="static Configs.Config.QUIZ_MANAGER_STR" %>
<%@ page import="static Configs.Config.MANAGERS_MANAGER_STR" %>
<%@ page import="java.util.List" %>
<%@ page import="static Configs.Config.*" %>
<%@ page import="Controller.Classes.Quiz.QuizEvent" %>
<%@ page import="Model.Managers.*" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="Controller.Classes.OtherClasses.FriendRequest" %>
<head>
    <meta charset="UTF-8">
    <title> Users Profile </title>
    <link rel="icon" type="image/png" href="/web/images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/web/styles/common.css">
    <link rel="stylesheet" href="/web/styles/homePage.css">
    <link rel="stylesheet" href="/web/styles/breakpoints.css">
    <link rel="stylesheet" href="/web/styles/profilePage.css">
    <link rel="stylesheet" href="/web/styles/quizCreation.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@700&display=swap" rel="stylesheet">

    <jsp:include page="/web/pages/LogedInHandler.jsp"/>
    <%
        ServletContext context = request.getServletContext();
        ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
        UsersManager usersManager = (UsersManager) managersManager.getManager(USERS_MANAGER_STR);
        int ID = Integer.parseInt(request.getParameter("id"));
        User user = usersManager.getUser(ID);
        DecimalFormat df = new DecimalFormat("0.00");
    %>
    <%!
        private static BigDecimal truncateDecimal(double x, int numberofDecimals) {
            if (x > 0) {
                return new BigDecimal(String.valueOf(x)).setScale(numberofDecimals, BigDecimal.ROUND_FLOOR);
            } else {
                return new BigDecimal(String.valueOf(x)).setScale(numberofDecimals, BigDecimal.ROUND_CEILING);
            }
        }
    %>
</head>

<body>

<jsp:include page="/web/pages/PartPages/Header.jsp"/>
<jsp:include page="/web/pages/PartPages/MenuBar.jsp"/>

<% if (user == null) { %>
<jsp:include page="/web/pages/PartPages/YouShouldLogInPart.jsp"/>
<% } else { %>

<div class="change-image-popup" id="change-image">
    <div class="overlay"></div>
    <div class="content">
        <form method="get" action="/ChangeProfilePicture">
            <div class="close-btn" onclick="changeImage()">&times;</div>
            <h2 style="color:white">upload image</h2>
            <br>
            <div class="upload-image-section-cl">
                <input type="file" accept="image/*" name="image" id="file"
                       onchange="loadFile(event)"
                       style="display: none;"
                >
<%--                <label class="button upload upl-btn" type="button" for="file">upload image</label>--%>
                <input type="text" placeholder="Image URL" name="photo-url" id="photo-url" required style="width:100%">
                <label class="button upload" type="button"
                       onclick="uploadImage(event)" id="url-button" style="width:100%">
                    Upload
                </label>
                <img id="output" src="" style="width:100%;height:100%;margin-top: 5px;">
                <input class="button upload upl-btn" type="submit"></input>
            </div>
        </form>
    </div>
</div>

<div class="profile-info-wrapper">
    <div class="profile-info-container">
        <div class="profile-details-info">
            <div class="user-first-name"><%="First Name: " + user.getFirstName()%>
            </div>
            <div class="user-last-name"><%="Last Name: " + user.getLastName()%>
            </div>
            <div class="user-email"><%="Email: " + user.getEmail()%>
            </div>
            <% String mobNum = user.getMobileNumber();
                if (mobNum == null) {
                    mobNum = "*******";
                }
                String country = user.getCountry();
                if (country == null) {
                    country = "Unknown";
                }
                String city = user.getCity();
                if (city == null) {
                    city = "Unknown";
                }
            %>
            <div class="user-mobile"><%="Phone number: " + mobNum%>
            </div>
            <div class="user-country"><%="Country: " + country%>
            </div>
            <div class="user-city"><%="City: " + city %>
            </div>
        </div>
        <div class="profile-info">
            <img class="profile-picture-big" id="prof-pic-big-id"
                 src="<%=usersManager.getProfilePicture(user.getID())%>"
                 onerror="this.src='/web/images/common/defProfPic.jpg';">
            <button class="changeImageHoverBtn" onclick="changeImage()">change image</button>
            <div class="profile-name"><%=user.getUsername()%>
            </div>
            <%
                int role = user.getRole();
                String status = "";
                if (role == 1) {
                    status = "User";
                } else if (role == 2) {
                    status = "Moderator";
                } else if (role == 3) {
                    status = "Admin";
                }
            %>
            <div class="user-details"><%=status%>
            </div>
        </div>
        <div class="profile-details-info">
            <div class="quizzes-played"><%="Played quizzes: " + usersManager.getQuizzesPlayedCount(user.getID())%>
            </div>
            <div class="quizzes-played"><%="Total User Score: " + truncateDecimal(usersManager.getUserTotalPoints(user.getID()), 2)%>
            </div>
            <div class="challenges-played"><%="Played Challenges: " + user.getChallengesPlayed()%>
            </div>
            <div class="challenges-won"><%="Won Challenges: " + user.getChallengesWon()%>
            </div>
            <%
                if (role > 1) {
                    out.print("<div class='quizzes-made'> ");
                    out.print("My made Quizzes: ");
                    out.print(usersManager.getQuizzesMadeCount(user.getID()));
                    out.print("</div>");
                }
            %>
            <div class="Creation-date"><%="Profile Creation Date: <br><br>" + user.getRegistrationDate()%>
            </div>
        </div>
    </div>

</div>

<%
    QuizEventManager quizEventManager = (QuizEventManager) managersManager.getManager(QUIZ_EVENT_MANAGER_STR);
    FriendshipsManager friendshipsManager = (FriendshipsManager) managersManager.getManager(FRIENDSHIPS_MANAGER_STR);
    FriendRequestsManager friendRequestsManager = (FriendRequestsManager) managersManager.getManager(FRIEND_REQUESTS_MANAGER_STR);
    QuizManager quizManager = (QuizManager) managersManager.getManager(QUIZ_MANAGER_STR);
    List<QuizEvent> topQuizEvents = quizEventManager.getLatestQuizzesPlayedBy(user.getID(), DEFAULT_NUM_QUIZZES_TO_DISPLAY);
    User loggedUser = (User) request.getServletContext().getAttribute(LOGGED_IN_USER);
    if (loggedUser != null
            && loggedUser.getID() != user.getID()
            && !friendshipsManager.areFriends(user.getID(), loggedUser.getID())
            && !friendRequestsManager.isFriendRequestSent(loggedUser.getID(), user.getID())) { %>

        <div class="container">
            <form id="add-friend-form" action="SendFriendRequest" method="get" style="text-align: center;">
                <input type="hidden" name="user-id" value="<%=user.getID()%>">
                <input type="hidden" name="url" value="/Profile?id=<%=user.getID()%>">
                <input type="submit" class="button finish" value="ვიმეგობროთ!" style="width: 80%">
            </form>
        </div>

<% } %>

<div class="top-quizzes-banner">
    <div class="players-top-quizzes">
        My Top Played Quizzess
    </div>
</div>
<main class="main">
    <div class="top-quizzes-container">
        <div class="top-quiz-items">
            <% for (QuizEvent currQuizEvent : topQuizEvents) { %>
            <%Quiz currQuiz = currQuizEvent.getQuiz();%>
            <div class="top-quiz-item" onclick="redirectToQuizStart(<%=currQuiz.getID()%>)" style="width: 545px;">
                <img class="quiz-small-image" src="<%=currQuiz.getIconUrl()%>"
                     onerror="this.src='/web/images/common/Quiz1.jpg';" style="padding-left: 10px;">
                <div class="quiz-small-description-block">
                    <h3 class="quiz-title">
                        <%=currQuiz.getName()%>
                    </h3><br>
                    <p class="quiz-small-description">
                        <%=currQuiz.getDescription()%>
                    </p>
                </div>
                <div class="quiz-score"><%= truncateDecimal(currQuizEvent.getUserScore(), 2)%>
                    / <%=truncateDecimal((currQuiz.getMaxScore()), 2)%>
                </div>
                <input type="hidden" name="quiz_event_quiz_id" id="currQuizId<%=currQuiz.getID()%>"/>
            </div>
            <%}%>
        </div>
    </div>
    <form id="to_display_start_quiz_form" action="Quiz" method="get">
        <input type="hidden" id="to_display_start_quiz_elem" name="id">
    </form>
</main>

<% } %>

<jsp:include page="/web/pages/PartPages/Footer.jsp"/>
</body>

<script>
    function redirectToQuizStart(id) {
        console.log(id);
        const inp = document.getElementById("currQuizId" + id);
        inp.value = id;
        console.log(inp);
        const form = document.getElementById("to_display_start_quiz_form");
        document.getElementById("to_display_start_quiz_elem").value = id;
        form.submit();
    }

    function openSearch() {
        window.location.href = "SearchPage.jsp";
    }

    function changeImage() {
        document.getElementById("change-image").classList.toggle("active");
        document.getElementById('photo-url').value = "";
        document.getElementById('output').src = "";
    }

    function previewImage() {
        const url = $("#image-url").val();
        $("#preview-image").attr("src", url);
    }

    function loadFile() {
        var image = document.getElementById('output');
        image.height = 300;
        image.src = URL.createObjectURL(event.target.files[0]);
        document.getElementById('photo-url').value = image.src;
    }

    function uploadImage(event) {
        if (document.getElementById('photo-url').value != "") {
            var image = document.getElementById('output');
            image.height = 300;
            image.src = document.getElementById('photo-url').value;
        }
    }

    function submitPhoto() {
        if (document.getElementById('photo-url').value != "") {
            let image = document.getElementById("small-prof-pic-id");
            image.src = document.getElementById('photo-url').value;
            image = document.getElementById("prof-pic-big-id");
            image.src = document.getElementById('photo-url').value;
            changeImage();
        }
    }
</script>