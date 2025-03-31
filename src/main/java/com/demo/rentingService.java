package com.demo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class rentingService {

    public static void main (String args[]){
        try{

            //different method calls. not sure if they need to be commented out

            //deleteRenting(107,3,123456789);
            //deleteRenting(107,3,123456790);
            insertRenting(107,3,123456789);
            insertRenting(107,3,123456790);
            updateRenting(107,3,123456789);
            updateRenting(107,3,123456789);

            rentings(3);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }


    public static List<renting> rentings(int hotel_id) throws Exception{
        String sql = "SELECT * FROM renting WHERE hotel_id = '"+hotel_id+"'";

        db_connection db = new db_connection();
        List<renting> rentings = new ArrayList<>();

        try (Connection con = db.getConnection()){
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()){
                renting renting = new renting(
                        rs.getInt("room_num"),
                        rs.getInt("hotel_id"),
                        rs.getInt("id"),
                        rs.getTimestamp("check_in"),
                        rs.getTimestamp("check_out"));
                rentings.add(renting);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();
            return rentings;
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    public static void deleteRenting(int room_num, int hotel_id, int id) throws Exception{
        String sql = "DELETE FROM Renting WHERE room_num='"+room_num+"' AND hotel_id = '"+hotel_id+"' AND id = '"+id+"'";
        //instance of db_connection
        db_connection db = new db_connection();

        //can the connection method in db_connection
        try (Connection con = db.getConnection()){
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.executeUpdate();
            System.out.println("Deleted Renting!");
            stmt.close();
            con.close();
            db.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public static void insertRenting(int room_num, int hotel_id, int id) throws Exception{
        System.out.println("insert renting!");

        String updateSQL =
                "INSERT INTO renting(room_num,hotel_id,id,check_in) " +
                        "VALUES ('"+room_num+"','"+hotel_id+"','"+id+"',CURRENT_TIMESTAMP)";

        //instance of db_connection
        db_connection db = new db_connection();

        //can the connection method in db_connection
        try (Connection con = db.getConnection()){
            PreparedStatement update = con.prepareStatement(updateSQL);

            update.executeUpdate();
            System.out.println("Inserted Renting!");

            update.close();
            con.close();
            db.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }

    }

    public static void updateRenting(int room_num, int hotel_id, int id) throws Exception{
        String updateSQL = "UPDATE renting " +
                "SET check_out = CURRENT_TIMESTAMP " +
                "WHERE (room_num='"+room_num+"' AND hotel_id ='"+hotel_id+"' AND id ='"+id+"');";

        //instance of db_connection
        db_connection db = new db_connection();

        //can the connection method in db_connection
        try (Connection con = db.getConnection()){
            PreparedStatement stmt = con.prepareStatement(updateSQL);
            stmt.executeUpdate();

            System.out.println("Updated Renting!");

            stmt.close();
            con.close();
            db.close();
        } catch (Exception e) {
            System.out.println("error updating Renting!");
            throw new Exception(e.getMessage());
        }
    }
}
