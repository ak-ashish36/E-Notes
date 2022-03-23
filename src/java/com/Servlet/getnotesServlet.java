package com.Servlet;

import com.User.userDetails;
import com.User.userNotes;
import com.database.DbConnection;
import com.database.notesDAO;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "getnotesServlet", urlPatterns = {"/getnotesServlet"})
public class getnotesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        userDetails us = (userDetails) session.getAttribute("user_details");

        if (us != null) {
            Connection con = DbConnection.getConn();
            notesDAO ndao = new notesDAO(con);

            List<userNotes> notes = ndao.getNotes(us.getId());

            session.setAttribute("notes", notes);
            response.sendRedirect("showNotes.jsp");

        }else{
            session.setAttribute("msg", "login");
            response.sendRedirect("login.jsp");
        }
    }
}
