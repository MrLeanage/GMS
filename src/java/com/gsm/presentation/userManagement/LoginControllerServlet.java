/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.presentation.userManagement;

import com.gsm.data.model.User;
import com.gsm.logic.controller.UserController;
import com.gsm.logic.utility.Authentication;
import java.io.IOException;
import java.io.PrintWriter; 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginControllerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String action = request.getServletPath();
            log("called from" + action);
            switch (action) {
                case "/Login":
                    loadLogin(request, response);
                    break;
                case "/Login-Validate":
                    userValidate(request, response);
                    break;
                case "/Employee-Dashboard":
                    employeeDashboard(request, response);
                    break;
                case "/Dashboard":
                    adminDashboard(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/Admin/login.jsp");
                    break;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            log("Exception Occured" + ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void loadLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = new User();
        user.setuEmpID("");
        user.setuPassword("");
        user.setuStatus("");
        request.getSession().removeAttribute("authUser");
        request.getSession().setAttribute("authUser",user);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    private void userValidate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        UserController userController = new UserController();
        User user = new User();
        user.setuEmpID(request.getParameter("uEmpID"));
        user.setuPassword(request.getParameter("uPassword"));
        
        
        User validatedUser = userController.authenticateUserInfo(user);
        log("Exception Occured : "+user.getuEmpID()+"\n");
        log("User Status : "+validatedUser.getuStatus()+"\n");
        if (validatedUser.getuStatus().equals("Active")) {
            request.getSession().setAttribute("authUser", validatedUser);
            if (!validatedUser.getuType().equals("Employee")) {
                response.sendRedirect(request.getContextPath() + "/Dashboard");
                
            } else {
                response.sendRedirect(request.getContextPath() + "/Employee-Dashboard");
            }
        } else {
            validatedUser.setuEmpID(user.getuEmpID());
            validatedUser.setuPassword(user.getuPassword());
            request.getSession().setAttribute("authUser", validatedUser);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    private void adminDashboard(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
    }

    private void employeeDashboard(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/client/index.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
