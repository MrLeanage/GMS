/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.data.services;

import com.gsm.data.dbConnection.DBConnection;
import com.gsm.data.model.ChatMessage;
import com.gsm.data.model.ChatParticipant;
import com.gsm.data.model.Feedback;
import com.gsm.data.model.Grievance;
import com.gsm.data.model.User;
import com.gsm.data.query.FeedbackQuery;
import com.gsm.data.query.GrievanceQuery;
import com.gsm.data.query.UserQuery;
import com.gsm.logic.utility.UtilityMethod;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FeedbackService {
    private Connection connection;
    public FeedbackService(){
        connection = DBConnection.getDBConnection();
    }
    
    public ArrayList<Feedback> loadAllFeedbacks(){
        ArrayList<Feedback> feedbackList = new ArrayList<>();
        try{
            
            PreparedStatement preparedStatement = connection.prepareStatement(FeedbackQuery.LOAD_ALL_FEEDBACK_DATA);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                feedbackList.add( new Feedback(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6)));
            }
        }catch(SQLException exception){
            exception.printStackTrace();
        }
        return feedbackList;
    }
    
    public boolean giveFeedback(Feedback feedback){
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FeedbackQuery.GIVE_FEEDBACK);
            preparedStatement.setString(1, feedback.getfTitle());
            preparedStatement.setString(2, feedback.getfNote());
            preparedStatement.setInt(3, feedback.getIntegerFGID());
            preparedStatement.setString(4, feedback.getfDate());
            preparedStatement.setString(5, feedback.getfTime());
            preparedStatement.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
}
