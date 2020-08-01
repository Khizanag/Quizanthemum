<%@ page import="static Controller.Classes.Quiz.Question.QuestionTypes.MULTI_CHOICE" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="../../QuestionCreated" method="get">
    <hr>
    <div class="input-items" id="input-items">
        <jsp:include page="/web/pages/PartPages/CategoriesForQuestions.jsp"></jsp:include>
        <jsp:include page="/web/pages/PartPages/QuestionStatementSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/InstructionsSectionInQuestionCreationPage.jsp"></jsp:include>
        <jsp:include page="/web/pages/PartPages/PhotoSectionInQuestionCreationPage.jsp"></jsp:include>
        <hr><p></p>
        <label for="correct-answer"><b>სწორი პასუხი</b></label>
        <input type="text" placeholder="გთხოვთ შეიყვანოთ სწორი პასუხი"
               name="answer_0" id="correct-answer" style="width: 100%" required>

        <label for="wrong-answer"><b>სავარაუდო(არასწორი) პასუხი</b></label>
        <div id="wrong-ans-div">
            <div id="added-wrongs">
                <input type="text"  placeholder="გთხოვთ შეიყვანოთ სავარაუდო პასუხი"
                       name="statement_0" id="wrong-answer" required>
            </div>
            <button type="button" id="add-wrong-ans-btn" class="button" onclick="addNextWrongAns()"> + </button>
        </div>

    </div>

    <jsp:include page="/web/pages/PartPages/PointHolderSectionInQuestionCreationPage.jsp"></jsp:include>
    <jsp:include page="/web/pages/PartPages/SourceSectionInQuestionCreationPage.jsp"></jsp:include>
    <jsp:include page="/web/pages/PartPages/CommenSectionInQuestionCreationPage.jsp"></jsp:include>

    <%--   HIDDEN VARIABLES     --%>
    <input type="hidden" name="type" value="<%=MULTI_CHOICE%>">
    <input  type="hidden" name="num_statements" value="1" id="num_statements_elem">
    <input type="hidden" name="num_answers" value="1" id="num_answers_elem">

<%--    </div>--%>

    <button class="button addQuestion"
            type="submit">
        შემდეგი შეკითხვის დამატება
    </button>
    <hr>
</form>