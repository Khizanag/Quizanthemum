<%@ page contentType="text/html;charset=UTF-8" language="java" %><hr>

<form action="../../../QuestionCreated" method="get">
    <div class="input-items" id="input-items">
        <label for="statement_text"><b>შეკითხვა</b></label>
        <input type="text" placeholder="შეიყვანეთ შეკითხვა" name="statement_text" id="statement_text" required>

        <label for="description"><b>მითითება</b></label>
        <input type="text" placeholder="გთხოვთ შეიყვანოთ მითითება მომხმარებლისთვის"
               name="description" id="description" required>

        <div class="numbers-holder">
            <div class="num-ans-holder">
                <label for="num_ans"><b>შეიყვანეთ შესაძლო პასუხების რაოდენობა</b></label>
                <input type="number" placeholder="პასუხების რაოდენობა"
                       id="num_ans" name="num_ans"
                       min="1" max="16" onchange="addAnswerInputs()" required>
            </div>

            <div class="num-holder">
                <label for="num"><b>შეიყვანეთ სასურველი პასუხების რაოდენობა</b></label>
                <input type="number" placeholder="პასუხების რაოდენობა"
                       id="num" name="num"
                       min="1" max="16" required>
            </div>
        </div>


        <div id="added-correct-answers-holder"></div>
<%--        <label><b>სურვილისამებრ შეიყვანეთ ფოტო</b></label>--%>
<%--        <div class="upload-image-section">--%>
<%--            <input type="file"  accept="image/*" name="image" id="file"--%>
<%--                   onchange="loadFile(event)"--%>
<%--                   style="display: none;"--%>
<%--            >--%>
<%--            <label class="button upload" type="button" for="file">ატვირთე ფოტო</label>--%>
<%--            <div class="upload-image-container">--%>
<%--                <label class="button upload" type="button"--%>
<%--                       onclick="uploadImage(event)" id="url-button">--%>
<%--                    შეიყვანეთ URL ასატვირთად--%>
<%--                </label>--%>
<%--                <input type="text" placeholder="ფოტოს URL"--%>
<%--                       name="image_url" id="photo-url">--%>
<%--            </div>--%>
<%--            <img id="output" width="100" />--%>
<%--        </div>--%>

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
        <input  type="hidden" name="num_statements" value="0">
        <input type="hidden" name="num_answers" value="0">

        <button class="button addQuestion" type="submit"> შემდეგი შეკითხვის დამატება </button>
    </div>
    <hr>
</form>

