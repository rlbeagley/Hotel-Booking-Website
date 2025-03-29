package com.demo;
import java.sql.Date;

public class booking {

    private int room_num;
    private int hotel_id;
    private int id;
    private Date arrival_date;
    private Date leave_date;

    public booking(int room_num, int hotel_id, int id, Date arrival_date, Date leave_date){
        this.room_num= room_num;
        this.hotel_id = hotel_id;
        this.id = id;
        this.arrival_date = arrival_date;
        this.leave_date = leave_date;
    }

    //getters/setters
    public int getroomNum(){
        return this.room_num;
    }

    public int gethotelID(){
        return this.hotel_id;
    }

    public int getID(){
        return this.id;
    }

    public Date getarrivalDate(){
        return this.arrival_date;
    }

    public Date getleaveDate(){
        return this.leave_date;
    }


}
