<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="static Configs.Config.MANAGERS_MANAGER_STR" %>
<%@ page import="Model.Managers.QuizManager" %>
<%@ page import="Controller.Classes.Quiz.Quiz" %>
<%@ page import="static Configs.Config.QUIZ_MANAGER_STR" %>
<%@ page import="Controller.Classes.User.User" %>
<%@ page import="Controller.Classes.Quiz.QuizEvent" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="Controller.Classes.Quiz.Question.Question" %>
<%@ page import="java.util.*" %>
<%@ page import="Controller.Classes.Quiz.Question.QuestionEvent" %>
<%@ page import="static Controller.Classes.Quiz.Question.QuestionTypes.STANDARD" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static Controller.Classes.Quiz.Question.QuestionTypes.FILL_BLANK" %>
<%@ page import="static Controller.Classes.Quiz.Question.QuestionTypes.*" %>
<%@ page import="Tools.Pair" %><%--<%@ page import="static Configs.Config.LAST_CREATED_QUIZ" %>--%>
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
    <%
            ServletContext context = request.getServletContext();
            ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
            QuizManager quizManager = (QuizManager) managersManager.getManager(QUIZ_MANAGER_STR);
            Quiz quiz = quizManager.getQuiz(Integer.parseInt(request.getParameter("quiz_id")));
            QuizEvent quizEvent = (QuizEvent) request.getServletContext().getAttribute("quiz_event");
            User user = (User)request.getServletContext().getAttribute("logedInUser");
            int questionsNumber= quiz.getQuestionsCount();

    %>

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
          <img class="quizz-img" src="<%=quiz.getIconUrl()%>"  onerror="this.src='/web/images/common/Quiz1.jpg';">
          <div class="quiz-description">
              <%=quiz.getDescription()%>
          </div>
        </div>
        <div class="overall-quiz-details">
          <p>Your Score: <%=truncateDecimal(quizEvent.getUserScore(), 2)%>/<%=truncateDecimal(quiz.getMaxScore(), 2)%></p>
        </div>
        <div class="questions">
          <%
           quizEvent.resetQuestionEventIterator();
           int i = 0;
            while(quizEvent.hasNextQuestionEvent()){
                QuestionEvent qe = quizEvent.getNextFilledQuestionEvent();
                Question currQuest = qe.getQuestion();
          %>
          <div class="question">
            <h3>კითხვა <%=i+1%></h3>
            <br>
            <div class="question-text-statement">
              <% if(currQuest.isPictureQuestion()) { %>
                <img sr="<%=currQuest.getPictureStatementURL()%>" class ="small-question-image">
              <%}%>
             <p><%=currQuest.getTextStatement()%></p>
            </div>
            <br>
            <div class="answers">
              <span>
                <span>სწორი პასუხები:</span>
                <div class = "correct-answers">
                  <%
                    int type = currQuest.getType();
                    String correctAnswer="" ;
                    if(type==STANDARD){
                  %>
                  <p>No right ans</p>
                    <%} else if(type ==MATCHING){
                        Set<Pair<String>> ansPairs= currQuest.getMatchingAnswers();
                        for(Pair<String> pr :ansPairs ){
                            String pairs=pr.getFirst()+" : "+pr.getSecond();
                            out.print("<p>");
                            out.print(pairs);
                            out.print("</p>");
                        }
                    }else{
                        List<String> correct_ans = currQuest.getAnswers();
                        for(String st : correct_ans) {
                            out.print("<p>");
                            out.print(st);
                            out.print("</p>");
                        }
                    } %>
                </div>
              </span>
              <span>
                <span>Your Answers:</span>
                <div class = "user-answers">
                    <%
                        List<String> user_ans =qe.getUserAnswers();
                        for(String st : user_ans){
                            out.print("<p>");
                            out.print(st);
                            out.print("</p>");
                        }
                    %>
                </div>
              </span>
            </div>
          </div>
          <%
            i++;
            }
          %>
        <button class="back-to-prof-page" id="back-to-prof-page-id" onclick="gotoProfPage()">
            <span>Back To My Profile</span>
        </button>
      </div>
    </div>
  </main>
  <jsp:include page="/web/pages/Footer.jsp"></jsp:include>
</body>

<script>
    let score = parseInt(document.getElementById("userScore-id"));
    console.log("score: ", score);
</script>
<%!
  private static BigDecimal truncateDecimal(double x, int numberofDecimals)
  {
    if ( x > 0) {
      return new BigDecimal(String.valueOf(x)).setScale(numberofDecimals, BigDecimal.ROUND_FLOOR);
    } else {
      return new BigDecimal(String.valueOf(x)).setScale(numberofDecimals, BigDecimal.ROUND_CEILING);
    }
  }
%>