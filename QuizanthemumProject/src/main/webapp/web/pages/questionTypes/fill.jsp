<%@ page contentType="text/html;charset=UTF-8" language="java" %><hr>
<form action="../../../QuestionCreated" method="get">
    <div class="input-items" id="input-items">
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
        <button class="button addQuestion" type="submit">
            შემდეგი შეკითხვის დამატება
        </button>
    </div>
</form>
<hr>

