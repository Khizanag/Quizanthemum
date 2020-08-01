<%--
  Created by IntelliJ IDEA.
  User: gigakhizanishvili
  Date: 8/1/20
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="Model.Managers.ManagersManager" %>
<%@ page import="static Configs.Config.MANAGERS_MANAGER_STR" %>
<%@ page import="Model.Managers.CategoriesManager" %>
<%@ page import="static Configs.Config.CATEGORIES_MANAGER_STR" %>
<%@ page import="Controller.Classes.OtherClasses.Category" %>
<%@ page import="java.util.List" %>


<%
    ManagersManager managersManager = (ManagersManager) request.getServletContext().getAttribute(MANAGERS_MANAGER_STR);
    CategoriesManager categoriesManager = (CategoriesManager) managersManager.getManager(CATEGORIES_MANAGER_STR);
    List<Category> categories = categoriesManager.getCategories();
%>

<%--<div class="page-holder">--%>
<%--    <div class="container">--%>
        <div class="input-items" id="input-items">
            <label for="category"><b>აირჩიეთ კატეგორია</b></label>
            <select onchange="doIt()" class="drop-down" name="category" id="category">

                <%
                    for(Category category : categories){
                %>
                    <option value="<%=category.getID()%>"><%=category.getName()%></option>
                <%
                    }
                %>
            </select>
<%--            <div id="current-question-type"></div>--%>
<%--            <button class="button finish" type="button" onclick="redirectToQuizFinishedPage()">დასრულება</button>--%>
        </div>
<%--    </div>--%>
<%--</div>--%>