<%@page import="com.database.DbConnection"%>
<%@page import="com.database.notesDAO"%>
<%@page import="com.User.userNotes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//Login Check
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
    } else {//Getting User Specific Notes
        Integer noteId = Integer.parseInt(request.getParameter("note_id"));
        notesDAO ndao = new notesDAO(DbConnection.getConn());
        userNotes currnotes = ndao.get_Notes_byId(noteId);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Note</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <h1 class="text-center">Edit Your Note</h1>
            <div class=" row col-md-12">

                <form action="editnotesServlet" method="post">
                    <div class="mb-3">
                        <input type="hidden" name="noteid" value="<%=noteId%>">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput" class="form-label">Enter Title</label>
                        <input type="text" required="required" class="form-control" id="exampleFormControlInput" name="title" value = "<%=currnotes.getTitle()%>" >
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea" class="form-label">Contents</label>
                        <textarea rows ="12" class="form-control" name="contents" id="exampleFormControlTextarea"><%=currnotes.getContents()%></textarea>
                    </div>
                    <div class="text-center">
                        <button class="btn btn-primary" name="button">Update</button>
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

