<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="../../QuestionCreated" method="get">
    <hr>
    <div class="input-items" id="input-items">
        <label for="question_statement"><b>შეკითხვა</b></label>
        <input type="text" placeholder="შეიყვანეთ შეკითხვა" name="question_statement" id="question_statement" required>

        <label for="description"><b>ავტორის რჩევა</b></label>
        <input type="text" placeholder="გთხოვთ შეუყვანოთ მითითება მომხმარებლისთვის"
               name="description" id="description" required>

        <label for="file"><b>სურვილისამებრ შეიყვანეთ ფოტო</b></label>
        <div class="upload-image-section">
            <input type="file"  accept="image/*" name="image" id="file"
                   onchange="loadFile(event)"
                   style="display: none;"
            >
            <label class="button upload" type="button" for="file">ატვირთე ფოტო</label>
            <div class="upload-image-container">
                <label class="button upload" type="button"
                       onclick="uploadImage(event)" id="url-button">
                    შეიყვანეთ URL ასატვირთად
                </label>
                <input type="text" placeholder="ფოტოს URL"
                       name="question_image_url" id="question_image_url" required>
            </div>
            <img id="output" width="100" />
        </div>
        <hr><p></p>
        <label for="correct-answer"><b>სწორი პასუხი</b></label>
        <input type="text" placeholder="გთხოვთ შეიყვანოთ სწორი პასუხი"
               name="answer_0" id="correct-answer" required>

        <label for="wrong-answer"><b>სავარაუდო(არასწორი) პასუხი</b></label>
        <div id="wrong-ans-div">
            <div id="added-wrongs">
                <input type="text"  placeholder="გთხოვთ შეიყვანოთ სავარაუდო პასუხი"
                       name="statement_0" id="wrong-answer" required>
            </div>
            <button type="button" id="add-wrong-ans-btn" class="button" onclick="addNextWrongAns()"> + </button>
        </div>

    </div>

    <hr><div class="point-holder">
        <label for="question_point"><b>მიანიჭეთ შეკითხვას ქულა 0-დან 16-მდე</b></label>
        <input type="number" placeholder="ქულა"
               id="question_point" name="question_point"
               min="1" max="16" required>

        <label for="source"><b>წყარო</b></label>
        <input type="text" placeholder="მიუთითეთ წყარო, რომელიც გამოიყენეთ კითხვის მომზადებისას..."
               name="source" id="source">

        <label for="comment"><b>კომენტარი</b></label>
        <input type="text" placeholder="სურვილისამებრ მიუთითეთ კომენტარი..."
               name="comment" id="comment">

        <%--   HIDDEN VARIABLES     --%>
        <input type="hidden" name="type" value="3">
        <input  type="hidden" name="num_statements" value="1" id="num_statements_in_multi_choice">
        <input type="hidden" name="num_answers" value="1">

    </div>

    <hr>
    <div class="point-holder">
        <label for="question_point"><b>მიანიჭეთ შეკითხვას ქულა 0-დან 16-მდე</b></label>
        <input type="number" placeholder="ქულა"
               id="question_point" name="question_point"
               min="1" max="16" required>
    </div>

    <button class="button addQuestion"
            type="submit">
        შემდეგი შეკითხვის დამატება
    </button>
    <hr>
</form>