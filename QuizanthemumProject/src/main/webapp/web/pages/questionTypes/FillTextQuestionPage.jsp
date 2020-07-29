<%@ page contentType="text/html;charset=UTF-8" language="java" %><hr>
<form action="../../QuestionCreated" method="get">
    <div class="input-items" id="input-items">

        <label for="description"><b>მითითება</b></label>
        <input type="text" placeholder="გთხოვთ შეიყვანოთ მითითება მომხმარებლისთვის"
               name="description" id="description" required>

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

        <label><b>შეყვანილი ტექსტის მიმდინარე მდგომარეობა</b></label>
        <textarea class="entered-text" id="fill-question"disabled></textarea>

        <div class="fill-items-cont">
            <div class="main-text-cont">
                <label><b>შეიყვანეთ ტექსტი</b></label>
                <textarea class="toFill-text" id="toFill"></textarea>
                <button type="button"
                        class="button"
                        onclick="addToFill()">
                    დაამატე ტექსტი
                </button>
            </div>
            <div class="correct-ans-cont">
                <label><b>შეიყვანეთ გამოტოვებული სიტყვა</b></label>
                <textarea class="fillWith-text" id="fillWith"></textarea>
                <button type="button"
                        class="button"
                        onclick="addFillWith()">
                    დაამატე გამოტოვებული სიტყვა
                </button>
            </div>
        </div>

        <hr><div class="point-holder">
            <label for="question_point"><b>მიანიჭეთ შეკითხვას ქულა 1-დან 16-მდე</b></label>
            <input type="number" placeholder="ქულა"
                   id="question_point" name="max_score"
                   min="1" max="16" required>
        </div>

        <label for="source"><b>წყარო</b></label>
        <input type="text" placeholder="მიუთითეთ წყარო, რომელიც გამოიყენეთ კითხვის მომზადებისას..."
               name="source" id="source">

        <label for="comment"><b>კომენტარი</b></label>
        <input type="text" placeholder="სურვილისამებრ მიუთითეთ კომენტარი..."
               name="comment" id="comment">

        <%--   HIDDEN VARIABLES     --%>
        <input type="hidden" name="type" value="2">
        <input  type="hidden" name="num_statements" value="0">
        <input type="hidden" name="num_answers" value="0">
        <input type="hidden" name="image_url" value="">
        <input type="hidden" name="statement_text" value="" id="statement_text_elem_in_match">

        <button class="button addQuestion" type="submit">
            შემდეგი შეკითხვის დამატება
        </button>
    </div>
</form>
<hr>

