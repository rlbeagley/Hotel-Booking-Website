package com.demo;

public class hotel {

    private int hotel_id;
    private String chain_name;
    private int rating;
    private String address;
    private String city;
    private String email;
    private String phone_num;

    // Constructor
    public hotel(int hotel_id, String chain_name, int rating, String address, String city, String email, String phone_num) {
        this.hotel_id = hotel_id;
        this.chain_name = chain_name;
        this.rating = rating;
        this.address = address;
        this.city = city;
        this.email = email;
        this.phone_num = phone_num;
    }

    // getters
    public int getHotelID() {
        return this.hotel_id;
    }

    public String getChainName() {
        return this.chain_name;
    }

    public int getRating() {
        return this.rating;
    }

    public String getAddress() {
        return this.address;
    }

    public String getCity() {
        return this.city;
    }

    public String getEmail() {
        return this.email;
    }

    public String getPhoneNum() {
        return this.phone_num;
    }

    // setters
    public void setHotelID(int hotel_id) {
        this.hotel_id = hotel_id;
    }

    public void setChainName(String chain_name) {
        this.chain_name = chain_name;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhoneNum(String phone_num) {
        this.phone_num = phone_num;
    }
}