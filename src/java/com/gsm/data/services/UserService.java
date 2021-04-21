/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.data.services;

import com.gsm.data.dbConnection.DBConnection;
import com.gsm.data.model.User;
import com.gsm.data.query.UserQuery;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {
    public User loadSpecificUser(User user){
        User resultUser = null;
        Connection connection = DBConnection.getDBConnection();
        
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(UserQuery.load_Specific_User_Data);
            preparedStatement.setString(1, user.getuEmpID());
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                user = new User(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6));
            }
        }catch(SQLException exception){
            exception.printStackTrace();
        }
        return user;
    }
}
