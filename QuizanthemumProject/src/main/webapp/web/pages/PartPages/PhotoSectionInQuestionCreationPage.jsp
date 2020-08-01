<%--
  Created by IntelliJ IDEA.
  User: gigakhizanishvili
  Date: 8/1/20
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
               name="image_url" id="photo-url">
    </div>
    <img id="output" width="100" />
</div>