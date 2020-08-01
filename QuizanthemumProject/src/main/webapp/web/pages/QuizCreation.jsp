<%@ page import="Controller.Classes.User.User" %>
<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Creating Quiz </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="/web/images/common/icon.png"/>
    <link rel="stylesheet" href="/web/styles/quizCreation.css">
    <link rel="stylesheet" href="/web/styles/breakpoints.css">
    <link rel="stylesheet" href="/web/styles/common.css">

    <jsp:include page="/web/pages/LogedInHandler.jsp"></jsp:include>
</head>

<body>

    <jsp:include page="/web/pages/Header.jsp"></jsp:include>
    <jsp:include page="/web/pages/MenuBar.jsp"></jsp:include>

    <form id="creation-section" class="creation-section" action="../../QuizCreationStarted" method="get">
        <div class="container bla">
            <h2>შექმენი შენი ქვიზი</h2>
            <p>ქვიზის შესაქმნელად შეავსეთ ქვემოთ მოყვანილი ველები.</p>
            <hr>

            <div class="input-items" id="input-items">
                <label><b>ქვიზის სახელი</b></label>
                <input type="text" placeholder="შეიყვანეთ ქვიზის დასახელება"
                       name="quiz_name" id="quiz_name" required>

                <jsp:include page="/web/pages/PartPages/CategoriesForQuestions.jsp"/>

                <label for="description"><b>ქვიზის აღწერა</b></label>
                <input type="text" placeholder="გთხოვთ შეუყვანოთ თქვენი ქვიზის ზოგადი აღწერა"
                       name="quiz_description" id="quiz_description" required>

                <label><b>ატვირთეთ ქვიზის ლოგო/აიქონი</b></label>
                <div class="upload-image-section">
                    <input type="file"  accept="image/*" name="image" id="file"
                           onchange="loadFile(event)"
                           style="display: none;"
                    >
                    <label class="button upload" type="button" for="file">ატვირთე ფოტო</label>
                    <div class="upload-image-container">
                        <label class="url-button upload" type="button"
                               onclick="uploadImage(event)" id="question_image_url">
                            შეიყვანეთ URL ასატვირთად
                        </label>
                        <input type="text" placeholder="ფოტოს URL" name="quiz_icon_url" id="quiz_icon_url" required>
                    </div>
                    <img id="output" width="100" />
                </div>

                <label for="description"><b>კომენტარი ოპტიმიზაციისთვის</b></label>
                <input type="text" placeholder="როგორ გსურთ მონაცემების კონსტრუირება"
                       name="description" id="description">

                <label><b>კითხვების თანმიმდევრობის აუტომატური გენერირება</b></label>
                <input class="checkbox" type="checkbox"
                       name="quiz_comment" id="quiz_comment" checked>
            </div>
            <hr>

            <button class="button" type="submit">გაგრძელება</button>
        </div>
    </form>

    <jsp:include page="/web/pages/Footer.jsp"></jsp:include>
</body>

<script>
    function uploadImage(event) {
        if(document.getElementById('quiz_icon_url').value != "") {
            var image = document.getElementById('output');
            image.height = 100;
            image.src = document.getElementById('quiz_icon_url').value;
        }
    }
    let loadFile = function(event) {
        var image = document.getElementById('output');
        image.height = 100;
        image.src = URL.createObjectURL(event.target.files[0]);
        document.getElementById('quiz_icon_url').value = $('img')[0].getAttribute('src');
    };

</script>
