<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container-fluid back-img">
            <div class="text-center">
                <h1 class="text-white"><i class="fa fa-book" aria-hidden="true"></i> E-Notes Save your Notes</h1>
                <% if (user == null) {%>
                <a href="login.jsp" class="btn btn-light"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a>
                <%} else {%>
                <a href="logout" class="btn btn-light"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
                <% }%>
                <a href="register.jsp" class="btn btn-light"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>

</html>
