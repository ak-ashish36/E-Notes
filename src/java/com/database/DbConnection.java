package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

    private static Connection con;

    public static Connection getConn() {

        String url = System.getenv("url");
        String username = System.getenv("user");
        String pass = System.getenv("pass");

        if (url == null) {
            url = "jdbc:mysql://127.0.0.1:3306/enotes";
        }
        if (username == null) {
            username = "root";
        }
        if (pass == null) {
            pass = "";
        }

        try {
            //Register Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            //Get Connection
            con = DriverManager.getConnection(url, username, pass);

            // Close Connection
//            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

}
