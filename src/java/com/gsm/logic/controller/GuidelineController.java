/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.logic.controller;

import com.gsm.data.model.Grievance;
import com.gsm.data.model.Guideline;
import com.gsm.data.services.GrievanceService;
import com.gsm.data.services.GuidelineService;
import java.util.ArrayList;

public class GuidelineController {
    
    public static boolean addNewGuideline(Guideline guideline){
        GuidelineService guidelineService = new GuidelineService();
        return guidelineService.addNewGuideline(guideline);
    }
    
    public static ArrayList<Guideline> getAllGuidelines() {
         GuidelineService guidelineService = new GuidelineService();
        return guidelineService.loadGuidelineList();
    }
    
    public static Guideline getSpecificGuideline(int gLVersionID) {
         GuidelineService guidelineService = new GuidelineService();
        return guidelineService.loadSpecificGuideline(gLVersionID);
    }
    
}
