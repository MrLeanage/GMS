/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.data.query;

/**
 *
 * @author dulshan
 */
public class GuidelineQuery {
    public static final String LOAD_ALL_GUIDELINE_DATA = "SELECT * FROM guideline";
    public static final String LOAD_SPECIFIC_GUIDELINE_DATA = "SELECT * FROM guideline where gLVersionID = ?";
    public static final String INSERT_GUIDELINE_DATA = "INSERT INTO guideline (gLTitle, gLDescription, gLFile, gLUploadDate, gLModifyDate) VALUES (?, ?, ?, ?, ?)";
}
