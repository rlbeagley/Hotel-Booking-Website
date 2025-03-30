package com.demo;
import java.sql.Date;
public class customer {

    private int id;
    private String name;
    private String address;
    private Date registration;

    // Constructor
    public customer(int id, String name, String address, Date registration) {
        this.id = id;
        this.name = name;
        this.registration = registration;
        this.address = address;

    }

    // getters
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public Date getRegistration() {
        return registration;
    }

    // setters
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setRegistration(Date registration) {
        this.registration = registration;
    }

}