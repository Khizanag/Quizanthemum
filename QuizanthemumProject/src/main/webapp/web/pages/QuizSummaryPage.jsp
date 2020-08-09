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
<%@ page import="Tools.Pair" %>
<%@ page import="static Configs.Config.*" %><%--<%@ page import="static Configs.Config.LAST_CREATED_QUIZ" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Quizanthemum </title>
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/web/styles/common.css">
    <link rel="stylesheet" href="/web/styles/homePage.css">
    <link rel="stylesheet" href="/web/styles/breakpoints.css">
    <link rel="stylesheet" href="/web/styles/quizzSummaryPage.css">
    <link rel="stylesheet" href="/web/styles/profilePage.css">
    <link rel="stylesheet" href="/web/styles/quizCreation.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Ranchers&display=swap" rel="stylesheet">
    <%
            ServletContext context = request.getServletContext();
            ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
            QuizManager quizManager = (QuizManager) managersManager.getManager(QUIZ_MANAGER_STR);
            QuizEvent quizEvent = (QuizEvent) request.getServletContext().getAttribute("quiz_event");
            Quiz quiz = quizEvent.getQuiz();
            User user = (User)request.getServletContext().getAttribute(LOGGED_IN_USER);
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

    <div class="quiz-summary-wrapper">
        <div class="quiz-container">
            <form class="quiz-container after" id="after" action="/GetRating" method="get">
                <div class="quizz-main">
                    <div class="quiz-description">
                        <%=quiz.getDescription()%>
                    </div>
                    <img class="quizz-img" src="<%=quiz.getIconUrl()%>"
                         onerror="this.src='/web/images/common/Quiz1.jpg';">
                </div>
                <% if(!quizManager.isRatedBy(quiz.getID(), user.getID()) && !quizEvent.isPracticeMode()){%>
                    <div class="quiz-rating-section">
                        <div class="container">
                            <h2 class="rating-title"> ქვიზის შეფასება </h2>
                            <div class="rating-icons-holder">
                                <ul class="rating-icons">
                                    <a class="fa fa-star-o" id="1"
                                       style="font-size: xx-large; margin-right: 5px"
                                       onclick="grade(this)"></a>
                                    <a class="fa fa-star-o" id="2"
                                       style="font-size: xx-large; margin-right: 5px"
                                       onclick="grade(this)"></a>
                                    <a class="fa fa-star-o" id="3"
                                       style="font-size: xx-large; margin-right: 5px"
                                       onclick="grade(this)"></a>
                                    <a class="fa fa-star-o" id="4"
                                       style="font-size: xx-large; margin-right: 5px"
                                       onclick="grade(this)"></a>
                                    <a class="fa fa-star-o" id="5"
                                       style="font-size: xx-large; margin-right: 5px"
                                       onclick="grade(this)"></a>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" value="-1" id="stars_rating" name="stars_rating">
                    <input type="hidden" value="<%=quiz.getID()%>" id="quiz_id" name="quiz_id">
                    <input type="hidden" value="<%=user.getID()%>" id="user_id" name="user_id">
                    <button class="back-to-prof-page"
                            type="submit"
                            style="margin-top: 10px">
                        შეფასება
                    </button>
                <%}%>
            </form>


            <div class="before" id="before">
                <div class="overall-quiz-details">
                    <p>Your Total Score: <%=truncateDecimal(quizEvent.getUserScore(), 2)%>
                        /<%=truncateDecimal(quiz.getMaxScore(), 2)%>
                    </p>
                </div>
                <div class="questions">
                    <%
                        quizEvent.resetQuestionEventIterator();
                        int i = 0;
                        while (quizEvent.hasNextQuestionEvent()) {
                            QuestionEvent qe = quizEvent.getNextFilledQuestionEvent();
                            Question currQuest = qe.getQuestion();
                    %>
                    <div class="question">
                        <h3>კითხვა <%=i + 1%></h3>
                        <div class="question-text-statement">
                            <% if (currQuest.isPictureQuestion()) { %>
                            <img sr="<%=currQuest.getPictureStatementURL()%>" class="small-question-image">
                            <%}%>
                            <p><%=currQuest.getTextStatement()%></p>
                        </div>
                        <p style="padding-top: 0"> ავტორის კომენტარი: <%=currQuest.getComment()%></p>
                        <p style="padding-top: 0"> შეკითხვის წყარო: <%=currQuest.getSource()%></p>
                        <div class="answers">
                  <span>
                    <span>სწორი პასუხები:</span>
                    <div class="correct-answers">
                      <%
                          int type = currQuest.getType();
                          String correctAnswer = "";
                          if (type == STANDARD) {
                      %>
                      <p>No right ans</p>
                        <%
                            } else if (type == MATCHING) {
                                Set<Pair<String>> ansPairs = currQuest.getMatchingAnswers();
                                for (Pair<String> pr : ansPairs) {
                                    String pairs = pr.getFirst() + " : " + pr.getSecond();
                                    out.print("<p>");
                                    out.print(pairs);
                                    out.print("</p>");
                                }
                            } else {
                                List<String> correct_ans = currQuest.getAnswers();
                                for (String st : correct_ans) {
                                    out.print("<p>");
                                    out.print(st);
                                    out.print("</p>");
                                }
                            }
                        %>
                    </div>
                  </span>
                            <span>
                    <span>თქვენი პასუხები: </span>
                    <div class="user-answers">
                        <%
                            if (type == MATCHING) {
                                Set<Pair<String>> ansPairs = qe.getUserMatchingAnswers();
                                for (Pair<String> pr : ansPairs) {
                                    String pairs = pr.getFirst() + " : " + pr.getSecond();
                                    out.print("<p>");
                                    out.print(pairs);
                                    out.print("</p>");
                                }
                            } else {
                                List<String> user_ans = qe.getUserAnswers();

                                for (String st : user_ans) {
                                    out.print("<p>");
                                    out.print(st);
                                    out.print("</p>");
                                }
                            }
                        %>
                    </div>
                            </span>
                        </div>
                        <p style="padding-top: 0"> Your Score: <%=truncateDecimal(qe.getUserScore(), 2)%> / <%=truncateDecimal(currQuest.getMaxScore(), 2)%></p>

                    </div>
                    <%
                            i++;
                        }
                    %>
                    <button class="back-to-prof-page" onclick="showGrading()">
                        შეფასებაზე გადასვლა
                    </button>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="/web/pages/PartPages/Footer.jsp"/>
</body>

<script>
    function grade(elem) {
        for (let i = 1; i <= 5; i++) {
            document.getElementById(i).className = "fa fa-star-o";
        }
        for (let i = 1; i <= elem.id; i++) {
            document.getElementById(i).className = "fa fa-star";
        }
        document.getElementById("stars_rating").value = elem.id;
    }

    function showGrading() {
        document.getElementById("before").style.display = "none";
        document.getElementById("after").style.display = "flex";
    }

    function openSearch() {
        window.location.href = "SearchPage.jsp";
    }
</script>
