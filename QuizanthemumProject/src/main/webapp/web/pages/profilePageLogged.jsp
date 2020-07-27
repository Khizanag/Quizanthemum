<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Quizanthemum </title>
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="../styles/common.css">
	<link rel="stylesheet" href="../styles/homePage.css">
	<link rel="stylesheet" href="../styles/breakpoints.css">
<%--    <link rel="stylesheet" href="../styles/quizCreation.css">--%>

    <link rel="stylesheet" href="../styles/profilePage.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="../js/profileStuff.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@700&display=swap" rel="stylesheet">
	<script>
        document.cookie = "AC-C=ac-c;expires=Fri, 31 Dec 9999 23:59:59 GMT;path=/;SameSite=Lax";

        function openSearch() {
			window.location.href = "search.html";		  	
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
    <jsp:include page="LogedInHandler.jsp"></jsp:include>
</head>
<body>
    <header class= "header-section">
        <div class="container header">
            <div class="header-left">
                <img class="logo" src="../images/common/icon.png">
			        	<h1 class="logo-text">Quizanthemum</h1>
			      </div>

            <ul class="header-right">
                <img class = "profile-picture" id="small-prof-pic-id" src = "../images/common/defProfPic.jpg" onerror="this.src='../images/common/defProfPic.jpg';" onclick="redirectToProfPage()">
                <span class = "profile-name-text" onclick="redirectToProfPage()">Ze K1ng</span>
            </ul>
        </div>
    </header>

	<div class="nav-section">
		<div class="container manu">
			<nav class="nav">
				<ul class="nav-items">
                    <a class="nav-item" target="_self" href="/">HOME</a>
                    <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">TOP USERS</a>
                    <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">QUIZ LIST</a>
                    <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">ABOUT US</a>
                    <a class="nav-item" target="_self" href="/web/pages/QuizCreation.jsp">CREATE QUIZ</a>
                    <button class="friend-list-btn" id="friend-list-btn-id" onclick="popupfriendList()">Friends</button>
                </ul>
			</nav>
			<div class="search-items">
				<input type="text" id="search-input" c placeholder="რა გაინტერესებთ..." name="search">
				<button type="submit" onClick="openSearch()"><i class="fa fa-search"></i></button>
			</div>
		</div>
	</div>
  
  <div class="friends-list-popup" id="friends-list-popup-id">
    <div class="overlay"></div>
    <div class="content">
      <div class="close-btn" onclick="popupfriendList()">&times;</div>
      <h1 style="color:orange">მეგობრები</h1>
      <br>
        <div class="friends-list">
            <div class = "friend-list-row">
                <span class="friend-name">მეგობარი0</span>
                <div class = "friend-challenge-remove-btns">
                    <button class="challenge-btn" id="challenge-btn-id" onclick="challengeFriend()">Challenge</button>
                    <button class="remove-btn" id="remove-btn-id" onclick="removeFriend(this)">Remove</button>
                </div>
            </div>
            <div class = "friend-list-row">
                <span class="friend-name">მეგობარი1</span>
                <div class = "friend-challenge-remove-btns">
                    <button class="challenge-btn" id="challenge-btn-id" onclick="challengeFriend()">Challenge</button>
                    <button class="remove-btn" id="remove-btn-id" onclick="removeFriend(this)">Remove</button>
                </div>
            </div>
            <div class = "friend-list-row">
                <span class="friend-name">მეგობარი2</span>
                <div class = "friend-challenge-remove-btns">
                    <button class="challenge-btn" id="challenge-btn-id" onclick="challengeFriend()">Challenge</button>
                    <button class="remove-btn" id="remove-btn-id" onclick="removeFriend(this)">Remove</button>
                </div>
            </div>
        </div>
    </div>
  </div>

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
                <div class="user-first-name">First Name: D</div>
                <div class = "user-last-name">Last Name: G</div>
                <div class =  "user-email">Mail: dgogi@gmail.com </div>
                <div class="user-mobile">Mobile Number: ******** </div>
                <div class="user-country">Country: Georgia  </div>
                <div class="user-city">City: Tbilisi</div>
            </div>
            <div class = "profile-info">
                <img class = "profile-picture-big" id="prof-pic-big-id"src = "../images/common/defProfPic.jpg" onerror="this.src='../images/common/defProfPic.jpg';">
                <button class="changeImageHoverBtn" onclick="changeImage()">change image</button>
                <div class="profile-name">Ze K1ng</div>
                <div class="profile-details">Ex-President Of USA</div>
                <div class="user-details">ADministrator</div>
            </div>
            <div class="profile-details-info">
                <div class="user-ranking">Rank:Infinity</div>
                <div class = "quizzes-played">Quizzes Played : 0</div>
                <div class =  "challenges-played">Challenges Played: 0</div>
                <div class="challenges-won">Challenges Won: 0</div>
                <div class="quizzes-made">Quizzes Made: 0 </div>
            </div>
        </div>

    </div>

  <div class = "top-quizzes-banner">
    <div class="players-top-quizzes">
      Your Top Played Quizzes
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
