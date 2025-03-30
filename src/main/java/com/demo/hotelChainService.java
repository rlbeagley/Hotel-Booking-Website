package com.demo;

import java.sql.*;

public class hotelChainService {




    public static void deleteHotelChain(String chainName) throws Exception {
        String sql = "DELETE FROM hotel_chain WHERE chain_name='"+chainName+"'";
        db_connection db = new db_connection();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.executeUpdate();

            System.out.println("Deleted Hotel Chain!");
            stmt.close();
            con.close();
            db.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public static void insertHotelChain(String chainName, String phoneNum, String email, String address) throws Exception {
        String updateSQL = "INSERT INTO hotel_chain(chain_name, phone_num, email, address) " +
                "VALUES ('"+chainName+"', '"+phoneNum+"', '"+email+"', '"+address+"')";
        db_connection db = new db_connection();

        try (Connection con = db.getConnection()) {
            PreparedStatement update = con.prepareStatement(updateSQL);
            update.executeUpdate();
            System.out.println("Inserted Hotel Chain!");
            update.close();
            con.close();
            db.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public static void updateHotelChain(String chainName, String phoneNum, String email, String address) throws Exception {
        String updateSQL = "UPDATE hotel_chain " +
                "SET phone_num = '"+phoneNum+"', " +
                "email = '"+email+"', " +
                "address = '"+address+"' " +
                "WHERE chain_name = '"+chainName+"'";
        db_connection db = new db_connection();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(updateSQL);
            stmt.executeUpdate();
            System.out.println("Updated Hotel Chain!");
            stmt.close();
            con.close();
            db.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}

