<%@ page import="Controller.Classes.OtherClasses.User" %>
<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Creating Quiz </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
    <link rel="stylesheet" href="../styles/common.css">
    <link rel="stylesheet" href="../styles/quizCreation.css">
    <link rel="stylesheet" href="../styles/breakpoints.css">
    <link rel="stylesheet" href="../styles/rules.css">

    <%
        if(request.getServletContext().getAttribute("logedInUser") == null){
            for(Cookie cookie : request.getCookies()){
                if(cookie.getName().equals("logedInUserID")){
                    UsersManager usersManager = (UsersManager) request.getServletContext().getAttribute(USERS_MANAGER_STR);
                    User logedInUser = usersManager.getUser(Integer.parseInt(cookie.getValue()));
                    request.getServletContext().setAttribute("logedInUser", logedInUser);
                }
            }
        }
    %>
</head>
<body>
<header class= "header-section">
    <div class="container header">
        <div class="header-left">
            <img class="logo"src="../images/common/icon.png">
            <h1 class="logo-text">Quizanthemum</h1>
        </div>

        <ul class="header-right">
            <div class= "icon-cirkle">
                <a class="fa fa-instagram" target="_blank" href="https://www.instagram.com/"></a>
            </div>
            <div class= "icon-cirkle">
                <a class="fa fa-facebook"  target="_blank" href="https://www.facebook.com/"></a>
            </div>
            <div class= "icon-cirkle">
                <a class="fa fa-youtube"  target="_blank" href="https://www.youtube.com/"></a>
            </div>
        </ul>

    </div>
</header>

<div class="nav-section">
    <div class="container">
        <nav class="nav">
            <ul class="nav-items">
                <a class="nav-item" target="_self" href="/">HOME</a>
                <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">TOP USERS</a>
                <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">QUIZ LIST</a>
                <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">ABOUT US</a>
            </ul>
        </nav>
    </div>
</div>

<form id="creation-section" class="creation-section">
    <div class="container bla">
        <h2>შექმენი შენი ქვიზი</h2>
        <p>ქვიზის შესაქმნელად შეავსეთ ქვემოთ მოყვანილი ველები.</p>
        <hr>

        <div class="input-items" id="input-items">
            <label for="name"><b>ქვიზის სახელი</b></label>
            <input type="text" placeholder="შეიყვანეთ ქვიზის დასახელება" name="name" id="name" required>

            <label for="description"><b>ქვიზის აღწერა</b></label>
            <input type="text" placeholder="გთხოვთ შეუყვანოთ თქვენი ქვიზის ზოგადი აღწერა"
                   name="description" id="description" required>

            <label for="image"><b>ატვირთეთ ქვიზის ლოგო/აიქონი</b></label>
            <div class="upload-image-section">
                <input type="file"  accept="image/*" name="image" id="file"
                       onchange="loadFile(event)"
                       style="display: none;"
                >
                <label class="button upload" type="button" for="file">ატვირთე ფოტო</label>
                <div class="upload-image-container">
                    <label class="button upload" type="button"
                           onclick="uploadImage(event)" id="url-button">
                        შეიყვანეთ URL ასატვირთად
                    </label>
                    <input type="text" placeholder="ფოტოს URL" name="photo-url" id="photo-url" required>
                </div>
                <img id="output" width="100" />
            </div>

            <label for="description"><b>კომენტარი ოპტიმიზაციისთვის</b></label>
            <input type="text" placeholder="როგორ გსურთ მონაცემების კონსტრუირება"
                   name="description" id="description">

            <label for="boolean"><b>კითხვების თანმიმდევრობის აუტომატური გენერირება</b></label>
            <input class="checkbox" type="checkbox" name="checkbox" id="checkbox" checked>
        </div>
        <hr>

        <button class="button" type="button" onclick="checkAndRedirect()">გაგრძელება</button>
    </div>
</form>

<footer	class= "footer-section">
    <div class= "container">
        <div class= "footer-items">
            <div class= "footer left">
                All Right Reserved
            </div>
            <div class= "footer rigth">
                Quizanthemum By Our Team
            </div>
        </div>
    </div>
</footer>
</body>
<script>
    function uploadImage(event) {
        if(document.getElementById('photo-url').value != "") {
            var image = document.getElementById('output');
            image.height = 100;
            image.src = document.getElementById('photo-url').value;
        }
    }
    let loadFile = function(event) {
        var image = document.getElementById('output');
        image.height = 100;
        image.src = URL.createObjectURL(event.target.files[0]);
        document.getElementById('photo-url').value = image.src;
    };

    function checkAndRedirect() {
        let name = document.getElementById('name').value != '';
        let description = document.getElementById('description').value != '';
        let url = document.getElementById('photo-url').value != '';
        if((name && description && url)) {
            window.location.href = "AddingQuestions.jsp";
        }
    }
</script>
