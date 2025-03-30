package com.demo;

public class hotelChain {
    private String chainName;
    private String phoneNumber;
    private String email;
    private String address;

    // Constructor
    public hotelChain(String chainName, String phoneNumber, String email, String address) {
        this.chainName = chainName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
    }

    // getters
    public String getChainName() {
        return chainName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }

    // setters
    public void setChainName(String chainName) {
        this.chainName = chainName;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
