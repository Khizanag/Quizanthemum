<%@ page import="Model.Managers.UsersManager" %>
<%@ page import="static Configs.Config.USERS_MANAGER_STR" %>
<%@ page import="static Configs.Config.DEFAULT_ID" %>
<%@ page import="Controller.Classes.User.User" %>
<%@ page import="static Configs.Config.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    User user = (User) request.getServletContext().getAttribute(LOGGED_IN_USER);
    if(user== null){
        int ID = DEFAULT_ID;
        String passwordHash = "";

        if(request.getCookies() != null){
            for(Cookie cookie : request.getCookies()){
                if(cookie.getName().equals(LOGGED_IN_USER_ID)){
                    ID = Integer.parseInt(cookie.getValue());
                }else if(cookie.getName().equals(LOGGED_IN_USER_PASSWORD_HASH)){
                    passwordHash = cookie.getValue();
                }
            }
            UsersManager usersManager = (UsersManager) request.getServletContext().getAttribute(USERS_MANAGER_STR);
            user = usersManager.getUser(ID);
            if(user != null && user.getPasswordHash().equals(passwordHash)){
                request.getServletContext().setAttribute(LOGGED_IN_USER, user);
            }
        }
    }
%>