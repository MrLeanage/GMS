/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.presentation.userManagement;

import com.gsm.data.model.User;
import com.gsm.data.model.UserValidation;
import com.gsm.logic.controller.UserController;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserAccountControllerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public HttpSession session;

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String action = request.getServletPath();
            log("called from" + action);
            switch (action) {
                //Admin Cases    
                case "/ResetAdmin":
                    loadResetAdmin(request, response);
                    break;
                case "/ResetAdminInfo":
                    resetAdmin(request, response);
                    break;
                case "/ManageAdmin":
                    loadManageAdmin(request, response);
                    break;
                case "/ManageAdminInfo":
                    manageAdminInfo(request, response);
                    break;
                case "/DeleteAdminInfo":
                    deleteAdminInfo(request, response);
                    break;
                //Manager Cases        
                case "/ResetManager":
                    loadResetManager(request, response);
                    break;
                case "/ResetManagerInfo":
                    resetManager(request, response);
                    break;
                case "/ManageManager":
                    loadManageManager(request, response);
                    break;
                case "/ManageManagerInfo":
                    manageManagerInfo(request, response);
                    break;
                case "/DeleteManagerInfo":
                    deleteManagerInfo(request, response);
                    break;
                //Employee Cases    
                case "/ResetEmployee":
                    loadResetEmployee(request, response);
                    break;
                case "/ResetEmployeeInfo":
                    resetEmployee(request, response);
                    break;
                case "/ManageEmployee":
                    loadManageEmployee(request, response);
                    break;
                case "/ManageEmployeeInfo":
                    manageEmployeeInfo(request, response);
                    break;
                case "/DeleteEmployeeInfo":
                    deleteEmployeeInfo(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/admin/userManagement/add-user-account.jsp");
                    break;
            }
        } catch (Exception ex) {
            log("Exception Occured" + ex);
        }
    }

    //Administrator Management
    private void loadManageAdmin(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        resetSession(request, response);
        loadAdminData(request, response);
    }

    private void loadAdminData(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        ArrayList<User> userList = new ArrayList();
        UserController userController = new UserController();
        userList = userController.loadAllAdminUsers();

        request.setAttribute("userList", userList);
        request.getRequestDispatcher("/admin/userManagement/manage_Admin_Account.jsp").forward(request, response);

    }

    private void manageAdminInfo(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        resetSession(request, response);
        User user = new User();
        user.setuEmpID(request.getParameter("eID"));

        user.setuFName(request.getParameter("fName"));
        user.setuLName(request.getParameter("lName"));
        user.setuType(request.getParameter("accType"));
        user.setuStatus(request.getParameter("accStatus"));

        String formAction = request.getParameter("formAction");
        log("Called from :" + formAction);
        UserController userController = new UserController();
        if (formAction.equals("ADD USER")) {
            user.setuPassword(request.getParameter("password"));

            if (userController.addUser(user)) {
                session.setAttribute("actionStatus", "success");
                session.setAttribute("actionMsg", "User Information Added Successfully!");
                loadAdminData(request, response);
            } else {
                session.setAttribute("actionStatus", "failed");
                session.setAttribute("actionMsg", "Failed to add User");
                loadAdminData(request, response);
            }
        } else {
            if (userController.updateUserData(user)) {
                session.setAttribute("actionStatus", "success");
                session.setAttribute("actionMsg", "User Information Updated Successfully!");
                loadAdminData(request, response);
            } else {
                session.setAttribute("actionStatus", "failed");
                session.setAttribute("actionMsg", "Failed to Update User Information");
                loadAdminData(request, response);
            }
        }

    }

    private void deleteAdminInfo(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        User user = new User();
        user.setuEmpID(request.getParameter("eID"));
        UserController userController = new UserController();
        if (userController.deleteUser(user)) {
            session.setAttribute("actionStatus", "success");
            session.setAttribute("actionMsg", "User Information Deleted Successfully!");
            loadAdminData(request, response);
        } else {
            session.setAttribute("actionStatus", "failed");
            session.setAttribute("actionMsg", "Failed to Delete User Information");
            loadAdminData(request, response);

        }
    }

    private void loadResetAdmin(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        resetSession(request, response);
        resetUserFieldData(request, response);
        request.getRequestDispatcher("/admin/userManagement/reset_Admin_Account.jsp").forward(request, response);

    }

    private void resetAdmin(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        resetSession(request, response);
        User user = new User();
        user.setuEmpID(request.getParameter("eID"));
        user.setuFName(request.getParameter("fName"));
        user.setuLName(request.getParameter("lName"));
        user.setuType(request.getParameter("accType"));
        user.setuStatus(request.getParameter("accStatus"));

        UserController userController = new UserController();
        User availableUser = userController.loadSpecificUser(user);
        UserValidation validationMsg = userController.verifyUser(user);

        if (validationMsg.getUserVStatus()) {
            if (availableUser.getuType().equals("Administrator") || availableUser.getuType().equals("Manager - Level 1")) {
                if (validationMsg.getUserVStatus()) {
                    user.setuPassword("Xyz123");
                    if (userController.updateUserPassword(user)) {
                        session.setAttribute("actionStatus", "success");
                        session.setAttribute("actionMsg", "User Password Resseted to 'Xyz123' Successfully!");
                        resetUserFieldData(request, response);
                        request.getRequestDispatcher("/admin/userManagement/reset_Admin_Account.jsp").forward(request, response);
                    } else {
                        session.setAttribute("actionStatus", "failed");
                        session.setAttribute("actionMsg", "Failed to Reset User Password!");
                        request.setAttribute("userData", user);
                        request.getRequestDispatcher("/admin/userManagement/reset_Admin_Account.jsp").forward(request, response);
                    }
                } else {
                    session.setAttribute("actionStatus", "failed");
                    session.setAttribute("actionMsg", "Failed to Reset User Password!");
                    request.setAttribute("userData", user);
                    request.setAttribute("validationMsg", validationMsg);
                    request.getRequestDispatcher("/admin/userManagement/reset_Admin_Account.jsp").forward(request, response);

                }
            }

        } else {
            session.setAttribute("actionStatus", "failed");
            session.setAttribute("actionMsg", "Failed to Reset User Password!");
            request.setAttribute("userData", user);
            validationMsg = new UserValidation();
            validationMsg.setuEmpIDVMsg("Invalid Account ID!");
            request.setAttribute("validationMsg", validationMsg);
            request.getRequestDispatcher("/admin/userManagement/reset_Admin_Account.jsp").forward(request, response);

        }
    }

    //Employee Management
    private void loadManageManager(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        resetSession(request, response);
        loadManagerData(request, response);
    }

    private void loadManagerData(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        ArrayList<User> userList = new ArrayList();
        UserController userController = new UserController();
        userList = userController.loadAllManagerUsers();

        request.setAttribute("userList", userList);
        request.getRequestDispatcher("/admin/userManagement/manage_Manager_Account.jsp").forward(request, response);

    }

    private void manageManagerInfo(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        resetSession(request, response);
        User user = new User();
        user.setuEmpID(request.getParameter("eID"));

        user.setuFName(request.getParameter("fName"));
        user.setuLName(request.getParameter("lName"));
        user.setuType(request.getParameter("accType"));
        user.setuStatus(request.getParameter("accStatus"));

        String formAction = request.getParameter("formAction");
        log("Called from :" + formAction);
        UserController userController = new UserController();
        if (formAction.equals("ADD USER")) {
            user.setuPassword(request.getParameter("password"));

            if (userController.addUser(user)) {
                session.setAttribute("actionStatus", "success");
                session.setAttribute("actionMsg", "User Information Added Successfully!");
                loadManagerData(request, response);
            } else {
                session.setAttribute("actionStatus", "failed");
                session.setAttribute("actionMsg", "Failed to add User");
                loadManagerData(request, response);
            }
        } else {
            if (userController.updateUserData(user)) {
                session.setAttribute("actionStatus", "success");
                session.setAttribute("actionMsg", "User Information Updated Successfully!");
                loadManagerData(request, response);
            } else {
                session.setAttribute("actionStatus", "failed");
                session.setAttribute("actionMsg", "Failed to Update User Information");
                loadManagerData(request, response);
            }
        }

    }

    private void deleteManagerInfo(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        User user = new User();
        user.setuEmpID(request.getParameter("eID"));
        UserController userController = new UserController();
        if (userController.deleteUser(user)) {
            session.setAttribute("actionStatus", "success");
            session.setAttribute("actionMsg", "User Information Deleted Successfully!");
            loadManagerData(request, response);
        } else {
            session.setAttribute("actionStatus", "failed");
            session.setAttribute("actionMsg", "Failed to Delete User Information");
            loadManagerData(request, response);

        }
    }

    private void loadResetManager(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        resetSession(request, response);
        resetUserFieldData(request, response);
        request.getRequestDispatcher("/admin/userManagement/reset_Manager_Account.jsp").forward(request, response);

    }

    private void resetManager(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        resetSession(request, response);
        User user = new User();
        user.setuEmpID(request.getParameter("eID"));
        user.setuFName(request.getParameter("fName"));
        user.setuLName(request.getParameter("lName"));
        user.setuType(request.getParameter("accType"));
        user.setuStatus(request.getParameter("accStatus"));

        UserController userController = new UserController();
        UserValidation validationMsg = userController.verifyUser(user);
        User availableUser = userController.loadSpecificUser(user);
        if (validationMsg.getUserVStatus()) {
            if (availableUser.getuType().equals("Manager - Level 2") || availableUser.getuType().equals("Manager - Level 3")) {
                if (validationMsg.getUserVStatus()) {
                    user.setuPassword("Pqr123");
                    if (userController.updateUserPassword(user)) {
                        session.setAttribute("actionStatus", "success");
                        session.setAttribute("actionMsg", "User Password Resseted to 'Pqr123' Successfully!");
                        resetUserFieldData(request, response);
                        request.getRequestDispatcher("/admin/userManagement/reset_Manager_Account.jsp").forward(request, response);
                    } else {
                        session.setAttribute("actionStatus", "failed");
                        session.setAttribute("actionMsg", "Failed to Reset User Password!");
                        request.setAttribute("userData", user);
                        request.getRequestDispatcher("/admin/userManagement/reset_Manager_Account.jsp").forward(request, response);
                    }
                } else {
                    session.setAttribute("actionStatus", "failed");
                    session.setAttribute("actionMsg", "Failed to Reset User Password!");
                    request.setAttribute("userData", user);
                    request.setAttribute("validationMsg", validationMsg);
                    request.getRequestDispatcher("/admin/userManagement/reset_Manager_Account.jsp").forward(request, response);

                }
            }

        } else {
            session.setAttribute("actionStatus", "failed");
            session.setAttribute("actionMsg", "Failed to Reset User Password!");
            request.setAttribute("userData", user);
            validationMsg = new UserValidation();
            validationMsg.setuEmpIDVMsg("Invalid Account ID!");
            request.setAttribute("validationMsg", validationMsg);
            request.getRequestDispatcher("/admin/userManagement/reset_Manager_Account.jsp").forward(request, response);

        }

    }

    //Employee management 
    private void loadManageEmployee(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        resetSession(request, response);
        loadEmployeeData(request, response);
    }

    private void loadEmployeeData(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        ArrayList<User> userList = new ArrayList();
        UserController userController = new UserController();
        userList = userController.loadAllEmployeeUsers();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("/admin/userManagement/manage_Employee_Account.jsp").forward(request, response);

    }

    private void manageEmployeeInfo(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        resetSession(request, response);
        User user = new User();
        user.setuEmpID(request.getParameter("eID"));

        user.setuFName(request.getParameter("fName"));
        user.setuLName(request.getParameter("lName"));
        user.setuType(request.getParameter("accType"));
        user.setuStatus(request.getParameter("accStatus"));

        String formAction = request.getParameter("formAction");
        log("Called from :" + formAction);
        UserController userController = new UserController();
        if (formAction.equals("ADD USER")) {
            user.setuPassword(request.getParameter("password"));

            if (userController.addUser(user)) {
                session.setAttribute("actionStatus", "success");
                session.setAttribute("actionMsg", "User Information Added Successfully!");
                loadEmployeeData(request, response);
            } else {
                session.setAttribute("actionStatus", "failed");
                session.setAttribute("actionMsg", "Failed to add User");
                loadEmployeeData(request, response);
            }
        } else {
            if (userController.updateUserData(user)) {
                session.setAttribute("actionStatus", "success");
                session.setAttribute("actionMsg", "User Information Updated Successfully!");
                loadEmployeeData(request, response);
            } else {
                session.setAttribute("actionStatus", "failed");
                session.setAttribute("actionMsg", "Failed to Update User Information");
                loadEmployeeData(request, response);
            }
        }

    }

    private void deleteEmployeeInfo(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        User user = new User();
        user.setuEmpID(request.getParameter("eID"));
        UserController userController = new UserController();
        if (userController.deleteUser(user)) {
            session.setAttribute("actionStatus", "success");
            session.setAttribute("actionMsg", "User Information Deleted Successfully!");
            loadEmployeeData(request, response);
        } else {
            session.setAttribute("actionStatus", "failed");
            session.setAttribute("actionMsg", "Failed to Delete User Information");
            loadEmployeeData(request, response);

        }
    }

    private void loadResetEmployee(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        resetSession(request, response);
        request.getRequestDispatcher("/admin/userManagement/reset_Employee_Account.jsp").forward(request, response);

    }

    private void resetEmployee(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        resetSession(request, response);
        User user = new User();
        user.setuEmpID(request.getParameter("eID"));
        user.setuFName(request.getParameter("fName"));
        user.setuLName(request.getParameter("lName"));
        user.setuType("Employee");
        user.setuStatus(request.getParameter("accStatus"));

        UserController userController = new UserController();
        UserValidation validationMsg = userController.verifyUser(user);
        User availableUser = userController.loadSpecificUser(user);

        if (validationMsg.getUserVStatus()) {
            if (availableUser.getuType().equals("Employee")) {
                if (validationMsg.getUserVStatus()) {
                    user.setuPassword("Abc123");
                    if (userController.updateUserPassword(user)) {
                        session.setAttribute("actionStatus", "success");
                        session.setAttribute("actionMsg", "User Password Resseted to 'Abc123' Successfully!");
                        request.getRequestDispatcher("/admin/userManagement/reset_Employee_Account.jsp").forward(request, response);
                    } else {
                        session.setAttribute("actionStatus", "failed");
                        session.setAttribute("actionMsg", "Failed to Reset User Password!1");
                        request.getRequestDispatcher("/admin/userManagement/reset_Employee_Account.jsp").forward(request, response);
                    }
                } else {
                    session.setAttribute("actionStatus", "failed");
                    session.setAttribute("actionMsg", "Failed to Reset User Password!2");
                    request.setAttribute("validationMsg", validationMsg);
                    request.getRequestDispatcher("/admin/userManagement/reset_Employee_Account.jsp").forward(request, response);

                }
            }

        } else {
            session.setAttribute("actionStatus", "failed");
            session.setAttribute("actionMsg", "Failed to Reset User Password!");
            validationMsg = new UserValidation();
            validationMsg.setuEmpIDVMsg("Invalid Account ID!");
            request.setAttribute("validationMsg", validationMsg);
            request.getRequestDispatcher("/admin/userManagement/reset_Employee_Account.jsp").forward(request, response);

        }

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
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void resetSession(HttpServletRequest request,
            HttpServletResponse response) {

        session = request.getSession();
        session.setAttribute("actionStatus", "default");
        session.setAttribute("actionMsg", "default");
        request.setAttribute("validationMsg", new UserValidation());

    }

    private void resetUserFieldData(HttpServletRequest request,
            HttpServletResponse response) {
        User userData = new User();
        userData.setuEmpID("");
        userData.setuFName("");
        userData.setuLName("");
        request.setAttribute("userData", userData);
    }
}
