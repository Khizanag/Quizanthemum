<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Controller.Classes.User.User" %>
<html lang="ka">
<head>
    <meta charset="UTF-8">
    <title> Quizanthemum </title>
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="../styles/common.css">
	<link rel="stylesheet" href="../styles/homePage.css">
	<link rel="stylesheet" href="../styles/breakpoints.css">
    <link rel="stylesheet" href="../styles/quizCreation.css">
    <link rel="stylesheet" href="../styles/profilePage.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="/web/js/profileStuff.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@700&display=swap" rel="stylesheet">

    <jsp:include page="/web/pages/LogedInHandler.jsp"></jsp:include>
    <% User user = (User)request.getServletContext().getAttribute("logedInUser");%>

    <script>

        function openSearch() {
			window.location.href = "SearchPage.jsp";
		}

        function changeImage(){
            console.log('asd');
            document.getElementById("change-image").classList.toggle("active");
            document.getElementById('photo-url').value="";
            document.getElementById('output').src="";
        }
        function previewImage(){
		    const url=$("#image-url").val();
            $("#preview-image").attr("src",url);
        }
        function  loadFile() {
            var image = document.getElementById('output');
            image.height = 300;
            image.src = URL.createObjectURL(event.target.files[0]);
            document.getElementById('photo-url').value = image.src;
        }
        function uploadImage(event) {
            if(document.getElementById('photo-url').value != "") {
                var image = document.getElementById('output');
                image.height = 300;
                image.src = document.getElementById('photo-url').value;
            }
        }
        function submitPhoto(){
            if(document.getElementById('photo-url').value != ""){
                let image = document.getElementById("small-prof-pic-id");
                image.src = document.getElementById('photo-url').value;
                image = document.getElementById("prof-pic-big-id");
                image.src = document.getElementById('photo-url').value;
                changeImage();
            }
        }
	</script>
</head>

