/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.data.query;

public class UserQuery {
    public static final String load_All_User_Data = "SELECT * FROM user";
    public static final String load_Specific_User_Data = "SELECT * FROM user WHERE uEmpID = ?";
    
}
