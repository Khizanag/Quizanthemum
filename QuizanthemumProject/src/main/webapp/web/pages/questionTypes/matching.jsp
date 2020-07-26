<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<hr>
<div class="input-items" id="input-items">

    <div class="matching-elems-secton">
        <div class="matching-elems-container">
            <label for="matching-elem"><b>მეზობელ ველებში შეიყვანეთ წყვილი</b></label>
            <div class="matchin-pair">
                <input type="text" placeholder="რას ვაწყვილებთ"
                       name="matching-elem" id="1" class="matching-elem" required>
                <div class="arrow-container">
                    <i class="arrow arr-right"></i>
                    <i class="arrow arr-left"></i>
                </div>
                <input type="text" placeholder="რასთან ვაწყვილებთ"
                       name="matching-elem" id="2" class="matching-elem" required>
            </div>

            <div class="matchin-pair">
                <input type="text" placeholder="რას ვაწყვილებთ"
                       name="matching-elem" id="3" class="matching-elem" required>
                <div class="arrow-container">
                    <i class="arrow arr-right"></i>
                    <i class="arrow arr-left"></i>
                </div>
                <input type="text" placeholder="რასთან ვაწყვილებთ"
                       name="matching-elem" id="4" class="matching-elem" required>
            </div>

            <button type="button"
                    id="add-worng-ans-btn"
                    class="button"
                    onclick="addNextMatching()">
                +
            </button>
        </div>

    </div>

    <button class="button addQuestion"
            type="button"
            onclick="checkAndRedirect()">
        შემდეგი შეკითხვის დამატება
    </button>
</div>
<hr>