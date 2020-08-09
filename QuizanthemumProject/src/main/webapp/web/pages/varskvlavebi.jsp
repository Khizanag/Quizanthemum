<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Raiting Test Page </title>
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>.
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/web/styles/common.css">
    <link rel="stylesheet" href="/web/styles/homePage.css">
    <link rel="stylesheet" href="/web/styles/breakpoints.css">
    <link rel="stylesheet" href="/web/styles/profilePage.css">
    <link rel="stylesheet" href="/web/styles/quizCreation.css">
</head>
<style>
    .quiz-rating-section {
        width: 100%;
        height: 60px;

    }
    .raiting-icons-holder {
        margin-top: 10px;
        /*position: relative;*/
    }
    .raiting-icons{
        display: flex;
        flex-direction: row;
        /*position: absolute;*/
        /*right: 0;*/
    }
    .fa{
        margin-right: 2px;
        unicode-bidi: bidi-override;
        direction: rtl;
    }
</style>

<body>

    <div class="quiz-rating-section">
        <div class="container">
            <h2> ქვიზის შეფასება </h2>
            <div class="raiting-icons-holder">
                <ul class="raiting-icons">
                    <a class="fa fa-star-o" id="1" onclick="grade(this)"></a>
                    <a class="fa fa-star-o" id="2" onclick="grade(this)"></a>
                    <a class="fa fa-star-o" id="3" onclick="grade(this)"></a>
                    <a class="fa fa-star-o" id="4" onclick="grade(this)"></a>
                    <a class="fa fa-star-o" id="5" onclick="grade(this)"></a>
                </ul>
            </div>
        </div>
    </div>

</body>
<script>
    function grade(elem) {
        for(let i = 1; i <= 5; i++) {
            document.getElementById(i).className = "fa fa-star-o";
        }
        for(let i = 1; i <= elem.id; i++) {
            document.getElementById(i).className = "fa fa-star";
        }
        console.log(elem.id);
    }
</script>