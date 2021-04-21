/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.logic.controller;

import com.gsm.data.model.User;
import com.gsm.logic.utility.Authentication;

public class UserController {
    public User validateUserInfo(User user){
        return Authentication.authenticateUser(user);
    }
}
