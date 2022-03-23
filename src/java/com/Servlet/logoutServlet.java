package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class logoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();

        Cookie ck = new Cookie("userID", "");//deleting value of cookie  
        ck.setMaxAge(0);//changing the maximum age to 0 seconds  
        res.addCookie(ck);//adding cookie in the response 
 
        session.setAttribute("msg", "logutsuccess");
        res.sendRedirect("login.jsp");
    }
}
