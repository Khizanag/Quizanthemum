<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="static Configs.Config.MANAGERS_MANAGER_STR" %>
<%@ page import="static Configs.Config.*" %>
<%@ page import="java.util.List" %>
<%@ page import="Controller.Classes.User.User" %>
<%@ page import="Model.Managers.UsersManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <title> User's Filter </title>
    <link rel="icon" type="image/png" href="web/images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/web/styles/common.css">
    <link rel="stylesheet" href="/web/styles/QuizzesPage.css">
    <link rel="stylesheet" href="/web/styles/UserBlock.css">

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
    .search-bth {
        cursor: pointer;
        padding: 6px 10px;
        background: #f07237;
        font-size: 18px;
        height: 40px;
        border: none;
        border-radius: 5px;
        margin-left: 10px;
    }
    b{
        color:#b3bdbe;
        font-family: "Comic Sans MS", cursive, sans-serif;
    }
    .input-items {
        margin-top: 10px;
        width: 100%;
        display: flex;
        flex-direction: row;
        position: relative;
        vertical-align: middle;
        border: 2px double #ff751a;;
    }
    .search-item {
        width: 20%;
        display: flex;
        flex-direction: column;
        margin-left: 20px;
        margin-top: 20px;
        margin-bottom: 20px;
    }
    .drop-down {
        width: 100%;
        background: #f1f1f1;
        border-radius: 5px;
        padding: 15px;
        margin: 5px 0 0 0;
    }
</style>

<body>
<jsp:include page="/web/pages/PartPages/Header.jsp"/>
<jsp:include page="/web/pages/PartPages/MenuBar.jsp"/>
<%
    User loggedInUser = (User) request.getServletContext().getAttribute("logedInUser");
    ServletContext context = request.getServletContext();
    ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
    UsersManager usersManager = (UsersManager) managersManager.getManager(USERS_MANAGER_STR);
    List<User> topUsers = (List<User>) request.getAttribute("users");
    List<String> cities = usersManager.getCities();
    List<String> countries = usersManager.getCountries();
%>


<div class="search-inputs-section">
    <div class="container" style="position: relative;">
        <h3 class="section-header"> Search Filter: </h3>
        <form style="margin-left: 20px" action="/DisplayTopUsers" method="get">
            <div class="input-items" id="input-items">
                <%if(loggedInUser != null) {%>
                <div class="search-item"
                    style="flex-direction: row;
                    justify-content: center;
                    align-items: center">
                    <label for="country" style="margin: 20px"><b> Search in your friends </b></label>
                    <input type="checkbox" name="is_friend">
                </div>
                <input type="hidden" value="<%=loggedInUser.getID()%>" name="user_id">
                <%}%>

                <div class="search-item"
                    style="flex-direction: row;
                    justify-content: center;
                    align-items: center">
                    <label for="country" style="margin: 20px"><b> search in Authors </b></label>
                    <input type="checkbox" name="is_author">
                </div>

                <div class="search-item">
                    <label for="locationType"><b>Choose location type</b></label>
                    <select onchange="getLocType(this)" class="drop-down"
                            id="locationType" name="location_type">
                        <option value="0">-</option>
                        <option value="1">City</option>
                        <option value="2">Country</option>
                    </select>
                </div>
                <div class="search-item"id="city" style="display: none">
                    <label for="city"><b> Cities </b></label>
                    <select class="drop-down" name="city">
                        <option value="empty">-</option>
                        <% for(int i = 1; i <= cities.size(); i++) {%>
                            <option value="<%=cities.get(i-1)%>"><%=cities.get(i-1)%></option>
                        <%}%>
                    </select>
                </div>
                <div class="search-item"id="country"style="display: none">
                    <label for="country"><b> Countries</b></label>
                    <select class="drop-down" name="country">
                        <option value="empty">-</option>
                        <% for(int i = 1; i <= countries.size(); i++) {%>
                            <option value="<%=countries.get(i-1)%>"><%=countries.get(i-1)%></option>
                        <%}%>
                    </select>
                </div>
                <div class="search-item"
                        style=" justify-content: center;
                        position: absolute;
                        right: 0;
                        top: 19px;
                        align-items: center">
                    <button type="submit" class="search-bth"><i class="fa fa-search"></i></button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="found-users-section">
    <div class="container" style="position: relative;">
        <h3 class="section-header"> Found Users:</h3>
        <div class="found-elems-container">
            <% for(User currUser : topUsers) { %>
            <div class="found-user"
                 onclick="redirectToProfile(<%=currUser.getID()%>)">
                <img class= "found-user-small-image" src="<%=currUser.getPhotoURL()%>"
                     onerror="this.src='/web/images/common/defProfPic.jpg';" style="margin-left: 0">
                <div class= "found-user-small-description-block" style="position: relative">
                    <h3 class= "found-user-title" style="font-size: 16px">
                        <%=currUser.getUsername()%>
                    </h3>
                    <p class="found-user-small-description" style="overflow: hidden; height: 75px; font-size: 14px">
                        <%=currUser.getFirstName()%> <%=currUser.getLastName()%>
                    </p>
                    <p class="found-user-small-description" style="overflow: hidden; height: 75px;">
                        <%=currUser.getEmail()%>
                    </p>
                    <p class="found-user-small-description" style="overflow: hidden; height: 75px; font-size: 14px">
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


<form id="display-profile-form" action="/Profile" method="get">
    <input id="profile-id-holder" name="id">
</form>

<script>

    function redirectToQuizStart(id){
        const inp=document.getElementById("currQuizId"+id);
        inp.value=id;
        const form = document.getElementById("to_display_start_quiz_form");
        document.getElementById("to_display_start_quiz_elem").value = id;
        form.submit();
    }

    function redirectToProfile(id){
        const form = document.getElementById("display-profile-form");
        document.getElementById("profile-id-holder").value = id;
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