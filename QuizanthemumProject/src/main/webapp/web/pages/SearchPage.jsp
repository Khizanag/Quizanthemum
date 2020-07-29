<%--
  Created by IntelliJ IDEA.
  User: gigakhizanishvili
  Date: 7/29/20
  Time: 05:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <title> Search </title>
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/web/styles/common.css">
    <link rel="stylesheet" href="/web/styles/search.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


</head>
<body>
    <jsp:include page="/web/pages/Header2.jsp"></jsp:include>
    <jsp:include page="/web/pages/MenuBar.jsp"></jsp:include>

    <form action="searching" class="searching-section">
        <div class="container">
            <div class="searching-for" id="searching-for"></div>
        </div>
    </form>

    <jsp:include page="/web/pages/Footer.jsp"></jsp:include>
</body>

<script>
    let e = document.createElement('div');
    e.className='bla'
    e.innerHTML = window.localStorage.getItem('item');
    document.getElementById('searching-for').appendChild(e);
</script>