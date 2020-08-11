<%--
  Created by IntelliJ IDEA.
  User: gigakhizanishvili
  Date: 8/1/20
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<br>
<label for="file"><b>Add photo (optional)</b></label>
<div class="upload-image-section">
    <input type="file"  accept="image/*" name="image" id="file"
           onchange="loadFile(event)"
           style="display: none;"
    >
    <div class="upload-image-container">
        <input type="text" placeholder="Photo URL"
               name="image_url" id="photo-url">
        <label class="url-button upload" type="button"
               onclick="uploadImage(event)" id="url-button">
            Upload
        </label>
    </div>
    <img id="output" width="100" />
</div>