<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="Controller.Classes.User.User" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page import="Controller.Classes.Quiz.Quiz" %>
<%@ page import="Model.Managers.QuizManager" %>
<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="static Configs.Config.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Start Quiz </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
    <link rel="stylesheet" href="/web/styles/common.css">
    <link rel="stylesheet" href="/web/styles/quizCreation.css">
    <link rel="stylesheet" href="/web/styles/breakpoints.css">
    <link rel="stylesheet" href="/web/styles/startQuiz.css">

    <jsp:include page="/web/pages/LogedInHandler.jsp"></jsp:include>

</head>

<style>
    .quiz-date-and-rait-holder {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }
    .fa:hover {
        color: white;
    }
    .toHover {
        display: flex;
        align-items: center;
    }
    .onHover {
        display: none;
        position: absolute;
        right: 30px;
        bottom: 150px;
    }
    .toHover:hover + .onHover {
        display: block;
        color: white;
    }

</style>
<body>
    <jsp:include page="/web/pages/Header.jsp"></jsp:include>
    <jsp:include page="/web/pages/MenuBar.jsp"></jsp:include>

    <% if(request.getServletContext().getAttribute("quiz-that-was-created-lastly") != null){ %>
        <div style="text-align: center">
            <p style="color: orange; font-weight: bold; font-style: italic; font-size: large">ქვიზი წარმატებით შეიქმნა.</p>
        </div>
    <% request.getServletContext().removeAttribute("quiz-that-was-created-lastly");
    }%>
    <%
        ServletContext context = request.getServletContext();
        ManagersManager managersManager = (ManagersManager) context.getAttribute(MANAGERS_MANAGER_STR);
        QuizManager quizManager = (QuizManager) managersManager.getManager(QUIZ_MANAGER_STR);
        Quiz quiz = quizManager.getQuiz(Integer.parseInt(request.getParameter("quiz_id")));
    %>
    <form class="start-quiz-section" action="../../../QuizEventStart" method ="get">
        <div class="container">
            <div class="start-quiz-holder">
                <img src="<%=quiz.getIconUrl()%>" class="quiz-main-img" onerror="this.src='/web/images/common/Quiz1.jpg';">
                <div class="text-holder">
                    <h2><%=quiz.getName()%></h2>
                    <div type="text" class="description">
                        <%=quiz.getDescription()%>
                    </div>
                </div>
            </div>

            <p style="color:white"> ავტორი: <%=quiz.getAuthor().getFirstName()%> <%=quiz.getAuthor().getLastName()%></p>
            <div class="quiz-date-and-rait-holder">
                <p style=" margin-bottom: 0; color:white"> შექმნილია: <%=quiz.getCreationDate()%> </p>
                <div class="toHover">
                    <div class="raiting-icons-holder" style="margin-bottom: 0; color:white">
                        <ul class="raiting-icons" id="stars-holder">
                            <% for(int j = 1; j <= 3; j++) { %>
                            <a class="fa fa-star" style="margin-right: 2px;"></a>
                            <%}%>
                            <% for(int j = 4; j <= 5; j++) { %>
                            <a class="fa fa-star-o" style="margin-right: 2px;"></a>
                            <%}%>
                        </ul>
                    </div>
                </div>
                <p class="onHover"> ქვიზის რეიტინგი: 3/5 </p>
            </div>
            <button class="button" type="submit"
                    style="margin-top: 10px">
                ქვიზის დაწყება
            </button>
        </div>
        <input type="hidden" value="<%=quiz.getID()%>" name="quiz_id">
    </form>
</body>