package com.Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.sql.Connection;
import com.User.userDetails;
import com.database.DbConnection;
import com.database.userDAO;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();

        String fullname = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        userDetails us = new userDetails();
        us.setName(fullname);
        us.setEmail(email);
        us.setPassword(password);

        Connection con = DbConnection.getConn();

        userDAO udao = new userDAO(con);

        boolean f = udao.adduser(us);

        HttpSession session;
        session = req.getSession();

        if (f) {
            session.setAttribute("msg", "success");
            res.sendRedirect("register.jsp");
        } else {
            session.setAttribute("msg", "fail");
            res.sendRedirect("register.jsp");
        }

    }

}
