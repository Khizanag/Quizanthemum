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
<link rel="icon" type="image/png" href="../images/common/icon.png"/>
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
                    <a class="nav-item" target="_self" href="#">ქვიზები</a>
                    <div class="dropdown-content">
                        <% if(user != null)%>
                            <a class="nav-item grayeble" target="_self" href="/web/pages/QuizCreation.jsp">ქვიზის შექმნა</a>
                        <a class="nav-item grayeble" target="_self" href="../../DisplayNewestQuizzes">უახლესი</a>
                        <a class="nav-item grayeble" target="_self" href="../../DisplayMostPopularQuizzes">პოპულარული</a>
                        <a class="nav-item grayeble" target="_self" href="#">საუკეთესო</a>
                        <a class="nav-item grayeble" target="_self" href="#">მარტივები</a>
                        <a class="nav-item grayeble" target="_self" href="#">რთულები</a>
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
                <a class="nav-item" target="_self" href="/web/pages/Blog.jsp">ბლოგი</a>
                <a class="nav-item" target="_self" href="/web/pages/Contact.jsp">კონტაქტი</a>
                <a class="nav-item" target="_self" href="/web/pages/varskvlavebi.jsp">TEST</a>
            </ul>
        </nav>
        <div class="search-items">
            <input type="text" id="search-input" placeholder="რა გაინტერესებთ..." name="search">
            <button type="submit" onClick="openSearch()"><i class="fa fa-search"></i></button>
        </div>
    </div>
</div>

<jsp:include page="/web/pages/FriendsListPopup.jsp"></jsp:include>

<script>
    function displayCategoryFromMenuBar(ID){
        document.getElementById('chosen-category').value = ID;
        document.getElementById('categories-form').submit();
    }
</script>
