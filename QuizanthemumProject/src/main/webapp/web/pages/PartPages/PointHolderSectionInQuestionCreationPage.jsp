<%--
  Created by IntelliJ IDEA.
  User: gigakhizanishvili
  Date: 8/1/20
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<hr>
<div class="point-holder">
    <label for="question_point"><b>მიანიჭეთ შეკითხვას ქულა 0-დან 16-მდე</b></label>
    <input type="number" placeholder="ქულა"
           id="question_point" name="max_score"
           min="1" max="16" required>
</div>
<hr>