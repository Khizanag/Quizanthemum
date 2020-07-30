<%--<%@ page import="static Configs.Config.LAST_CREATED_QUIZ" %>--%>
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
	<script src="/web/pages/js/profileStuff.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Ranchers&display=swap" rel="stylesheet">
  <script>


    function gotoProfPage() {
      window.location.href="profilePageLogged.jsp";
    }
    function openSearch() {
      window.location.href = "SearchPage.jsp";
    }
	</script> 

</head>
<body>
    <jsp:include page="/web/pages/Header.jsp"></jsp:include>
    <jsp:include page="/web/pages/MenuBar.jsp"></jsp:include>

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
  <jsp:include page="/web/pages/Footer.jsp"></jsp:include>
</body>
