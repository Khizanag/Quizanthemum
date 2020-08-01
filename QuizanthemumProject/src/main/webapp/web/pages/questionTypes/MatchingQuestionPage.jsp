<%@ page import="static Controller.Classes.Quiz.Question.QuestionTypes.MATCHING" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="../../QuestionCreated" method="get">

    <hr>
    <div class="input-items" id="input-items">
        <jsp:include page="/web/pages/PartPages/QuestionStatementSectionInQuestionCreationPage.jsp"/>

        <div class="matching-elems-secton">
            <div class="matching-elems-container" id="matching-elems-container">
                <label for="matching-elem-0"><b>მეზობელ ველებში შეიყვანეთ წყვილი</b></label> <%-- TODO answer_0 ? --%>
                <div class="matchin-pair">
                    <input type="text" placeholder="რას ვაწყვილებთ"
                           name="answer_0" id="matching-elem-0" class="matching-elem" required>
                    <div class="arrow-container">
                        <i class="arrow arr-right"></i>
                        <i class="arrow arr-left"></i>
                    </div>
                    <input type="text" placeholder="რასთან ვაწყვილებთ"
                           name="answer_1" id="answer_1" class="matching-elem" required>
                </div>

                <div class="matchin-pair">
                    <input type="text" placeholder="რას ვაწყვილებთ"
                           name="answer_2" id="answer_2" class="matching-elem" required>
                    <div class="arrow-container">
                        <i class="arrow arr-right"></i>
                        <i class="arrow arr-left"></i>
                    </div>
                    <input type="text" placeholder="რასთან ვაწყვილებთ"
                           name="answer_3" id="answer_3" class="matching-elem" required>
                </div>
                <button type="button"
                        id="add-correct-ans-btn" class="button"
                        onclick="addNextMatching()">
                    +
                </button>
            </div>
        </div>

        <jsp:include page="/web/pages/PartPages/PointHolderSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/SourceSectionInQuestionCreationPage.jsp"/>
        <jsp:include page="/web/pages/PartPages/CommenSectionInQuestionCreationPage.jsp"/>

        <%--   HIDDEN VARIABLES     --%>
        <input type="hidden" name="type" value="<%=MATCHING%>">
        <input  type="hidden" name="num_statements" value="0">
        <input type="hidden" name="num_answers" value="4" id="matching-num-answers-elem">

        <input type="hidden" name="image_url" value="">
        <input type="hidden" name="statement_text" value="" id="statement_text_elem_in_match">

        <button class="button addQuestion"
                type="submit"
                onclick="checkAndRedirect()">
            შემდეგი შეკითხვის დამატება
        </button>
    </div>
</form>