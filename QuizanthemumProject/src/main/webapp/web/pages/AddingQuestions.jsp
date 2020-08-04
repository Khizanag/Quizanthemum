<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ka">
<head>
    <meta charset="UTF-8">
    <title> Adding Questions </title>
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/web/styles/common.css">
    <link rel="stylesheet" href="/web/styles/quizCreation.css">
    <link rel="stylesheet" href="/web/styles/breakpoints.css">
    <link rel="stylesheet" href="/web/styles/rules.css">
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"/>
</head>

<body>

    <jsp:include page="/web/pages/Header.jsp"/>
    <jsp:include page="/web/pages/MenuBar.jsp"/>

    <div class="page-holder">
        <div class="container">
            <h2>შეკითხვა</h2>
            <p>შეკითხვის დასამატებლად შეავსეთ ქვემოთ მოყვანილი ველები.</p>
            <hr>

            <div class="input-items" id="input-items">
                <label for="questions-type"><b>აირჩიეთ შეკითხვის ტიპი</b></label>
                <select onchange="doIt()" class="drop-down" name="questions-type" id="questions-type">
                    <option value="0">-</option>
                    <option value="1">ღია პასუხიანი</option>
                    <option value="2">გამოტოვებების შევსება</option>
                    <option value="3">სტანდარტული ტესტური კითხვა</option>
                    <option value="4">ღია მრავალპასუხიანი</option>
                    <option value="5">ტესტური კითხვა რამდენიმე სწორი პასუხით</option>
                    <option value="6">დასაწყვილებელი</option>
                </select>
                <div id="current-question-type"></div>
                <button class="button finish" type="button" id="submit-button-id"
                       onclick="redirectToQuizFinishedPage()">დასრულება</button>
            </div>
        </div>
    </div>
    <jsp:include page="./Footer.jsp"/>
</body>
</html>


<%------------------------------ SCRIPT ------------------------------%>

