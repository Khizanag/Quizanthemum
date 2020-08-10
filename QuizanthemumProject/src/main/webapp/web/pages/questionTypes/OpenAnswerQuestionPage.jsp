<%@ page import="static Controller.Classes.Quiz.Question.QuestionTypes.STANDARD" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><hr>

<form action="../../../QuestionCreated" method="get">
    <div class="input-items" id="input-items">
        <jsp:include page="/web/pages/PartPages/QuestionStatementSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/InstructionsSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/PhotoSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/PointHolderSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/SourceSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/CommenSectionInQuestionCreationPage.jsp"/>

        <%--   HIDDEN VARIABLES     --%>
        <input type="hidden" name="type" value="<%=STANDARD%>">
        <input  type="hidden" name="num_statements" value="0">
        <input type="hidden" name="num_answers" value="0">

        <button class="button addQuestion" type="submit"> Add Next Question </button>
    </div>
</form>