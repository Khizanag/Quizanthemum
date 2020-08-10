<%@ page import="static Controller.Classes.Quiz.Question.QuestionTypes.FILL_BLANK" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><hr>
<form action="../../QuestionCreated" method="get">
    <div class="input-items" id="input-items">

        <jsp:include page="/web/pages/PartPages/InstructionsSectionInQuestionCreationPage.jsp"/>

        <label><b>Entered Text`s current state</b></label>
        <textarea class="entered-text" id="fill-question"disabled></textarea>

        <div class="fill-items-cont">
            <div class="main-text-cont">
                <label><b>Enter Text</b></label>
                <textarea class="toFill-text" id="toFill"></textarea>
                <button type="button"
                        class="button"
                        onclick="addToFill()">
                    Add Text
                </button>
            </div>
            <div class="correct-ans-cont">
                <label><b>Enter missing word</b></label>
                <textarea class="fillWith-text" id="fillWith"></textarea>
                <button type="button"
                        class="button"
                        onclick="addFillWith()">
                    Add missing word
                </button>
            </div>
        </div>

        <jsp:include page="/web/pages/PartPages/PhotoSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/PointHolderSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/SourceSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/CommenSectionInQuestionCreationPage.jsp"/>

    <%--   HIDDEN VARIABLES     --%>
        <input type="hidden" name="type" value="<%=FILL_BLANK%>">
        <input  type="hidden" name="num_statements" value="0">
        <input type="hidden" name="num_answers" value="0">
        <input type="hidden" name="image_url" value="">
        <input type="hidden" name="statement_text" value="" id="statement_text_elem_in_match">

        <button class="button addQuestion" type="submit">
            Add Next Question
        </button>
    </div>
</form>

