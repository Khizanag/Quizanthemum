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

    <%
        ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
        CountriesManager countriesManager= (CountriesManager) managersManager.getManager(COUNTRIES_MANAGER_STR);
        List<Country> countries = countriesManager.getCountries();
    %>
</head>

<body style="padding:0px; margin:0px; font-family:arial,helvetica,sans-serif,verdana,'Open Sans'">

    <jsp:include page="/web/pages/PartPages/Header.jsp"/>
    <jsp:include page="/web/pages/PartPages/MenuBar.jsp"/>

    <form class="registration-section" action="/Registration" method="get">
        <div class="container">
            <h2>რეგისტრაცია</h2>
            <p>გთხოვთ შეავსოთ ფორმა პროფილის შესაქმნელად.</p>
            <hr>
            <%
                if(request.getServletContext().getAttribute(ERROR_MESSAGE) != null) { %>
                    <p class="error_message"> ${errorMessage}</p> <%
                    request.getServletContext().removeAttribute(ERROR_MESSAGE);
                }
            %>
            <div class="input-items">

                <div class="input-item">
                    <label><b>სახელი</b></label>
                    <input type="text" placeholder="შეიყვანეთ თქვენი სახელი"
                           name="registration_first_name" id="registration_first_name" required
                    >
                    <label><b>გვარი</b></label>
                    <input type="text" placeholder="შეიყვანეთ თქვენი გვარი"
                           name="registration_last_name" id="registration_last_name" required
                    >
                </div>

                <div class="input-item" style="width: 30%">
                <label><b>დაბადების თარიღი</b></label>
                <input type="date" name="registration_birth_date"
                       value="2000-01-01" id="registration_birth_date"
                        min= "1980-01-01" max="2020-01-01">
                </div>


                <label for="registration_country"><b>შეიყვანეთ ქვეყანა</b></label>
                <select class="drop-down" name="registration_country" id="registration_country" value="Georgia">
                    <% for(Country country : countries){ %>
                    <option value="<%=country.getName()%>"><%=country.getName()%></option>
                    <% } %>
                </select>

                <label><br><br></label>

                <label><b>ქალაქი</b></label>
                <input type="text" placeholder="შეიყვანეთ ქალაქი" name="registration_city" id="registration_city" required>

                <label><b>მომხმარებლის სახელი (USERNAME)</b></label>
                <input type="text" placeholder="შეიყვანეთ თქვენი მომხმარებლის სახელი"
                       name="registration_username" id="registration_username" required>

                <label><b>E-mail</b></label>
                <input type="email" placeholder="შეიყვანეთ email" name="registration_email"
                       id="registration_email" required>

                <label><b>მობილურის ნომერი</b></label>
                <input type="tel" placeholder="შეიყვანეთ მობილურის ნომერი" name="registration_phone"
                       id="registration_phone" required>

                <label><b>პაროლი</b></label>
                <input type="password" placeholder="შეიყვანეთ პაროლი"
                       name="registration_password" id="registration_password" required>

                <label for="psw-repeat"><b>გაიმეორეთ პაროლი</b></label>
                <input type="password" placeholder="გთხოვთ თავიდან შეიყვანოთ პაროლი"
                       name="psw-repeat" id="psw-repeat" required>
            </div>
            <hr>
            <p>ახალი პროგილის შქმნა გულისხმობს, რომ თქვენ ეთანხმებით ჩვენს
                <a href="https://sites.google.com/site/lawdeepsearch/CivilCodeofGeorgia"
                   target="_blank">წესებსა და მოთხოვნებს</a>.
            </p>
            <button type="submit" class="button" onclick="checkAndRedirect()">რეგისტრაცია</button>
        </div>

        <div class="container signin">
            <p>უკვე ხართ ამ გვერდის მომხმარებელი? <a href="LogInPage.jsp">შედით თქვენს პროფილზე</a>.</p>
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
            alert( "\n" + "პაროლი და განმეორებით შეყვანილი პაროლი არ ემთხვევა" + "\n" +
                   "\n" + "გთხოვთ გადაამოწმოთ შეყვანილი მონაცემები");
            return;
        }
    }
</script>