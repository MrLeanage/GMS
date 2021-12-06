/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.logic.controller;

import com.gsm.data.model.ChatParticipant;
import com.gsm.data.model.Feedback;
import com.gsm.data.model.Grievance;
import com.gsm.data.model.User;
import com.gsm.data.services.FeedbackService;
import com.gsm.data.services.GrievanceService;
import com.gsm.data.services.UserService;
import java.util.ArrayList;

/**
 *
 * @author dulshan
 */
public class FeedbackController {

    public static boolean giveFeedback(Feedback feedback) {
        FeedbackService feedbackService = new FeedbackService();
        return feedbackService.giveFeedback(feedback);
    }

    public static ArrayList<Feedback> getManager3Feedbacks(String uID) {
        ArrayList<Feedback> sortedFeedbackList = new ArrayList<>();

        FeedbackService feedbackService = new FeedbackService();
        GrievanceService grievanceService = new GrievanceService();
        ArrayList<Feedback> feedbackList = feedbackService.loadAllFeedbacks();
        
        UserService userService = new UserService();
        User user = new User();
        user.setuEmpID(uID);
        
        if (userService.loadSpecificUser(user).getuType().equals("Manager - Level 3")) {
            
            ArrayList<Grievance> grievanceList = grievanceService.getManagerGrievanceList(uID);

            for (Grievance grievance : grievanceList) {
                for (Feedback feedback : feedbackList) {
                    if (grievance.getgID().equals(feedback.getfGID())) {
                        feedback.setfGrievance(grievance);
                        sortedFeedbackList.add(feedback);
                    }
                }
            }
        }else{
            for(Feedback feedback : feedbackList){
                feedback.setfGrievance(grievanceService.loadSpecificGrievance(feedback.getfGID()));
                sortedFeedbackList.add(feedback);
            }
        }

        return sortedFeedbackList;
    }
}
