package com.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class employeeService {

    public static boolean employeeVerification(int id) throws Exception{
        String sql = "SELECT * FROM employee WHERE sin='"+id+"'";

        //instance of db_connection
        db_connection db = new db_connection();
        boolean verify = false;
        //can the connection method in db_connection
        try (Connection con = db.getConnection()){

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs=stmt.executeQuery();

            if (rs.next()) {
                System.out.println("Employee exists!");
                verify=true;
            } else {
                System.out.println("No matching employee found.");
                verify= false;
            }

            stmt.close();
            con.close();
            db.close();

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }

        return verify;
    }
}
