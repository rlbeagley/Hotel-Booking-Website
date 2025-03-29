package com.demo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class bookingService {

    public static void main (String args[]){
        try{

            //different method calls. not sure if they need to be commented out

            deleteBooking(107,3,1);
            deleteBooking(107,3,2);
            insertBooking(107,3,1,Date.valueOf("2025-03-11"),Date.valueOf("2025-03-12"));
            insertBooking(107,3,2,Date.valueOf("2025-03-15"),Date.valueOf("2025-03-16"));
            updateBooking(107,3,1,Date.valueOf("2025-03-24"),Date.valueOf("2025-03-25"));
            updateBooking(107,3,1,Date.valueOf("2025-03-15"),Date.valueOf("2025-03-16"));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    public void updateBooking(){

    }

    public static void deleteBooking(int room_num, int hotel_id, int id) throws Exception{
        String sql = "DELETE FROM booking WHERE room_num='"+room_num+"' AND hotel_id = '"+hotel_id+"' AND id = '"+id+"'";
        //instance of db_connection
        db_connection db = new db_connection();

        //can the connection method in db_connection
        try (Connection con = db.getConnection()){
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.executeUpdate();
            System.out.println("Deleted Booking!");
            stmt.close();
            con.close();
            db.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public static void insertBooking(int room_num, int hotel_id, int id, Date arrival_date, Date leave_date) throws Exception{


        String updateSQL =
                "INSERT INTO booking(room_num,hotel_id,id,arrival_date,leave_date) " +
                        "VALUES ('"+room_num+"','"+hotel_id+"','"+id+"','"+arrival_date+"', '"+leave_date+"')";

        //instance of db_connection
        db_connection db = new db_connection();

        //can the connection method in db_connection
        try (Connection con = db.getConnection()){
            PreparedStatement update = con.prepareStatement(updateSQL);

            update.executeUpdate();
            System.out.println("Inserted Booking!");

            update.close();
            con.close();
            db.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }

    }

    public static void updateBooking(int room_num, int hotel_id, int id, Date arrival_date, Date leave_date) throws Exception{
        String updateSQL = "UPDATE booking " +
                "SET arrival_date = '"+arrival_date+"', leave_date = '"+leave_date+"' " +
                "WHERE (room_num='"+room_num+"' AND hotel_id ='"+hotel_id+"' AND id ='"+id+"');";

        String rooms = "SELECT * FROM booking;";
        //instance of db_connection
        db_connection db = new db_connection();

        //can the connection method in db_connection
        try (Connection con = db.getConnection()){
            PreparedStatement stmt = con.prepareStatement(rooms);
            ResultSet rs = stmt.executeQuery();


            while (rs.next()){
                Date bookedDate = rs.getDate("arrival_date");
                Date bookedLeave = rs.getDate("leave_date");

                if(bookedDate==null){
                    bookedDate=Date.valueOf("1900-10-11");
                    bookedLeave=Date.valueOf("1900-10-12");
                }

                if(!(bookedLeave.before(arrival_date) || leave_date.after(bookedDate))){
                    System.out.println("overlap");
                    System.out.println(arrival_date +","+leave_date+","+bookedDate+","+bookedLeave+", room: "+room_num);
                    if((rs.getString("room_num").equals(Integer.toString(room_num)))
                            && (rs.getString("hotel_id").equals(Integer.toString(hotel_id)))
                    ){
                        System.out.println("rooms match");
                        throw new IllegalArgumentException("Invalid Dates!");
                    }
                }
            }
            PreparedStatement update = con.prepareStatement(updateSQL);

            update.executeUpdate();
            System.out.println("Updated Booking!");

            rs.close();
            update.close();
            stmt.close();
            con.close();
            db.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}
