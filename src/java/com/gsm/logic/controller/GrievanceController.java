/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.logic.controller;

import com.gsm.data.model.ChatMessage;
import com.gsm.data.model.ChatParticipant;
import com.gsm.data.model.Grievance;
import com.gsm.data.model.User;
import com.gsm.data.services.GrievanceService;
import com.gsm.logic.utility.ManagerAllocator;
import java.util.ArrayList;

/**
 *
 * @author dulshan
 */
public class GrievanceController {

    public static boolean postNewGrievance(Grievance grievance) {
        GrievanceService grievanceService = new GrievanceService();
        grievance.setgL3Manager(ManagerAllocator.getFreeGrievanceManager());
        return grievanceService.postNewGrievance(grievance);
    }

    public static ArrayList<Grievance> getEmployeeGrievanceList(String userID) {
        GrievanceService grievanceService = new GrievanceService();
        return grievanceService.getEmployeeGrievanceList(userID);
    }

    public static ArrayList<Grievance> getManagerL3GrievanceList(String userID) {
        GrievanceService grievanceService = new GrievanceService();
        ArrayList<Grievance> sortedData = new ArrayList();
        for (Grievance grievance : grievanceService.getManagerGrievanceList(userID)) {
            if (grievance.getgStatus().equals("Pending")) {
                sortedData.add(grievance);
            }
        }
        return sortedData;
    }

    public static ArrayList<Grievance> getProcessingManagerGrievanceList(
            String userID, String type) {
        GrievanceService grievanceService = new GrievanceService();
         ArrayList<Grievance> grievanceList = new ArrayList();
        
        for(ChatParticipant ChatParticipantData :grievanceService.getGrievanceChatParticipantsByLoggedUser(userID)){
            grievanceList.add(grievanceService.loadSpecificGrievance(ChatParticipantData.getcPGID()));
        }
        ArrayList<Grievance> sortedData = new ArrayList();
        for(Grievance grievance :grievanceList){
            if(grievance.getgStatus().equals(type)){
                sortedData.add(grievance);
            }
            if(type.equals("All")){
                 sortedData.add(grievance);
            }
        }

        return sortedData;
    }

    public static Grievance getSpecificGrievance(String userID) {
        GrievanceService grievanceService = new GrievanceService();
        return grievanceService.loadSpecificGrievance(userID);
    }

    public static boolean acceptManagerL3Grievance(String gID) {
        GrievanceService grievanceService = new GrievanceService();
        return grievanceService.acceptManagerL3Grievance(gID);
    }

    public static boolean registerGrievanceUserChat(String gID) {
        GrievanceService grievanceService = new GrievanceService();
        Grievance grievance = grievanceService.loadSpecificGrievance(gID);

        if (grievance.getgID() != null) {
            return grievanceService.registerGrievance(grievance.getgID(), grievance.getgUID())
                    && grievanceService.registerGrievance(grievance.getgID(), grievance.getgL3Manager());
        } else {
            return false;
        }

    }

    public static ArrayList<ChatMessage> loadGroupChatMessages(String gID) {
        GrievanceService grievanceService = new GrievanceService();
        return grievanceService.getChatMessages(gID);
    }

    public static boolean addGrievanceUserToChat(String gID,
            String uID) {
        GrievanceService grievanceService = new GrievanceService();
        return grievanceService.registerGrievance(gID, uID);

    }

    public static ArrayList<User> loadGroupChatParticipants(String gID) {
        GrievanceService grievanceService = new GrievanceService();
        return grievanceService.getGrievanceChatParticipants(gID);
    }

    public static boolean assignChatMember(String grievanceID,
            String type) {
        GrievanceService grievanceService = new GrievanceService();
        return grievanceService.registerGrievance(grievanceID, ManagerAllocator.getFreeHighLevelManager(grievanceID, type));
    }
    
    public static boolean updateGrievanceStatus(String grievanceID, String grievanceStatus) {
        GrievanceService grievanceService = new GrievanceService();
        return grievanceService.updateGrievanceStatus(grievanceID, grievanceStatus);
    }
}
