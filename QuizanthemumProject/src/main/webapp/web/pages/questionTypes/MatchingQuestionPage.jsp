<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="../../QuestionCreated" method="get">

    <hr>
    <div class="input-items" id="input-items">

        <label for="description"><b>მითითება</b></label>
        <input type="text" placeholder="გთხოვთ შეიყვანოთ მითითება მომხმარებლისთვის"
               name="description" id="description" required>

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
      
        <hr><div class="point-holder">
        <label for="question_point"><b>მიანიჭეთ შეკითხვას ქულა 0-დან 16-მდე</b></label>
        <input type="number" placeholder="ქულა"
               id="question_point" name="max_score"
               min="1" max="16" required>
        </div> <hr>

        <label for="source"><b>წყარო</b></label>
        <input type="text" placeholder="მიუთითეთ წყარო, რომელიც გამოიყენეთ კითხვის მომზადებისას..."
               name="source" id="source">

        <label for="comment"><b>კომენტარი</b></label>
        <input type="text" placeholder="სურვილისამებრ მიუთითეთ კომენტარი..."
               name="comment" id="comment">

        <%--   HIDDEN VARIABLES     --%>
        <input type="hidden" name="type" value="6">
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
    <hr>

</form>