<body>

    <jsp:include page="/web/pages/Header.jsp"></jsp:include>
    <jsp:include page="/web/pages/MenuBar.jsp"></jsp:include>
    <jsp:include page="/web/pages/FriendsListPopup.jsp"></jsp:include>

    <script>console.log("vnaxot nalia tu ara"); </script>
    <% if(user == null){ %>
        <jsp:include page="/web/pages/YouShouldLogInPart.jsp"></jsp:include>
    <% } else { %>

    <div class="change-image-popup" id="change-image">
        <div class="overlay"></div>
        <div class="content">
            <div class="close-btn" onclick="changeImage()">&times;</div>
            <h2 style="color:white">ატვირთე ფოტო</h2>
            <br>
            <div class="upload-image-section-cl">
                <input type="file"  accept="image/*" name="image" id="file"
                       onchange="loadFile(event)"
                       style="display: none;"
                >
                <label class="button upload upl-btn" type="button" for="file">ატვირთე ფოტო</label>
                <label class="button upload" type="button"
                       onclick="uploadImage(event)" id="url-button" style="width:300px">
                    ან შეიყვანეთ ლინკი ასატვირთად
                </label>
                <input type="text" placeholder="ფოტოს URL" name="photo-url" id="photo-url" required style="width:200px" >
                <img id="output" src="" style="width:300px;height:220px;margin-top: 5px;">
                <button class="button upload upl-btn" onclick="submitPhoto()">Submit</button>

            </div>
        </div>
    </div>

    <div class = "profile-info-wrapper">
        <div class ="profile-info-container">
            <div class ="profile-details-info">
                <div class="user-first-name"><%="სახელი: "+user.getFirstName()%></div>
                <div class = "user-last-name"><%="გვარი: "+user.getLastName()%></div>
                <div class =  "user-email"><%="ელ-ფოსტა: "+user.getEmail()%></div>
                <% String mobNum = user.getMobileNumber();
                    if(mobNum == null){
                        mobNum = "*******";
                    }
                    String country = user.getCountry();
                    if(country == null) {
                        country = "Unknown";
                    }
                    String city = user.getCity();
                    if(city == null){
                        city = "Unknown";
                    }
                %>
                <div class="user-mobile"><%="მობ.ნომერი: "+mobNum%></div>
                <div class="user-country"><%="ქვეყანა: "+ country%></div>
                <div class="user-city"><%="ქალაქი: "+city %></div>
            </div>
            <div class = "profile-info">
                <img class = "profile-picture-big" id="prof-pic-big-id"src = "../images/common/defProfPic.jpg" onerror="this.src='../images/common/defProfPic.jpg';">
                <button class="changeImageHoverBtn" onclick="changeImage()">change image</button>
                <div class="profile-name"><%=user.getUsername()%></div>
                <%
                    int role = user.getRole();
                    String status="";
                    if(role==1){
                        status="Default User";
                    }else if(role==2){
                        status="Moderator";
                    }else if(role ==3){
                        status="Administrator";
                    }
                %>
                <div class="user-details"><%=status%></div>
            </div>
            <div class="profile-details-info">
                <div class = "quizzes-played"><%="ნათამაშები ქვიზები: "+user.getQuizzesPlayed()%></div>
                <div class =  "challenges-played"><%="ნათამაშები ჩელენჯები: "+user.getChallengesPlayed()%></div>
                <div class="challenges-won"><%="მოგებული ჩელენჯები: "+user.getChallengesWon()%></div>
                <%
                    if(role>1){
                        out.print("<div class='quizzes-made'> ");
                        out.print("შედგენილი ქვიზები: ");
                        out.print(user.getQuizzesMade());
                        out.print("</div>");
                    }
                %>
                <div class = "Creation-date"><%="პროფილის შექმნის თარიღი: <br><br>"+user.getRegistrationDate()%></div>
            </div>
        </div>

    </div>

    <div class = "top-quizzes-banner">
        <div class="players-top-quizzes">
            ნათამაშები ტოპ ქვიზები
        </div>
    </div>
    <main class="main">
        <div class="top-quizzes-container">
            <div class= "top-quiz-items">
                <div class="top-quiz-item" onclick="redirectToQuiz()">
                    <img class= "quiz-small-image" src="../slider/img/Quiz1.jpg" onclick="redirectToQuiz()">
                    <div class= "quiz-small-description-block">
                        <h3 class= "quiz-title" >
                            სახელი
                        </h3><br>
                        <p class="quiz-small-description">
                            აღწერა ჯნსდანსდნასდ
                            ასდაკსდალკსდ;ლაკდს
                            ასლდ;ა
                        </p>
                    </div>
                    <div class = "quiz-score">20/20</div>
                </div>
                <div class="top-quiz-item" onclick="redirectToQuiz()">
                    <img class= "quiz-small-image" src="../slider/img/Quiz1.jpg" onclick="redirectToQuiz()">
                    <div class= "quiz-small-description-block">
                        <h3 class= "quiz-title" >
                            სახელი
                        </h3><br>
                        <p class="quiz-small-description">
                            აღწერა ჯნსდანსდნასდ
                            ასდაკსდალკსდ;ლაკდს
                            ასლდ;ა
                        </p>
                    </div>
                    <div class = "quiz-score">20/20</div>
                </div>
                <div class="top-quiz-item" onclick="redirectToQuiz()">
                    <img class= "quiz-small-image" src="../slider/img/Quiz1.jpg" onclick="redirectToQuiz()">
                    <div class= "quiz-small-description-block">
                        <h3 class= "quiz-title" >
                            სახელი
                        </h3><br>
                        <p class="quiz-small-description">
                            აღწერა ჯნსდანსდნასდ
                            ასდაკსდალკსდ;ლაკდს
                            ასლდ;ა
                        </p>
                    </div>
                    <div class = "quiz-score">20/20</div>
                </div>
                <div class="top-quiz-item" onclick="redirectToQuiz()">
                    <img class= "quiz-small-image" src="../slider/img/Quiz1.jpg" onclick="redirectToQuiz()">
                    <div class= "quiz-small-description-block">
                        <h3 class= "quiz-title" >
                            სახელი
                        </h3><br>
                        <p class="quiz-small-description">
                            აღწერა ჯნსდანსდნასდ
                            ასდაკსდალკსდ;ლაკდს
                            ასლდ;ა
                        </p>
                    </div>
                    <div class = "quiz-score">20/20</div>
                </div>
            </div>
        </div>
    </main>

    <% } %>

	<jsp:include page="/web/pages/Footer.jsp"></jsp:include>
</body>
</html>