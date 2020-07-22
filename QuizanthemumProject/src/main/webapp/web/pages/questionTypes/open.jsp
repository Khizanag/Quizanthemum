<%@ page contentType="text/html;charset=UTF-8" language="java" %><hr>
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
            <input type="text" placeholder="ფოტოს URL" name="photo-url" id="photo-url" required>
        </div>
        <img id="output" width="100" />
    </div>
    <button class="button addQuestion"
            type="button"
            onclick="checkAndRedirect()">
        შემდეგი შეკითხვის დამატება დამატება
    </button>
</div>
<hr>

