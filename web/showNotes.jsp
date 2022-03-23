<%@page import="com.database.notesDAO"%>
<%@page import="com.database.DbConnection"%>
<%@page import="com.database.userDAO"%>
<%@page import="com.User.userDetails"%>
<%@page import="com.User.userNotes"%>
<%@page import="java.util.List"%>
<%  //Login Check
    Cookie ck[] = request.getCookies();
    String userId_S = null;
    for (Cookie c : ck) {
        if (c.getName().equals("userID")) {
            userId_S = c.getValue();
        }
    }
    if (userId_S == null) {
        session.setAttribute("msg", "login");
        response.sendRedirect("login.jsp");
    } else {
//         Fetching user details
        userDAO udao = new userDAO(DbConnection.getConn());
        int userId = Integer.parseInt(userId_S);
        userDetails user = udao.getUser_fromID(userId);
//        Fetching notes of the user
        notesDAO ndao = new notesDAO(DbConnection.getConn());
        List<userNotes> notes = ndao.getNotes(user.getId());
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
        <% } else if (updateMsg == "note_deleted") {%>
        <div class="alert alert-success" role="alert">
            Note Deleted Successfully! 
        </div>
        <% } %>
        <div class="container">
            <h2 class="text-center">All Notes</h2>
            <div class="row">
                <div class="col-md-12">
                    <%
                        for (userNotes no : notes) {
                    %>
                    <div class="card mt-3">

                        <img src="./image/notes.png" class="card-img-top mt-3 mx-auto" style="max-width: 120px;">

                        <div class="card-body p-4">
                            <h5 class="card-title"><%= no.getTitle()%></h5>
                            <p><%= no.getContents()%></p>

                            <p>
                                <b class="text-success">Pubblished By: </b><b class="text-primary"><%= user.getName()%></b>
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
