<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<hr>
<div class="input-items" id="input-items">
    <label for="question"><b>შეკითხვა</b></label>
    <input type="text" placeholder="შეიყვანეთ შეკითხვა" name="question" id="question" required>

    <label for="description"><b>ავტორის რჩევა</b></label>
    <input type="text" placeholder="გთხოვთ შეუყვანოთ მითითება მომხმარებლისთვის"
           name="description" id="description" required>

    <label for="image"><b>სურვილისამებრ შეიყვანეთ ფოტო</b></label>
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
    <label for="correct-ans"><b>სწორი პასუხი</b></label>
    <input type="text" placeholder="გთხოვთ შეუყვანოთ სწორი პასუხი"
           name="correct-ans" id="correct-ans" required>

    <label for="wrong-ans"><b>სავარაუდო(არასწორი) პასუხი</b></label>
    <div id="wrong-ans-div">
        <div id="added-wrongs">
            <input type="text"  placeholder="გთხოვთ შეიყვანოთ სავარაუდო პასუხი"
                   name="wrong-ans" id="wrong-ans" required>
        </div>
        <button type="button"
                id="add-worng-ans-btn"
                class="button"
                onclick="addNextWrongAns()">
            +
        </button>
    </div>
</div>

<button class="button addQuestion"
        type="button"
        onclick="checkAndRedirect()">
    შემდეგი შეკითხვის
</button>
<hr>