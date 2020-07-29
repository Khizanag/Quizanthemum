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
            <p>  Lorem ipsum dolor sit amet, consectetur adipisicing elit. A
                aliquid aperiam architecto ea earum fugit hic iste maxime molestiae
                molestias, qui quisquam ratione repellendus sunt vel veritatis
                vero voluptas voluptatem! Lorem ipsum dolor sit amet,
                consectetur adipisicing elit. Minima natus nobis odit
                perspiciatis quasi. Accusantium alias aliquid animi at error,
                exercitationem modi porro quas ratione
                sapiente tempore veniam vero voluptate? </p>
            <p>ავტორის მინიშნება/მოთხოვნა, მაგალითად: (აირჩიეთ ერთი ან მეტი პასუხი)</p>
            <hr>
            <div class="input-items" id="input-items">
                <input type="checkbox" id="1" name="test_answer_1">
                <label for="1"><b> ბანანი თიმთიმ თანანი </b></label><br>
                <input type="checkbox" id="2" name="test_answer_2">
                <label for="2"><b> ვოიაჟერი </b></label><br>
                <input type="checkbox" id="3" name="test_answer_3">
                <label for="3"><b> შაურმა თიმთიმ თაურმა </b></label><br>
                <input type="checkbox" id="4" name="test_answer_4">
                <label for="4"><b> ძმდებო ძღმდებო </b></label><br>
                <input type="checkbox" id="5" name="test_answer_5">
                <label for="5"><b> შაურმა თიმთიმ თაურმა </b></label><br>
                <input type="checkbox" id="6" name="test_answer_6">
                <label for="6"><b> ძმდებო ძღმდებო </b></label><br><br>
            </div><hr>
            <button class="button" type="button"> პასუხის დადასტურება </button>
        </div>
    </form>

    <jsp:include page="../Footer.jsp"></jsp:include>
</body>
