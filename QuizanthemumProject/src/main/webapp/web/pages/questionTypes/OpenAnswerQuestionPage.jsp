<%@ page contentType="text/html;charset=UTF-8" language="java" %><hr>

<form action="../../../QuestionCreated" method="get">
    <div class="input-items" id="input-items">
        <label for="statement_text"><b>შეკითხვა</b></label>
        <input type="text" placeholder="შეიყვანეთ შეკითხვა" name="statement_text" id="statement_text" required>

        <label for="description"><b>მითითება</b></label>
        <input type="text" placeholder="გთხოვთ შეიყვანოთ მითითება მომხმარებლისთვის"
               name="description" id="description" required>

        <div class="num-holder">
            <label for="num"><b>შეიყვანეთ სასურველი პასუხების რაოდენობა</b></label>
            <input type="number" placeholder="პასუხების რაოდენობა"
                   id="num" name="num_statements"
                   min="1" max="16" required>
        </div>

        <div id="correct-ans-div">
            <div id="added-correct">
                <input type="text"  placeholder="გთხოვთ შეიყვანოთ სავარაუდო პასუხი"
                       name="answer_0" id="correct-answer" required>
            </div>
            <button type="button" id="add-correct-ans-btn" class="button" onclick="multiOpenAnsAdder()"> + </button>
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
        <input type="hidden" name="type" value="4">
        <input  type="hidden" name="num_statements" value="1" id="num_statements_elem">
        <input type="hidden" name="num_answers" value="1" id="num_answers_elem">

        <button class="button addQuestion" type="submit"> შემდეგი შეკითხვის დამატება </button>
    </div>
    <hr>
</form>