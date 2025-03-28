package com.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class db_connection {
    private static final String URL = "jdbc:postgresql://localhost:5432/Hotel Chain";
    private static final String USER = "postgres";
    private static final String PASSWORD = "db_2025";

    private Connection con = null;

    //Connects to Database Server
    public Connection getConnection() throws Exception{
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            return con;
        } catch (Exception e){
            throw new Exception ("Could not connect to Database Server :("+e.getMessage());
        }
    }


    //Closes database connection

    public void close() throws SQLException{
        try{
            if(con != null){
                con.close();
            }
        } catch (SQLException e){
            throw new SQLException("Could not close Database Server :("+e.getMessage());
        }
    }

}

