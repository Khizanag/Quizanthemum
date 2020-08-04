<%@ page import="Controller.Classes.User.User" %>
<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="Model.Managers.CategoriesManager" %>
<%@ page import="Controller.Classes.OtherClasses.Category" %>
<%@ page import="static Configs.Config.MANAGERS_MANAGER_STR" %>
<%@ page import="static Configs.Config.CATEGORIES_MANAGER_STR" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: gigakhizanishvili
  Date: 7/27/20
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="../../images/common/icon.png"/>
<link rel="stylesheet" href="/web/styles/common.css">
<link rel="stylesheet" href="/web/styles/breakpoints.css">
<link rel="stylesheet" href="/web/styles/MenuBar.css">

<% User user = (User) request.getServletContext().getAttribute("logedInUser"); %>
<script>
    function logout(){
        const logoutForm = document.getElementById("logoutForm");
        logoutForm.action="../../LogOut"
        const currUrl = document.getElementById("currentUrl");
        currUrl.value=window.location.href;
        logoutForm.submit();
    }
</script>

<%
    ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
    CategoriesManager categoriesManager = (CategoriesManager) managersManager.getManager(CATEGORIES_MANAGER_STR);
    List<Category> categories = categoriesManager.getCategories();
%>

<div class="nav-section">
    <div class="container manu">
        <nav class="nav">
            <ul class="nav-items">
                <a class="nav-item" target="_self" href="/">მთავარი</a>

                <div class="dropdown">
                    <a class="nav-item" target="_self" href="/DisplayQuizzes">ქვიზები</a>
                    <div class="dropdown-content">
                        <a class="nav-item grayeble" target="_self" href="/DisplayNewestQuizzes">უახლესი</a>
                        <a class="nav-item grayeble" target="_self" href="/DisplayMostPopularQuizzes">პოპულარული</a>
                        <a class="nav-item grayeble" target="_self" href="/DisplayHighestRatedQuizzes">მაღალრეიტინგული</a>
                        <% if(user != null){ %>
                            <a class="nav-item grayeble" target="_self" href="/QuizCreation">ქვიზის შექმნა</a>
                        <% } %>
                    </div>
                </div>
                <div class="dropdown">
                    <a class="nav-item" target="_self" href="#">კატეგორიები</a>
                    <div class="dropdown-content">
                        <% for(Category category : categories){ %>
                            <a class="nav-item grayeble" target="_self" href="#" value="<%=category.getID()%>"onclick="displayCategoryFromMenuBar(<%=category.getID()%>)"><%=category.getName()%></a>
                        <% } %>

                        <form id="categories-form" action="DisplayCategory" method="get">
                            <input type="hidden" id="chosen-category" name="chosen-category">
                        </form>
                    </div>
                </div>
                <a class="nav-item" target="_self" href="/Blog">ბლოგი</a>
                <a class="nav-item" target="_self" href="/Contact">კონტაქტი</a>
            </ul>
        </nav>
        <form class="search-items" action="/SearchPage" method="get">
            <input type="text" id="search-input" placeholder="რა გაინტერესებთ..." name="search">
            <button type="submit"><i class="fa fa-search"></i></button>
        </form>
    </div>
</div>

<script>
    function displayCategoryFromMenuBar(ID){
        document.getElementById('chosen-category').value = ID;
        document.getElementById('categories-form').submit();
    }

</script>
