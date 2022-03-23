<%@page import="com.User.userNotes"%>
<%@page import="java.util.List"%>
<%
    userDetails us = (userDetails) session.getAttribute("user_details");
    if (us == null) {
        session.setAttribute("msg", "login");
        response.sendRedirect("login.jsp");
    } else {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Notes</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <% String updateMsg = (String) session.getAttribute("msg");
            session.removeAttribute("msg");
            if (updateMsg == "note_updated") {
        %>
        <div class="alert alert-success" role="alert">
            Note Updated Successfully! 
        </div>
        <% }else if(updateMsg == "note_deleted"){%>
        <div class="alert alert-success" role="alert">
            Note Deleted Successfully! 
        </div>
        <% } %>
        <div class="container">
            <h2 class="text-center">All Notes</h2>
            <div class="row">
                <div class="col-md-12">
                    <%                        List<userNotes> notes = (List<userNotes>) session.getAttribute("notes");
                        for (userNotes no : notes) {
                    %>
                    <div class="card mt-3">

                        <img src="./image/notes.png" class="card-img-top mt-3 mx-auto" style="max-width: 120px;">

                        <div class="card-body p-4">
                            <h5 class="card-title"><%= no.getTitle()%></h5>
                            <p><%= no.getContents()%></p>

                            <p>
                                <b class="text-success">Pubblished By: </b><b class="text-primary"><%= us.getName()%></b>
                            </p>
                            <p>
                                <b class="text-success">Date: </b><b class="text-primary"><%= no.getDate()%></b>
                            </p>
                            <div class="container text-center mt-2">
                                <a href="deletenotesServlet?note_id=<%= no.getId()%>" class="btn btn-danger">Delete</a>
                                <a href="editNotes.jsp?note_id=<%= no.getId()%>" class="btn btn-primary">Edit</a>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
<%
    }
%>
