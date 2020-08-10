<%@ page import="static javax.servlet.RequestDispatcher.ERROR_MESSAGE" %>
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
    <jsp:include page="/web/pages/PartPages/Header.jsp"/>
    <jsp:include page="PartPages/MenuBar.jsp"/>

    <form class="sign-in-section" action="/LogIn" method="get">
        <div class="container">
            <h2>Log In</h2>
            <p>Please enter Username and Password to Login</p>
            <hr>
            <%
                if(request.getServletContext().getAttribute(ERROR_MESSAGE) != null) { %>
                    <p class="error_message"> ${errorMessage}</p>
                    <% request.getServletContext().removeAttribute(ERROR_MESSAGE);
                }
            %>

            <div class="input-items">
                <label><b>Username</b></label>
                <input type="text" placeholder="Enter username"
                       name="log_in_username" id="log_in_username" required>

                <label><b>Password</b></label>
                <input type="password" placeholder="Enter Password"
                       name="log_in_password" id="log_in_password" required>

                <p> Don`t have an account? <a href="RegistrationPage.jsp">Register now</a>.</p>

            </div>
            <button type="submit" class="button" >Login</button>
        </div>

    </form>
    <jsp:include page="/web/pages/PartPages/Footer.jsp"/>
</body>
