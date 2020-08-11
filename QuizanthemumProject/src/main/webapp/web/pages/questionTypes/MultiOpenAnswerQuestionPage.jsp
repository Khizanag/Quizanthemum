<%@ page import="static Controller.Classes.Quiz.Question.QuestionTypes.MULTI_ANSWER" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><hr>

<form action="../../../QuestionCreated" method="get">
    <div class="input-items" id="input-items">
        <jsp:include page="/web/pages/PartPages/QuestionStatementSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/InstructionsSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/PhotoSectionInQuestionCreationPage.jsp"/>

        <div class="num-holder" style="display: flex; flex-direction: column;">
            <label for="num"><b>Enter desired amount of answers</b></label>
            <input type="number" placeholder="Answers Amount"
                   id="num" name="num_statements"
                   min="1" max="16" required>
        </div>

        <div id="correct-ans-div">
            <div id="added-correct">
                <input type="text"  placeholder="Please enter possible answer"
                       name="answer_0" id="correct-answer" required>
            </div>
            <button type="button" id="add-correct-ans-btn" class="button" onclick="multiOpenAnsAdder()"> + </button>
        </div>

        <jsp:include page="/web/pages/PartPages/PointHolderSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/SourceSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/CommenSectionInQuestionCreationPage.jsp"/>

        <%--   HIDDEN VARIABLES     --%>
        <input type="hidden" name="type" value="<%=MULTI_ANSWER%>">
        <input type="hidden" name="num_answers" value="0" id="num_answers_in_multi_opens_question">

        <button class="button addQuestion" type="submit">Add Next Question </button>
    </div>
</form>

