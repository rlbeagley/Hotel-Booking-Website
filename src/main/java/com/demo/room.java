package com.demo;

public class room {


    private int room_num;
    private int hotel_id;
    private String capacity;
    private String view_type;
    private Boolean can_extend;
    private int rating;
    private String city;
    private String hotel_name;
    private String address;
    private double price;


    //constructor
    public room(int room_num, int hotel_id, String capacity, String view_type, Boolean can_extend, String city, int rating, String hotel_name, String address, double price){
        this.room_num= room_num;
        this.hotel_id = hotel_id;
        this.capacity = capacity;
        this.view_type= view_type;
        this.can_extend = can_extend;
        this.city = city;
        this.rating = rating;
        this.hotel_name = hotel_name;
        this.address = address;
        this.price= price;
    }

    //getters/setters
    public String getAddress() {
        return this.address;
    }

    public double getPrice() {
        return this.price;
    }

    public int getRoomNum() {
        return this.room_num;
    }

    public int getHotelId() {
        return this.hotel_id;
    }

    public String getCapacity() {
        return this.capacity;
    }

    public String getViewType() {
        return this.view_type;
    }

    public Boolean getCanExtend() {
        return this.can_extend;
    }

    public String getCity() {
        return this.city;
    }

    public int getRating() {
        return this.rating;
    }

    public String getHotelName() {
        return this.hotel_name;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    public void setRoomNum(int room_num) {
        this.room_num = room_num;
    }

    public void setHotelId(int hotel_id) {
        this.hotel_id = hotel_id;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public void setViewType(String view_type) {
        this.view_type = view_type;
    }

    public void setCanExtend(Boolean can_extend) {
        this.can_extend = can_extend;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setHotelName(String hotel_name) {
        this.hotel_name = hotel_name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    //tostring
    @Override
    public String toString(){
        return Integer.toString(room_num);
    }

}
