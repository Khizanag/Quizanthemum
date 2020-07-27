<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Quizanthemum </title>
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="../styles/common.css">
	<link rel="stylesheet" href="../styles/homePage.css">
    <link rel="stylesheet" href="../styles/breakpoints.css">
    <link rel="stylesheet" href="../styles/quizzSummaryPage.css">
    <link rel="stylesheet" href="../styles/profilePage.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="../js/profileStuff.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Ranchers&display=swap" rel="stylesheet">
  <script>


    function gotoProfPage() {
      window.location.href="profilePageLogged.jsp";
    }
		function openSearch() {
			window.location.href = "search.html";		  	
		}
	</script> 

</head>
<body>
    <header class= "header-section">
        <div class="container header">
            <div class="header-left">
                <img class="logo" src="../images/common/icon.png">
			        	<h1 class="logo-text">Quizanthemum</h1>
			      </div>
			
            <ul class="header-right">
              <img class = "profile-picture" src = "../images/common/defProfPic.jpg" onclick="redirectToProfPage()">
              <span class = "profile-name-text" onclick="redirectToProfPage()">Ze K1ng</span>
            </ul>	
        </div>
    </header>

	<div class="nav-section">
		<div class="container manu">
			<nav class="nav">
				<ul class="nav-items">
					< <a class="nav-item" target="_self" href="/">HOME</a>
                    <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">TOP USERS</a>
                    <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">QUIZ LIST</a>
                    <a class="nav-item" target="_self" href="https://www.youtube.com/?hl=ka&gl=GE">ABOUT US</a>
                    <a class="nav-item" target="_self" href="/web/pages/QuizCreation.jsp">CREATE QUIZ</a>
                    <button class="friend-list-btn" id="friend-list-btn-id" onclick="popupfriendList()">Friends</button>
        </ul>
			</nav>
			<div class="search-items">
				<input type="text" id="search-input" placeholder="რა გაინტერესებთ..." name="search">
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
      <div class = "friend-list-row">
        <span>მეგობარი0</span>
        <div class = "friend-challenge-remove-btns">
          <button class="challenge-btn" id="challenge-btn-id" onclick="challengeFriend()">Challenge</button>
          <button class="remove-btn" id="remove-btn-id" onclick="removeFriend(this)">Remove</button>
        </div>
      </div>
      <div class = "friend-list-row">
        <span>მეგობარი1</span>
        <div class = "friend-challenge-remove-btns">
          <button class="challenge-btn" id="challenge-btn-id" onclick="challengeFriend()">Challenge</button>
          <button class="remove-btn" id="remove-btn-id" onclick="removeFriend(this)">Remove</button>
        </div>
      </div>
      <div class = "friend-list-row">
        <span>მეგობარი2</span>
        <div class = "friend-challenge-remove-btns">
          <button class="challenge-btn" id="challenge-btn-id" onclick="challengeFriend()">Challenge</button>
          <button class="remove-btn" id="remove-btn-id" onclick="removeFriend(this)">Remove</button>
        </div>
      </div>
    </div>
  </div>

  <main>
    <div class ="quiz-summary-wrapper">
      <div class = "quiz-container">
        <div class="quizz-main">
          <img class="quizz-img" src="../slider/img/Quiz2.jpg">
          <div class="quiz-description">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut, dolorum odit velit at magni molestias ab et nihil eaque voluptas, numquam possimus. Temporibus expedita minima repellat esse commodi soluta dignissimos?
          </div>
        </div>
        <div class="overall-quiz-details">
          <p>Your Score 15/20</p>
        </div>
        <div class="questions">
          <div class="question">
            <h3>Question 1</h3>
            <p>Question content</p>
            <div class="answers">
              <span>
                <span>Correct Answers:</span>
                <div class = "correct-answers">
                  <p>asdasda</p>
                </div>
              </span>
              <span>
                <span>Your Answers:</span>
                <div class = "user-answers">
                  <p>asdasda</p>
                </div>
              </span>
            </div>
          </div>
          <div class="question">
            <h3>Question 2</h3>
            <p>Question content</p>
            <div class="answers">
              <span>
                <span>Correct Answers:</span>
                <div class = "correct-answers">
                  <p>aandandas</p>
                  <p>aandandas</p>
                  <p>aandandas</p>
                  <p>asdasda</p>
                </div>
              </span>
              <span>
                <span>Your Answers:</span>
                <div class = "user-answers">
                  <p>asdasda</p>
                  <p>asadasdasda</p><p>asadasdasda</p><p>asadasdasda</p>
                </div>
              </span>
            </div>
          </div>
          <div class="question">
            <h3>Question 3</h3>
            <p>Question content</p>
            <div class="answers">
              <span>
                <span>Correct Answers:</span>
                <div class = "correct-answers">
                  <p>asdasda</p>
                  <p>asadasdasda</p>
                </div>
              </span>
              <span>
                <span>Your Answers:</span>
                <div class = "user-answers">
                  <p>asdasda</p>
                  <p>asadasdasda</p>
                </div>
              </span>
            </div>
          </div>
        </div>
        <button class="back-to-prof-page" id="back-to-prof-page-id" onclick="gotoProfPage()">
            <span>Back To My Profile</span>
        </button>
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
