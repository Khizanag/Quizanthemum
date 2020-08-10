<%@ page import="static Controller.Classes.Quiz.Question.QuestionTypes.MULTI_CHOICE_MULTI_ANSWER" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="../../QuestionCreated" method="get">
    <hr>
    <div class="input-items" id="input-items">
        <jsp:include page="/web/pages/PartPages/QuestionStatementSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/InstructionsSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/PhotoSectionInQuestionCreationPage.jsp"/>

            <hr><p></p>

        <label><b>Correct Answer</b></label>
        <div id="correct-ans-div">
            <div id="added-correct">
                <input type="text"  placeholder="Please enter possible answer"
                       name="answer_0" id="correct-answer" required>
            </div>
            <button type="button" id="add-correct-ans-btn" class="button" onclick="addNextCorrectAns()"> + </button>
        </div>

        <label for="wrong-answer"><b>possible(wrong) answer</b></label>
        <div id="wrong-ans-div">
            <div id="added-wrongs">
                <input type="text"  placeholder="Please enter possible answer"
                       name="statement_0" id="wrong-answer" required>
            </div>
            <button type="button" id="add-wrong-ans-btn" class="button" onclick="addNextWrongAns()"> + </button>
        </div>

        <hr><div class="point-holder">
        <label for="question_point"><b>Add Score from 0 to 16</b></label>
        <input type="number" placeholder="Score"
               id="question_point" name="max_score"
               min="1" max="16" required>
        </div><hr>

        <label for="source"><b>Source</b></label>
        <input type="text" placeholder="Add sources used for creating this question..."
               name="source" id="source">

        <label for="comment"><b>Comment</b></label>
        <input type="text" placeholder="Add comment(optional)..."
               name="comment" id="comment">

        <%--   HIDDEN VARIABLES     --%>
        <input type="hidden" name="type" value="<%=MULTI_CHOICE_MULTI_ANSWER%>">
        <input  type="hidden" name="num_statements" value="1" id="num_statements_elem">
        <input type="hidden" name="num_answers" value="1" id="num_answers_elem">

    <button class="button addQuestion" type="submit">Add Next Question</button>
</form>