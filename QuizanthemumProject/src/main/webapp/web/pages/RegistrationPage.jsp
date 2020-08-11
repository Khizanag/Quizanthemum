<%@ page import="static javax.servlet.RequestDispatcher.ERROR_MESSAGE" %>
<%@ page import="Controller.Classes.OtherClasses.Country" %>
<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="Model.Managers.CategoriesManager" %>
<%@ page import="java.util.List" %>
<%@ page import="static Configs.Config.CATEGORIES_MANAGER_STR" %>
<%@ page import="static Configs.Config.MANAGERS_MANAGER_STR" %>
<%@ page import="Model.Managers.CountriesManager" %>
<%@ page import="static Configs.Config.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <title> Registration </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/png" href="/web/images/common/icon.png"/>
    <link rel="stylesheet" href="/web/styles/common.css">
    <link rel="stylesheet" href="/web/styles/logIn.css">
    <link rel="stylesheet" href="/web/styles/breakpoints.css">
    <link rel="stylesheet" href="/web/styles/quizCreation.css">

    <%
        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        CountriesManager countriesManager= (CountriesManager) managersManager.getManager(COUNTRIES_MANAGER_STR);
        List<Country> countries = countriesManager.getCountries();
    %>
</head>

<style>
    .input-item {
        display: flex;
        flex-direction: row;
        width: 100%;
    }
    .combo-item {
        display: flex;
        flex-direction: column;
        width: 40%;
        margin-right: 20px;
    }

</style>

<body style="padding:0px; margin:0px; font-family:arial,helvetica,sans-serif,verdana,'Open Sans'">

    <jsp:include page="/web/pages/PartPages/Header.jsp"/>
    <jsp:include page="/web/pages/PartPages/MenuBar.jsp"/>

    <form class="registration-section" action="/Registration" method="GET">
        <div class="container">
            <h2>Registration</h2>
            <p>Please fill in given fields to register.</p>
            <hr>
            <%
                if(request.getServletContext().getAttribute(ERROR_MESSAGE) != null) { %>
                    <p class="error_message"> ${errorMessage}</p> <%
                    request.getServletContext().removeAttribute(ERROR_MESSAGE);
                }
            %>
            <div class="input-items">
                <div class="input-item">
                    <div class="combo-item">
                        <label><b>First Name</b></label>
                        <input type="text" placeholder="Enter your name"
                               name="registration_first_name" id="registration_first_name" required>
                    </div>

                    <div class="combo-item">
                        <label><b>Last Name</b></label>
                        <input type="text" placeholder="Enter your last name"
                               name="registration_last_name" id="registration_last_name" required>
                    </div>
                </div>

                <div style="width: 30%">
                    <label><b>Birth Date</b></label>
                    <input type="date" name="registration_birth_date"
                           value="2000-01-01" id="registration_birth_date"
                            min= "1980-01-01" max="2020-01-01">
                </div>

                <div class="input-item">
                    <div class="combo-item">
                        <label for="registration_country"><b>Country</b></label>
                        <input type="text" list="registration_country" placeholder="Enter your Country...">
                        <datalist class="drop-down" name="registration_country" id="registration_country" value="Georgia">
                            <% for(Country country : countries){ %>
                            <option value="<%=country.getName()%>"></option>
                            <% } %>
                        </datalist>
                    </div>

                    <div class="combo-item">
                        <label><b>City</b></label>
                        <input type="text" placeholder="Enter your City..." name="registration_city" id="registration_city" required>
                    </div>
                </div>

                <div class="input-item">
                    <div class="combo-item">
                        <label><b>USERNAME</b></label>
                        <input type="text" placeholder="Enter  your username..."
                               name="registration_username" id="registration_username" required>
                    </div>

                    <div class="combo-item">
                        <label><b>E-mail</b></label>
                        <input type="email" placeholder="Enter email" name="registration_email"
                               id="registration_email" required>
                    </div>
                </div>

                <div class="combo-item" style="width: 82%">
                    <label><b>Phone Number</b></label>
                    <input type="tel" placeholder="Enter your phone number..." name="registration_phone"
                           id="registration_phone" required>
                </div>
                <div class="input-item">
                    <div class="combo-item">
                        <label><b>Password</b></label>
                        <input type="password" placeholder="Enter Password"
                               name="registration_password" id="registration_password" required>
                    </div>

                    <div class="combo-item">
                        <label for="psw-repeat"><b>Repeat Password</b></label>
                        <input type="password" placeholder="Please Enter Password Again"
                               name="psw-repeat" id="psw-repeat" required>
                    </div>
                </div>
            </div>
            <hr>
            <p>Create new profile means that you agree to our Terms&Conditions
                <a href="https://sites.google.com/site/lawdeepsearch/CivilCodeofGeorgia"
                   target="_blank">Terms&Conditions</a>.
            </p>
            <button type="submit" class="button" onclick="checkAndRedirect()">Register</button>
        </div>

        <div class="container signin">
            <p>Already have an account? <a href="LogInPage.jsp">Login</a>.</p>
        </div>
    </form>
    <jsp:include page="/web/pages/PartPages/Footer.jsp"/>
</body>

<script >
    function checkAndRedirect() {
        let f_name = document.getElementById("registration_first_name").value !== '';
        let l_name = document.getElementById("registration_last_name").value !== '';
        let username = document.getElementById("registration_username").value !== '';
        let email = document.getElementById("registration_email").value !== '';
        let password = document.getElementById("registration_password").value ;
        let rep_pwd = document.getElementById("psw-repeat").value;

        if(password != rep_pwd) {
            alert( "\n" + "Passwords Do not match" + "\n" +
                   "\n" + "Please make sure they are identical");
            return;
        }
    }
</script>
