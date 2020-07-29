<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Quiz In Progress </title>
    <link rel="icon" type="image/png" href="../../images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../styles/common.css">
    <link rel="stylesheet" href="../../styles/quizCreation.css">
    <link rel="stylesheet" href="../../styles/breakpoints.css">
    <link rel="stylesheet" href="../../styles/answers.css">
</head>

<body>

    <jsp:include page="/web/pages/Header.jsp"></jsp:include>
    <jsp:include page="/web/pages/MenuBar.jsp"></jsp:include>


<form class="add-question-section">
    <div class="container">
        <h2>შეკითხვა (აქ იქნება N)</h2>
        <p>შეავსეთ ტექსტში გამოტოვებული სიტყვები</p>
        <p>ავტორის მინიშნება/მოთხოვნა, მაგალითად: (კისერი გიტეხიათ)</p>
        <hr>
        <div class="input-items" id="input-items">
        </div><hr>
        <button class="button" type="button"> პასუხის დადასტურება </button>
    </div>
</form>

    <jsp:include page="../Footer.jsp"></jsp:include>
</body>
<script>
    let parent = document.getElementById('input-items');
    let toParse = "qwskdasjd jsjasjdj jasdjejnad asdjfasjdfnkj " +
        " ajsdfkjasdkfj asjdfkaj sdkf {(<_OOOOOO_>)}) qwerqwerqwer " +
        "asdf. qwe.qwefqwef qwef qwef asdfq wef qwefqwef {(<_asdfqwef_>)}) " +
        "asdfwe qwef qwef qwefqwefqwefqwef qwef qwefqwefqwef qwef qwef  " +
        "{(<_qwefqwefqwef_>)}) qwefqw efqwef {(<_qwefqwef_>)}). " +
        "qwskdasjd jsjasjdj jasdjejnad asdjfasjdfnkj " +
        " ajsdfkjasdkfj asjdfkaj sdkf {(<_OOOOOO_>)}) qwerqwerqwer " +
        "asdf. qwe.qwefqwef qwef qwef asdfq wef qwefqwef {(<_asdfqwef_>)}) " +
        "asdfwe qwef qwef qwefqwefqwefqwef qwef qwefqwefqwef qwef qwef  " +
        "{(<_qwefqwefqwef_>)}) qwefqw efqwef {(<_qwefqwef_>)})";

    let textArr = [];
    let ansArr = [];
    let elem = document.createElement('div');

    let elems = toParse.split("{(<_");
    for(let i = 0; i < elems.length; i++) {
        if (elems[i].includes("_>)})")) {
            ansArr.push(elems[i].split("_>)})")[0]);
            textArr.push(elems[i].split("_>)})")[1]);
        } else textArr.push(elems[i]);
    }
    console.log(textArr);
    console.log(ansArr);
    let index = 0;
    let resStr = '<p class="condensedlines">';

    for(let i = 0; i < elems.length; i++) {
        resStr += textArr[i];
        if(index < ansArr.length) {
            let input = '<input class="my_input" type="" id="'+
                index + '" name="answer_fill_' +
                index +'">';
            resStr += input;
            index ++;
        }
    }
    resStr += '</p>'
    console.log(resStr);
    parent.innerHTML = resStr;
</script>