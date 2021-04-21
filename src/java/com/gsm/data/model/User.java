/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.data.model;

public class User {
    private String uEmpID = null;
    private String uFName = null;
    private String uLName = null;
    private String uType = null;
    private String uPassword = null;
    private String uStatus = null;

    public User() {
    }

    public User(String uEmpID, String uFName, String uLName, String uType, String uPassword, String uStatus){
        this.uEmpID = uEmpID;
        this.uFName = uFName;
        this.uLName = uLName;
        this.uType = uType;
        this.uPassword = uPassword;
        this.uStatus = uStatus;
    }
    
    public String getuEmpID() {
        return uEmpID;
    }

    public void setuEmpID(String uEmpID) {
        this.uEmpID = uEmpID;
    }

    public String getuFName() {
        return uFName;
    }

    public void setuFName(String uFName) {
        this.uFName = uFName;
    }

    public String getuLName() {
        return uLName;
    }

    public void setuLName(String uLName) {
        this.uLName = uLName;
    }

    public String getuType() {
        return uType;
    }

    public void setuType(String uType) {
        this.uType = uType;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    public String getuStatus() {
        return uStatus;
    }

    public void setuStatus(String uStatus) {
        this.uStatus = uStatus;
    }
    
    
}
