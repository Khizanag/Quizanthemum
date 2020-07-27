<%@ page import="Controller.Classes.OtherClasses.User" %>
<%@ page import="Controller.Classes.OtherClasses.User" %>
<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page import="static Configs.Config.DEFAULT_ID" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(request.getServletContext().getAttribute("logedInUser") == null){
        int ID = DEFAULT_ID;
        String passwordHash = "";
        for(Cookie cookie : request.getCookies()){
            if(cookie.getName().equals("Quizanthemum-loged-in-user-ID")){
                ID = Integer.parseInt(cookie.getValue());
            }else if(cookie.getName().equals("Quizanthemum-loged-in-user-password-hash")){
                passwordHash = cookie.getValue();
            }
        }
        UsersManager usersManager = (UsersManager) request.getServletContext().getAttribute(USERS_MANAGER_STR);
        User logedInUser = usersManager.getUser(ID);
        if(logedInUser != null && logedInUser.getPasswordHash().equals(passwordHash)){
            request.getServletContext().setAttribute("logedInUser", logedInUser);
        }
    }
%>