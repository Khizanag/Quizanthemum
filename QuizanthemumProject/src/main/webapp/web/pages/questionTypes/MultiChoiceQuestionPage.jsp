<%@ page import="static Controller.Classes.Quiz.Question.QuestionTypes.MULTI_CHOICE" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="../../QuestionCreated" method="get">
    <hr>
    <div class="input-items" id="input-items">
        <jsp:include page="/web/pages/PartPages/QuestionStatementSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/InstructionsSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/PhotoSectionInQuestionCreationPage.jsp"/>
        <hr><p></p>
        <label for="correct-answer"><b>Correct Answer</b></label>
        <input type="text" placeholder="Please Enter Correct Answer"
               name="answer_0" id="correct-answer" style="width: 100%" required>

        <label for="wrong-answer"><b>Possible(wrong) answer</b></label>
        <div id="wrong-ans-div">
            <div id="added-wrongs">
                <input type="text"  placeholder="Please enter possible answer"
                       name="statement_0" id="wrong-answer" required>
            </div>
            <button type="button" id="add-wrong-ans-btn" class="button" onclick="addNextWrongAns()"> + </button>
        </div>

    </div>

    <jsp:include page="/web/pages/PartPages/PointHolderSectionInQuestionCreationPage.jsp"/>
    <jsp:include page="/web/pages/PartPages/SourceSectionInQuestionCreationPage.jsp"/>
    <jsp:include page="/web/pages/PartPages/CommenSectionInQuestionCreationPage.jsp"/>

    <%--   HIDDEN VARIABLES     --%>
    <input type="hidden" name="type" value="<%=MULTI_CHOICE%>">
    <input  type="hidden" name="num_statements" value="1" id="num_statements_elem">
    <input type="hidden" name="num_answers" value="1" id="num_answers_elem">

<%--    </div>--%>

    <button class="button addQuestion"
            type="submit">
        Add Next Question
    </button>
</form>