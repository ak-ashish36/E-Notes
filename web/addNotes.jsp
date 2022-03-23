<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
// Login Check
    userDetails us = (userDetails) session.getAttribute("user_details");
    if (us == null) {
        session.setAttribute("msg", "login");
        response.sendRedirect("login.jsp");
    } else {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Notes</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <h1 class="text-center">Add Your Notes</h1>
            <div class=" row col-md-12">

                <form action="addnotesServlet" method="post">
                    <div class="mb-3">
                        <input type="hidden" name="userid" value="<%= us.getId() %>">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput" class="form-label">Enter Title</label>
                        <input type="text" required="required" class="form-control" id="exampleFormControlInput" name="title">
                    </div>
                    <div class="mb-4">
                        <label for="exampleFormControlTextarea" class="form-label">Contents</label>
                        <textarea rows ="13" class="form-control" name="contents" id="exampleFormControlTextarea"></textarea>
                    </div>
                    <div class="text-center">
                        <button class="btn btn-primary" name="button">Add Notes</button>
                    </div>
                </form>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
<%
    }
%>

