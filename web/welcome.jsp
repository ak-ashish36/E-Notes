<%@page import="com.User.userDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% // Login Check
    userDetails us = (userDetails) session.getAttribute("user_details");

    if (us == null) {
        session.setAttribute("msg", "login");
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="offset-md-0">
            <div class="card mt-1">
                <div class="card-body text-center">
                    <img src="./image/notes.jpeg" class="img-fluid mx-auto" style="max-width:900px;">
                    <h1 class="my-2">Start Taking Your Notes</h1>
                    <a href="addNotes.jsp" class="btn btn-outline-primary">Start Here</a>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
