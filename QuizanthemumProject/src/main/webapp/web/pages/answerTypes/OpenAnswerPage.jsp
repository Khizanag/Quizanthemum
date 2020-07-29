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
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>

    <jsp:include page="/web/pages/Header.jsp"></jsp:include>
    <jsp:include page="/web/pages/MenuBar.jsp"></jsp:include>

<form class="add-question-section" action="../../../QuestionEventFinished" method="get">
    <div class="container">
        <h2>შეკითხვა (აქ იქნება N)</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, ea
            natus! Blanditiis distinctio ea earum est, ex fugiat harum impedit iure
            libero magnam praesentium quos ratione rem rerum sunt
            voluptate? Lorem ipsum dolor sit amet, consectetur
            adipisicing elit. Atque expedita porro reiciendis
            reprehenderit. Cum ducimus ea, eius enim eos est,
            et eveniet iusto laudantium necessitatibus perspiciatis,
            porro quae quis sequi?</p>
        <p>ავტორის მინიშნება/მოთხოვნა, მაგალითად: (შეიყვანეთ მინიმუმ 300 სიტყვა)</p>
        <hr>
        <div class="input-items" id="input-items">
            <label><b>შეიყვანეთ თქვენი პასუხი აქ: </b></label>
            <textarea class="ans-toFill" id="ans-toFill"></textarea>
            <p> შეყვანილია <span id="words-counter">0</span> სიტყვა</p>
        </div><hr>
        <button class="button" type="submit"> პასუხის დადასტურება </button>
    </div>
</form>

<jsp:include page="../Footer.jsp"></jsp:include>
</body>

<script>
    document.querySelector("textarea").addEventListener('keyup', count);

    function count(){
        let resultArray = [];
        let str = this.value.replace(/[\t\n\r\.\?\!]/gm,' ');
        let wordArray = str.split(" ");
        for (let i = 0; i < wordArray.length; i++) {
            let item = wordArray[i].trim();
            if(item.length > 0){
                resultArray.push(item);
            }
        }
        document.getElementById("words-counter").innerText = resultArray.length;
    }
</script>