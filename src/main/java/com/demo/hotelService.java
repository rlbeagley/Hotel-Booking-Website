package com.demo;

import java.sql.*;

public class hotelService {

    public static void deleteHotel(int hotel_id) throws Exception {
        String sql = "DELETE FROM hotel WHERE hotel_id='" + hotel_id + "'";

        db_connection db = new db_connection();
        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.executeUpdate();
            System.out.println("Deleted Hotel!");
            stmt.close();
            con.close();
            db.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public static void insertHotel(int hotel_id, String chain_name, int rating, String address, String city, String email, String phone_num) throws Exception {
        String updateSQL = "INSERT INTO hotel(hotel_id, chain_name, rating, address, city, email, phone_num) " +
                "VALUES ('" + hotel_id + "', '" + chain_name + "', '" + rating + "', '" + address + "', '" + city + "', '" + email + "', '" + phone_num + "')";

        db_connection db = new db_connection();
        try (Connection con = db.getConnection()) {
            PreparedStatement update = con.prepareStatement(updateSQL);
            update.executeUpdate();
            System.out.println("Inserted Hotel!");
            update.close();
            con.close();
            db.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public static void updateHotel(int hotel_id, String chain_name, int rating, String address, String city, String email, String phone_num) throws Exception {
        String updateSQL = "UPDATE hotel " +
                "SET chain_name = '"+chain_name+"', " +
                "rating = '"+rating+"', " +
                "address = '"+address+"', " +
                "city = '"+city+"', " +
                "email = '"+email+"', " +
                "phone_num = '"+phone_num+"' " +
                "WHERE hotel_id = '"+hotel_id+"'";

        db_connection db = new db_connection();
        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(updateSQL);
            stmt.executeUpdate();

            System.out.println("Updated Hotel!");
            stmt.close();
            con.close();
            db.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}
