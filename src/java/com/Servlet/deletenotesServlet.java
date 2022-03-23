package com.Servlet;

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

@WebServlet(name = "deletenotesServlet", urlPatterns = {"/deletenotesServlet"})
public class deletenotesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int noteId = Integer.parseInt(request.getParameter("note_id"));

        Connection con = DbConnection.getConn();
        notesDAO ndao = new notesDAO(con);

        boolean f = ndao.deletenotes(noteId);
        HttpSession session = request.getSession();
        if (f) {
            session.setAttribute("msg", "note_deleted");
            response.sendRedirect("getnotesServlet");
        } else {
            PrintWriter out = response.getWriter();
            out.println("<h1>Some Error occured on server site</h1>");
            out.println("<h1>Go Back and Try Again</h1>");
        }

    }

}
