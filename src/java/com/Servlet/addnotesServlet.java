package com.Servlet;

import com.User.userNotes;
import com.database.DbConnection;
import com.database.notesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "addnotesServlet", urlPatterns = {"/addnotesServlet"})
public class addnotesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        String contents = request.getParameter("contents");
        int uid = Integer.parseInt(request.getParameter("userid"));

        userNotes un = new userNotes();
        un.setTitle(title);
        un.setContents(contents);
        un.setUid(uid);

        Connection con = DbConnection.getConn();
        notesDAO ndao = new notesDAO(con);

        boolean f = ndao.addnotes(un);

        HttpSession session = request.getSession();
        if (f) {
            response.sendRedirect("getnotesServlet");
        } else {
            PrintWriter out = response.getWriter();
            out.println("<h1>Some Error occured on server site</h1>");
            out.println("<h1>Go Back and Try Again</h1>");
        }

    }

}
