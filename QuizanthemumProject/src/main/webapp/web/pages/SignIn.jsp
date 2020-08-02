<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title> Sign In </title>
    <link rel="icon" type="image/png" href="../images/common/icon.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/web/styles/common.css">
    <link rel="stylesheet" href="/web/styles/logIn.css">
    <link rel="stylesheet" href="/web/styles/breakpoints.css">
</head>
<body>
    <jsp:include page="/web/pages/Header.jsp"></jsp:include>
    <jsp:include page="MenuBar.jsp"></jsp:include>

    <form class="sign-in-section" action="../../LogInServlet" method="get">
        <div class="container">
            <h2>შესვლა</h2>
            <p>გთხოვთ შეიყვანოთ მითითებული მონაცემები პროფილზე შესასვლელად.</p>
            <hr>
            <% if(request.getServletContext().getAttribute("errorMessage") != null) { %>
                    <p class="error_message"> ${errorMessage}</p>
            <% request.removeAttribute("errorMessage");
                } %>

            <div class="input-items">
                <label><b>Username</b></label>
                <input type="text" placeholder="შეიყვანეთ username"
                       name="log_in_username" id="log_in_username" required>

                <label><b>პაროლი</b></label>
                <input type="password" placeholder="შეიყვანეთ პაროლი"
                       name="log_in_password" id="log_in_password" required>

                <p> არ გაქვს პროფილი? <a href="Registration.jsp">დარეგისტრირდი ახლავე</a>.</p>

            </div>
            <button type="submit" class="button" >შესვლა</button>
        </div>

    </form>
    <jsp:include page="/web/pages/Footer.jsp"></jsp:include>
</body>
