<%@ page import="Controller.Classes.User.User" %>
<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> ქვიზის შექმნა </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="/web/images/common/icon.png"/>
    <link rel="stylesheet" href="/web/styles/quizCreation.css">
    <link rel="stylesheet" href="/web/styles/breakpoints.css">
    <link rel="stylesheet" href="/web/styles/common.css">

    <jsp:include page="/web/pages/LogedInHandler.jsp"/>
</head>

<body>

    <jsp:include page="/web/pages/PartPages/Header.jsp"/>
    <jsp:include page="/web/pages/PartPages/MenuBar.jsp"/>

    <form id="creation-section" class="creation-section" action="/StartQuizCreating" method="get">
        <div class="container bla">
            <h2>Create Your Quiz</h2>
            <p>Please fill given fields to create Quiz.</p>
            <hr>

            <div class="input-items" id="input-items">
                <label><b>Quiz Name</b></label>
                <input type="text" placeholder="Enter Quiz Name"
                       name="quiz_name" id="quiz_name" required>

                <jsp:include page="/web/pages/PartPages/CategoriesForQuestions.jsp"/>

                <label for="description"><b>Quiz Description</b></label>
                <input type="text" placeholder="Please enter general description of your Quiz"
                       name="quiz_description" id="quiz_description" required>

                <label><b>upload quiz logo/icon</b></label>
                <div class="upload-image-section">
                    <input type="file"  accept="image/*" name="image" id="file"
                           onchange="loadFile(event)"
                           style="display: none;"
                    >
<%--                    <label class="button upload" type="button" for="file">ატვირთე ფოტო</label>--%>
                    <div class="upload-image-container">
                        <input type="text" placeholder="ფოტოს URL" name="quiz_icon_url" id="quiz_icon_url" required>
                        <label class="url-button upload" type="button"
                               onclick="uploadImage(event)" id="question_image_url">
                            upload
                        </label>
                    </div>
                    <img id="output" width="100" />
                </div>

                <label for="description"><b>Comment for optimization</b></label>
                <input type="text" placeholder="How do you want to constuct your data"
                       name="description" id="description">

                <label><b>Automatically generate the sequence of questions</b></label>
                <input class="checkbox" type="checkbox"
                       name="quiz_must_shuffle" id="quiz_must_shuffle" checked>
            </div>
            <hr>

            <button class="button" type="submit">Continue</button>
        </div>
    </form>

    <jsp:include page="/web/pages/PartPages/Footer.jsp"/>
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
