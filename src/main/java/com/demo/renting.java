package com.demo;

import java.sql.Date;

public class renting {


    private int room_num;
    private int hotel_id;
    private int id;
    private Date check_out;
    private Date check_in;

    public renting(int room_num, int hotel_id, int id, Date check_in, Date check_out){
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

    public int gethotelID(){
        return this.hotel_id;
    }

    public int getID(){
        return this.id;
    }

    public Date getcheckIn(){
        return this.check_in;
    }

    public Date getcheckOut(){
        return this.check_out;
    }
}
