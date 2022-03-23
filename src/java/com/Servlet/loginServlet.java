package com.Servlet;

import com.User.userDetails;
import com.database.DbConnection;
import com.database.userDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();

        String email = req.getParameter("useremail");
        String password = req.getParameter("userpassword");

        userDetails login_user = new userDetails();
        login_user.setEmail(email);
        login_user.setPassword(password);

        Connection con = DbConnection.getConn();
        userDAO dao = new userDAO(con);

        userDetails loged_user = dao.getUser(login_user);

        HttpSession session = req.getSession();

        if (loged_user != null) {
            String userId = Integer.toString(loged_user.getId());
            Cookie ck = new Cookie("userID", userId);
            res.addCookie(ck);

            res.sendRedirect("welcome.jsp");
        } else {
            session.setAttribute("msg", "fail");
            res.sendRedirect("login.jsp");
        }

    }

}
