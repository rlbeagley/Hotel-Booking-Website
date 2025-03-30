package com.demo;

import java.sql.*;

public class rentingService {

    public static void main (String args[]){
        try{

            //different method calls. not sure if they need to be commented out

            deleteRenting(107,3,1);
            deleteRenting(107,3,2);
            insertRenting(107,3,1, Timestamp.valueOf("2025-03-11 12:12:12"));
            insertRenting(107,3,2,Timestamp.valueOf("2025-03-15 12:12:12"));
            updateRenting(107,3,1);
            updateRenting(107,3,1);
        } catch (Exception e) {
            System.out.println(e.getMessage());
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

    public static void insertRenting(int room_num, int hotel_id, int id, Timestamp check_in) throws Exception{


        String updateSQL =
                "INSERT INTO renting(room_num,hotel_id,id,check_in) " +
                        "VALUES ('"+room_num+"','"+hotel_id+"','"+id+"','"+check_in+"')";

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
            throw new Exception(e.getMessage());
        }
    }
}
