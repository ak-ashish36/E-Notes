package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

    private static Connection con;

    public static Connection getConn() {
        String url = "jdbc:postgresql://ec2-63-32-248-14.eu-west-1.compute.amazonaws.com:5432/daqilo15ghcgk";
        String username = "zpjsgchzfaaypq";
        String pass = "9f6eb3ea7a36b1c24a2584251022fa3537cbb23922ae29a40f687b81abe3bbad";
        try {
            //Register Driver
            Class.forName("org.postgresql.Driver");

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