<script language="JavaScript" type="text/javascript">
    function doIt() {
        if($("#questions-type option:selected").val() == 0) {
            document.getElementById('submit-button-id').style.visibility = 'visible';
            document.getElementById('current-question-type').innerHTML='';
        }
        if($("#questions-type option:selected").val() == 1) {
            document.getElementById('submit-button-id').style.visibility = 'hidden';
            $('#current-question-type').load('./questionTypes/OpenAnswerQuestionPage.jsp');
        }
        if($("#questions-type option:selected").val() == 2) {
            document.getElementById('submit-button-id').style.visibility = 'hidden';
            $('#current-question-type').load('./questionTypes/FillTextQuestionPage.jsp');
        }
        if($("#questions-type option:selected").val() == 3) {
            document.getElementById('submit-button-id').style.visibility = 'hidden';
            $('#current-question-type').load('./questionTypes/MultiChoiceQuestionPage.jsp');
        }
        if($("#questions-type option:selected").val() == 4) {
            document.getElementById('submit-button-id').style.visibility = 'hidden';
            $('#current-question-type').load('./questionTypes/MultiOpenAnswerQuestionPage.jsp');
        }
        if($("#questions-type option:selected").val() == 5) {
            document.getElementById('submit-button-id').style.visibility = 'hidden';
            $('#current-question-type').load('./questionTypes/MultiChoiceMultiAnswerQuestionPage.jsp');
        }
        if($("#questions-type option:selected").val() == 6) {
            document.getElementById('submit-button-id').style.visibility = 'hidden';
            $('#current-question-type').load('./questionTypes/MatchingQuestionPage.jsp');
        }
    }

    function uploadImage(event) {
        if(document.getElementById('photo-url').value != "") {
            var image = document.getElementById('output');
            image.height = 100;
            image.src = document.getElementById('photo-url').value;
        }
    }

    let loadFile = function(event) {
        var image = document.getElementById('output');
        image.height = 100;
        image.src = URL.createObjectURL(event.target.files[0]);
        document.getElementById('photo-url').value = $('img')[0].getAttribute('src');
    };

    function addNextWrongAns() {
        let arr = [];
        let numWrongAnswers = parseInt(document.getElementById('num_statements_elem').value);
        let prevId = numWrongAnswers - 1;
        for(let i = 0 ;i <= prevId; i++) {
            let str = 'statement_' + i;
            let inVal = document.getElementsByName(str)[0].value;
            arr.push(inVal);
        }

        let parent = document.getElementById('added-wrongs');
        let toAdd = '<input type="text"  placeholder="გთხოვთ შეუყვანოთ სავარაუდო პასუხი" ' +
            'name="statement_' + numWrongAnswers + '" id="wrong-answer" required>';
        parent.innerHTML += toAdd;
        document.getElementById('num_statements_elem').value = numWrongAnswers + 1;

        for(let i = 0 ;i <= prevId; i++) {
            let str = 'statement_' + i;
            document.getElementsByName(str)[0].value = arr[i];
        }
    }

    function addNextCorrectAns() {
        let arr = [];
        let numCorrectAnswers = parseInt(document.getElementById('num_answers_elem').value);
        let prevId = numCorrectAnswers - 1;
        for(let i = 0 ;i <= prevId; i++) {
            let str = 'answer_' + i;
            let inVal = document.getElementsByName(str)[0].value;
            arr.push(inVal);
        }

        let parent = document.getElementById('added-correct');
        let toAdd = '<input type="text"  placeholder="გთხოვთ შეუყვანოთ მორიგი სწორი პასუხი"' +
            ' name="answer_' + numCorrectAnswers + '" id="correct-answer" required>';
        parent.innerHTML += toAdd;
        document.getElementById('num_answers_elem').value = numCorrectAnswers + 1;

        for(let i = 0 ;i <= prevId; i++) {
            let str = 'answer_' + i;
            document.getElementsByName(str)[0].value = arr[i];
        }
    }

    function multiOpenAnsAdder() {
        let arr = [];
        let numCorrectAnswers = parseInt(document.getElementById('num_answers_in_multi_opens_question').value);
        let prevId = numCorrectAnswers;
        for(let i = 0 ;i <= prevId; i++) {
            let str = 'answer_' + i;
            let inVal = document.getElementsByName(str)[0].value;
            arr.push(inVal);
        }

        let parent = document.getElementById('added-correct');
        let toAdd = '<input type="text"  placeholder="გთხოვთ შეუყვანოთ მორიგი სწორი პასუხი" name="answer_'
            + (numCorrectAnswers+1) + '" id="correct-answer" required>';
        parent.innerHTML += toAdd;
        document.getElementById('num_answers_in_multi_opens_question').value = numCorrectAnswers + 1;

        for(let i = 0 ;i <= prevId; i++) {
            let str = 'answer_' + i;
            document.getElementsByName(str)[0].value = arr[i];
        }
    }

    function addToFill() {
        let text = document.getElementById("toFill").value;
        let prev = document.getElementById("fill-question").value;
        document.getElementById("fill-question").innerText = prev + ' ' + text;
        document.getElementById("statement_text_elem_in_match").value = prev + ' ' + text;
        document.getElementById("toFill").value = '';
    }

    function addFillWith() {
        let text = document.getElementById("fillWith").value;
        let prev = document.getElementById("fill-question").value;
        if(text === '') return;
        document.getElementById("fill-question").innerText = prev + '{(<_' + text + '_>)}';
        document.getElementById("statement_text_elem_in_match").value = prev + '{(<_' + text + '_>)}';
        document.getElementById("fillWith").value = '';
    }

    function redirectToQuizFinishedPage(){
        window.location.href = "/QuizCreationFinished";
    }

    function addNextMatching() {
        let parent = document.getElementById('matching-elems-container');
        let numAnswers = parseInt(document.getElementById('matching-num-answers-elem').value);
        let prevId = numAnswers-1;
        let arr = [];

        for(let i = 0; i <= prevId; i++) {
            let str = 'answer_' + i;
            let inVal = document.getElementsByName(str)[0].value;
            arr.push(inVal);
        }

        let toAdd = `<div class="matchin-pair">
                            <input type="text" placeholder="რას ვაწყვილებთ"
                                   name="answer_` + numAnswers + `" id="` + numAnswers + `"
                                   class="matching-elem" required>
                            <div class="arrow-container">
                                <i class="arrow arr-right"></i>
                                <i class="arrow arr-left"></i>
                            </div>
                            <input type="text" placeholder="რასთან ვაწყვილებთ"
                                   name="answer_`+ (numAnswers+1) +`" id="` + (numAnswers+1) + `"
                                   class="matching-elem" required>
                        </div>`;
        document.getElementById('matching-num-answers-elem').value = numAnswers + 2;
        parent.innerHTML += toAdd;

        for(let i = 0 ; i <= prevId; i++) {
            let str = 'answer_' + i;
            document.getElementsByName(str)[0].value = arr[i];
        }
    }

    function addAnswerInputs() {
        let numAnswer = document.getElementById('num_ans').value;
        let parent = document.getElementById('added-correct-answers-holder');
        parent.innerHTML = '';
        for (let i = 0; i < numAnswer; i++) {
            parent.innerHTML += '<input style="width: 50%; margin-right: 10px;"' +
                ' type="text" name="answer_' + i + '"' +
                'id="multy_open_' + i + '" placeholder="შეიყვანეთ ერთ-ერთი სწორი პასუხი">';
        }
    }

</script>