package com.demo;

public class room {


    private int room_num;
    private int hotel_id;
    private String capacity;
    private String view_type;
    private Boolean can_extend;

    //constructor
    public room(int room_num, int hotel_id, String capacity, String view_type, Boolean can_extend){
        this.room_num= room_num;
        this.hotel_id = hotel_id;
        this.capacity = capacity;
        this.view_type= view_type;
        this.can_extend = can_extend;
    }

    //getters/setters
    public int getroomNum(){
        return this.room_num;
    }

    public int gethotelID(){
        return this.hotel_id;
    }

    public void setroomNum(int room_num){
        this.room_num=room_num;
    }

    public void sethotelID(int hotel_id){
        this.hotel_id=hotel_id;
    }

    //tostring
    @Override
    public String toString(){
        return Integer.toString(room_num);
    }
}
