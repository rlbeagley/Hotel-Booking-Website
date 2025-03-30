package com.demo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class roomService {


    public static void main (String args[]){
        try{

            //different method calls. not sure if they need to be commented out

            deleteRoom(100,3);
            insertRoom(100,3,200.0,"double","none",true);
            updateRoom(100,3,250.0,"double","mountain",true);

            //filter(210.0,400.0,"Ottawa","double",Date.valueOf("2022-10-12"),Date.valueOf("2022-10-13"));
            //availability("Toronto", Date.valueOf("2022-10-11"));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    //returns the average price of a room at the given hotel

    public static float avgPrice(int hotel_id)throws Exception{

        //Store query in a String for prettier code
        String sql = "SELECT AVG(price) FROM room WHERE hotel_id='"+hotel_id+"'";

        //instance of db_connection
        db_connection db = new db_connection();
        float avgPrice = 0;

        //can the connection method in db_connection
        try (Connection con = db.getConnection()){


            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            //skips to the first column/row i actually dont know lol
            rs.next();

            //converts the Result Set to a useable value
            avgPrice= rs.getFloat(1);

            System.out.println("Average Price: "+avgPrice);

            rs.close();
            stmt.close();
            con.close();
            db.close();
            return avgPrice;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    //returns the number of rooms available in a specific city at a specific time

    public static int availability(String city, Date arrival_date)throws Exception{
        String sqlAvailability = "SELECT * FROM availability";
        String sqlRoom = "SELECT * FROM room_count";

        db_connection db = new db_connection();

        int totalRooms = 0;

        try (Connection con = db.getConnection()){

            //double the result sets bcos two queries
            PreparedStatement stmt = con.prepareStatement(sqlAvailability);
            ResultSet avbl = stmt.executeQuery();

            PreparedStatement stmt2 = con.prepareStatement(sqlRoom);
            ResultSet room = stmt2.executeQuery();

            //im a sucker for flags what can i say
            boolean flag = true;
            while (room.next() && flag){

                //when we find the city were looking for, set total rooms to the sum of its rooms
                //see the room_count view for how total rooms is calculated
                if((room.getString("city")).equals(city)){
                    totalRooms=room.getInt(2);
                    System.out.println("Total Rooms: "+totalRooms);
                    flag=false;
                }
            }

            //a check in case we dont find the city were looking for (user error)
            if(totalRooms==0){
                System.out.println("uhhhh double check that one");
                return 0;
            }

            //look through all rooms with bookings and if their arrival date and city match, remove one from the total
            while(avbl.next()){
                if(((avbl.getDate("arrival_date")).equals(arrival_date)) && (avbl.getString("city")).equals(city)){
                    System.out.println("System Date: "+avbl.getDate("arrival_date")+" User Date: "+arrival_date);
                    totalRooms--;
                }
            }

            room.close();
            avbl.close();
            stmt.close();
            con.close();
            db.close();
            System.out.println("Final Availability "+totalRooms);
            return totalRooms;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }


    //beefy method to take a bunch of filters and look for all rooms that match and add them to a list
    public static List<room> filter(Double minPrice, Double maxPrice, String city, String capacity, Date arrival_date, Date leave_date) throws Exception{
        String sql = "SELECT r.*,h.*, b.arrival_date, b.leave_date FROM room r JOIN hotel h ON r.hotel_id = h.hotel_id LEFT JOIN booking b ON r.room_num = b.room_num AND r.hotel_id = b.hotel_id;";
        db_connection db = new db_connection();
        List<room> rooms = new ArrayList<>();

        try (Connection con = db.getConnection()){
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()){
                //set dates to variables for simplicity
                Date bookedDate = rs.getDate("arrival_date");
                Date bookedLeave = rs.getDate("leave_date");

                //this is a silly solution to arrival date being null on most rooms
                if(bookedDate==null){
                    bookedDate=Date.valueOf("1900-10-11");
                    bookedLeave=Date.valueOf("1900-10-12");
                }

                //check all the user entered filters
                if(((rs.getDouble("price")>=minPrice)
                        && (rs.getDouble("price")<=maxPrice)
                        && (rs.getString("capacity").equals(capacity))
                        && (rs.getString("city").equals(city)))

                        //if the booking's leave date is earlier than the planned arrival date or the planned leave date
                        //is after the bookings arrival date
                        && ((bookedLeave.before(arrival_date) || leave_date.after(bookedDate)))

                ) {
                    System.out.println("adding!");
                    System.out.println(rs.getInt("room_num"));
                    //create room object to add to the array
                    room room = new room(
                            rs.getInt("room_num"),
                            rs.getInt("hotel_id"),
                            rs.getString("capacity"),
                            rs.getString("view_type"),
                            rs.getBoolean("can_extend"),
                            rs.getString("chain_name"),
                            rs.getInt("rating"),
                            rs.getString("city")
                    );
                    rooms.add(room);
                }
            }


            System.out.println(rooms);

            rs.close();
            stmt.close();
            con.close();
            db.close();
            return rooms;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }


    public static void deleteRoom(int room_num, int hotel_id) throws Exception{
        String sql = "DELETE FROM room WHERE room_num='"+room_num+"' AND hotel_id='"+hotel_id+"'";
        //instance of db_connection
        db_connection db = new db_connection();

        //can the connection method in db_connection
        try (Connection con = db.getConnection()){
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.executeUpdate();
            System.out.println("Deleted Room!");
            stmt.close();
            con.close();
            db.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public static void insertRoom(int room_num, int hotel_id, double price, String capacity, String view_type, Boolean can_extend) throws Exception{


        String updateSQL =
                "INSERT INTO room(room_num,hotel_id,price,capacity,view_type,can_extend) " +
                        "VALUES ('"+room_num+"','"+hotel_id+"','"+price+"','"+capacity+"','"+view_type+"','"+can_extend+"')";

        //instance of db_connection
        db_connection db = new db_connection();

        //can the connection method in db_connection
        try (Connection con = db.getConnection()){
            PreparedStatement update = con.prepareStatement(updateSQL);

            update.executeUpdate();
            System.out.println("Inserted Room!");

            update.close();
            con.close();
            db.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }

    }

    public static void updateRoom(int room_num, int hotel_id, double price, String capacity, String view_type, Boolean can_extend) throws Exception{
        String updateSQL = "UPDATE room " +
                "SET price = '"+price+"', " +
                "capacity = '"+capacity+"', " +
                "view_type = '"+view_type+"', " +
                "can_extend = '"+can_extend+"' " +
                "WHERE room_num = '"+room_num+"' AND hotel_id = '"+hotel_id+"';";

        //instance of db_connection
        db_connection db = new db_connection();

        //can the connection method in db_connection
        try (Connection con = db.getConnection()){
            PreparedStatement stmt = con.prepareStatement(updateSQL);
            stmt.executeUpdate();

            System.out.println("Updated Room!");

            stmt.close();
            con.close();
            db.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }



}

