package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

    private static Connection con;

    public static Connection getConn() {
        String url = "jdbc:mysql://localhost:3306/enotes";
        String username = "root";
        String pass = "";
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
