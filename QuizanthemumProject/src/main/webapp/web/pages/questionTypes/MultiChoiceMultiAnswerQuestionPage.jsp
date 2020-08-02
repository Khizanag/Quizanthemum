<%@ page import="static Controller.Classes.Quiz.Question.QuestionTypes.MULTI_CHOICE_MULTI_ANSWER" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="../../QuestionCreated" method="get">
    <hr>
    <div class="input-items" id="input-items">
        <jsp:include page="/web/pages/PartPages/QuestionStatementSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/InstructionsSectionInQuestionCreationPage.jsp"/>

        <input type="text" placeholder="გთხოვთ შეუყვანოთ მითითება მომხმარებლისთვის"
               name="description" id="description" required>

            <jsp:include page="/web/pages/PartPages/PhotoSectionInQuestionCreationPage.jsp"/>

            <hr><p></p>

        <label><b>სწორი პასუხი</b></label>
        <div id="correct-ans-div">
            <div id="added-correct">
                <input type="text"  placeholder="გთხოვთ შეიყვანოთ სავარაუდო პასუხი"
                       name="answer_0" id="correct-answer" required>
            </div>
            <button type="button" id="add-correct-ans-btn" class="button" onclick="addNextCorrectAns()"> + </button>
        </div>

        <label for="wrong-answer"><b>სავარაუდო(არასწორი) პასუხი</b></label>
        <div id="wrong-ans-div">
            <div id="added-wrongs">
                <input type="text"  placeholder="გთხოვთ შეიყვანოთ სავარაუდო პასუხი"
                       name="statement_0" id="wrong-answer" required>
            </div>
            <button type="button" id="add-wrong-ans-btn" class="button" onclick="addNextWrongAns()"> + </button>
        </div>

        <hr><div class="point-holder">
        <label for="question_point"><b>მიანიჭეთ შეკითხვას ქულა 0-დან 16-მდე</b></label>
        <input type="number" placeholder="ქულა"
               id="question_point" name="max_score"
               min="1" max="16" required>
        </div><hr>

        <label for="source"><b>წყარო</b></label>
        <input type="text" placeholder="მიუთითეთ წყარო, რომელიც გამოიყენეთ კითხვის მომზადებისას..."
               name="source" id="source">

        <label for="comment"><b>კომენტარი</b></label>
        <input type="text" placeholder="სურვილისამებრ მიუთითეთ კომენტარი..."
               name="comment" id="comment">

        <%--   HIDDEN VARIABLES     --%>
        <input type="hidden" name="type" value="<%=MULTI_CHOICE_MULTI_ANSWER%>">
        <input  type="hidden" name="num_statements" value="1" id="num_statements_elem">
        <input type="hidden" name="num_answers" value="1" id="num_answers_elem">

    <button class="button addQuestion" type="submit">შემდეგი შეკითხვის დამატება</button>
</form>