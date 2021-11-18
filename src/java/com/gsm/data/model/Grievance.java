/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.data.model;

import com.gsm.logic.utility.UtilityMethod;
import java.time.LocalDate;

public class Grievance {
    private String gID = null;
    private String gUID = null;
    private String gTitle = null;
    private String gDescription = null;
    private String gStartDate = null;
    private String gStartTime = null;
    private String gEndDate = null;
    private String gEndTime = null;
    private String gStatus = null;
    private boolean gChat = false;
    private String gL3Manager = null;

    public Grievance() {
    }
    
    public Grievance(String gID, String gUID, String gTitle, String gDescription, String gStartDate, String gStartTime, String gEndDate, String gEndTime, String gStatus, String gChat, String gL3Manager) {
        this.gID = UtilityMethod.addPrefix("G", gID);
        this.gUID = gUID;
        this.gTitle = gTitle;
        this.gDescription = gDescription;
        this.gStartDate = gStartDate;
        this.gStartTime = gStartTime;
        this.gEndDate = gEndDate;
        this.gEndTime = gEndTime;
        this.gStatus = gStatus;
        if(gChat.equals("true"))
            this.gChat = true;
        this.gL3Manager = gL3Manager;
    }
    
    public String getgID() {
        return gID;
    }

    public void setgID(String gID) {
        this.gID = gID;
    }

    public String getgUID() {
        return gUID;
    }

    public void setgUID(String gUID) {
        this.gUID = gUID;
    }

    public String getgTitle() {
        return gTitle;
    }

    public void setgTitle(String gTitle) {
        this.gTitle = gTitle;
    }

    public String getgDescription() {
        return gDescription;
    }

    public void setgDescription(String gDescription) {
        this.gDescription = gDescription;
    }

    public String getgStartDate() {
        return gStartDate;
    }

    public void setgStartDate(String gStartDate) {
        this.gStartDate = gStartDate;
    }

    public String getgStartTime() {
        return gStartTime;
    }

    public void setgStartTime(String gStartTime) {
        this.gStartTime = gStartTime;
    }

    public String getgEndDate() {
        return gEndDate;
    }

    public void setgEndDate(String gEndDate) {
        this.gEndDate = gEndDate;
    }

    public String getgEndTime() {
        return gEndTime;
    }

    public void setgEndTime(String gEndTime) {
        this.gEndTime = gEndTime;
    }

    public String getgStatus() {
        return gStatus;
    }

    public void setgStatus(String gStatus) {
        this.gStatus = gStatus;
    }

    public boolean isgChat() {
        return gChat;
    }

    public void setgChat(String gChat) {
        if(gChat.equals("true"))
            this.gChat = true;
    }

    public String getgL3Manager() {
        return gL3Manager;
    }

    public void setgL3Manager(String gL3Manager) {
        this.gL3Manager = gL3Manager;
    }
    
    
    private String setDate(String date){
        if(date.equals(String.valueOf(LocalDate.now())))
            return "Today";
        else if(date.equals(String.valueOf(LocalDate.now().minusDays(1))))
            return "Yesterday";
        else
            return date;
    }
}
