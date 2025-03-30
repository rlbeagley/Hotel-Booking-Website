package com.demo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class customerService {

    public static void main(String args[]){
        try{
            registration(223456789,"Mark Iplier", "43 Mingus Road");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    public static void registration(int id, String name, String address) throws Exception{
        String sql = "SELECT * FROM customer WHERE id='"+id+"'";
        String insert = "INSERT INTO customer(id,name,address,reg_date) " +
                "VALUES ('"+id+"','"+name+"','"+address+"',CURRENT_DATE)";
        //instance of db_connection
        db_connection db = new db_connection();

        //can the connection method in db_connection
        try (Connection con = db.getConnection()){

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs=stmt.executeQuery();

            PreparedStatement stmt2 = con.prepareStatement(insert);

            if (rs.next()) {
                System.out.println("Customer exists!");
            } else {
                System.out.println("No matching customer found.");
                stmt2.executeUpdate();

            }

            System.out.println("Registered user: "+id);
            stmt2.close();
            stmt.close();
            con.close();
            db.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }

    }
}
