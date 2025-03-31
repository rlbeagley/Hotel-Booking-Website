package com.demo;

import java.sql.Date;
import java.sql.Timestamp;

public class renting {


    private int room_num;
    private int hotel_id;
    private int id;
    private Timestamp check_out;
    private Timestamp check_in;

    public renting(int room_num, int hotel_id, int id, Timestamp check_in, Timestamp check_out){
        this.room_num= room_num;
        this.hotel_id = hotel_id;
        this.id = id;
        this.check_in = check_in;
        this.check_out = check_out;
    }

    //getters/setters
    public int getroomNum(){
        return this.room_num;
    }

    public int gethotelId(){
        return this.hotel_id;
    }

    public int getID(){
        return this.id;
    }



    public Timestamp getCheckIn(){
        return this.check_in;
    }

    public Timestamp getCheckOut(){
        return this.check_out;
    }

    public String toString (){
        return room_num+","+hotel_id+","+check_in;
    }
}
