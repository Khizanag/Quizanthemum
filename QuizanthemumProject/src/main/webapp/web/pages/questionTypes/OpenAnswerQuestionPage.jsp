<%@ page contentType="text/html;charset=UTF-8" language="java" %><hr>

<form action="../../../QuestionCreated" method="get">
    <div class="input-items" id="input-items">
        <label for="statement_text"><b>შეკითხვა</b></label>
        <input type="text" placeholder="შეიყვანეთ შეკითხვა" name="statement_text" id="statement_text" required>

        <label for="description"><b>მითითება</b></label>
        <input type="text" placeholder="გთხოვთ შეიყვანოთ მითითება მომხმარებლისთვის"
               name="description" id="description" required>

        <label><b>სურვილისამებრ შეიყვანეთ ფოტო</b></label>
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
                       name="image_url" id="image_url">
            </div>
            <img id="output" width="100" />
        </div>

        <label for="source"><b>წყარო</b></label>
        <input type="text" placeholder="მიუთითეთ წყარო, რომელიც გამოიყენეთ კითხვის მომზადებისას..."
               name="source" id="source">

        <label for="comment"><b>კომენტარი</b></label>
        <input type="text" placeholder="სურვილისამებრ მიუთითეთ კომენტარი..."
               name="comment" id="comment">

        <%--   HIDDEN VARIABLES     --%>
        <input type="hidden" name="type" value="1">
        <input  type="hidden" name="num_statements" value="0">
        <input type="hidden" name="num_answers" value="0">

        <button class="button addQuestion" type="submit"> შემდეგი შეკითხვის დამატება </button>
    </div>
    <hr>
</form>

