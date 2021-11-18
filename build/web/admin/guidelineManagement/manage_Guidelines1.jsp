<%-- 
    Document   : index
    Created on : Apr 16, 2021, 9:31:27 PM
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.gsm.data.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"
      dir="ltr">


    <head>
        <title>Grievance Guidelines</title>
        <%@include file="../includes/head.jsp"%>

    </head>

    <body class="layout-app layout-sticky-subnav ">
        <div class="mdk-drawer-layout js-mdk-drawer-layout"
             data-push
             data-responsive-width="992px">
            <!-- // START drawer-layout_content-->
            <div class="mdk-drawer-layout__content page-content">

                <!-- Header -->
                <%@include file="../includes/header.jsp"%>
                <!-- // END Header -->
                <div class="border-bottom-2 py-32pt position-relative z-1">
                    <div class="container-fluid page__container d-flex flex-column flex-md-row align-items-center text-center text-sm-left">
                        <div class="flex d-flex flex-column flex-sm-row align-items-center mb-24pt mb-md-0">

                            <div class="mb-24pt mb-sm-0 mr-sm-24pt">
                                <h2 class="mb-0">GRIEVANCE GUIDELINES</h2>

                                <ol class="breadcrumb p-0 m-0">
                                    <li class="breadcrumb-item">Grievance Guideline Management</li>

                                </ol>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container-fluid page__container">
                    <div class="page-section">




                        <div class="container p-1">
                            <p>Add Guideline Detail description here</p>
                        </div>

                        <div class="row mb-32pt">

                            <div class="col-lg-12 d-flex align-items-center">
                                <div class="flex"
                                     style="max-width: 100%">
                                    <input class="form-control" id="myInput" type="text" placeholder="Search..">
                                    <br>

                                    <div class="table-wrapper-scroll-y my-custom-scrollbar">
                                        <table class="table table-bordered table-striped mb-0 data-table sortable" id="usersTable">
                                            <thead class="thead-dark">
                                            <th>VERSION</th>
                                            <th>TITLE</th>
                                            <th>DESCRIPTION</th>
                                            <th>UPLOADED DATE</th>
                                            <th>LAST MODIFY DATE</th>
                                            <th>ACTION</th>

                                            </thead>

                                            <tbody  id="myTable">
                                                <tr>
                                                    <td>"Data"</td>
                                                    <td>"Data"</td>
                                                    <td>"Data"</td>
                                                    <td>"Data"</td>
                                                    <td>"Data"</td>
                                                    <td><button class="btn btn-danger" data-href="<%=request.getContextPath()%>/DeleteAdminInfo?eID=12" data-toggle="modal" data-target="#confirm-delete">DELETE</button></td>

                                                </tr>
                                                
                                            </tbody>
                                        </table>
                                    </div>


                                </div>
                            </div>
                        </div>              
                        <div class="row mb-32pt">

                            <div class="col-lg-12 d-flex align-items-center">
                                <div class="flex"
                                     style="max-width: 100%">
                                    <form action="<%=request.getContextPath()%>/ManageAdminInfo" method="POST">
                                        <div class="was-validated">
                                            <div class="form-row">
                                                <div class="col-12 col-md-6 mb-3">
                                                    <% String actionStatus = request.getSession().getAttribute("actionStatus").toString();%>
                                                    <input type="hidden" id="actionStatus" value="<%= actionStatus%>" />
                                                    <label class="form-label"
                                                           >Guideline Title</label>
                                                    <input type="text"
                                                           class="form-control"
                                                           placeholder="Guideline Title"
                                                           required
                                                           name="title"
                                                           id="title"
                                                           value="">

                                                    <div class="invalid-feedback">Please provide Guideline Title.</div>
                                                    <div class="valid-feedback">Looks good!</div>
                                                </div>
                                                <div class="col-12 col-md-6 mb-3">
                                                    <label class="form-label"
                                                           >Last name</label>
                                                    <input type="text"
                                                           class="form-control"
                                                           placeholder="Last Name"
                                                           required=""
                                                           name="lName"
                                                           id="lName"
                                                           value="">
                                                    <div class="invalid-feedback">Please provide a Last Name.</div>
                                                    <div class="valid-feedback">Looks good!</div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-12 col-md-6 mb-3">
                                                    <label class="form-label"
                                                           >Employee/User ID</label>
                                                    <input type="text"
                                                           class="form-control"
                                                           placeholder="Administrator ID"
                                                           required=""
                                                           name="eID"
                                                           id="eID"
                                                           value="">
                                                    <div class="invalid-feedback">Please provide Administrator ID</div>
                                                    <div class="valid-feedback">Looks good!</div>
                                                </div>
                                                <div class="col-12 col-md-6 mb-3" id="passwordDiv">
                                                    <label class="form-label"
                                                           for="password"
                                                           >Account Password</label>
                                                    <input type="password"
                                                           class="form-control"
                                                           placeholder="Account Password"
                                                           required=""
                                                           name="password"
                                                           id="password"
                                                           value="">
                                                    <div class="invalid-feedback">Please provide Password</div>
                                                    <div class="valid-feedback">Looks good!</div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-12 col-md-6 mb-3">
                                                    <label class="form-label"
                                                           >ACCOUNT TYPE</label>
                                                    <select class="form-control" name="accType" id="accType">
                                                        <option>Manager - Level 1</option>
                                                        <option>Administrator</option>
                                                    </select>
                                                </div>
                                                <div class="col-12 col-md-6 mb-3">
                                                    <label class="form-label"
                                                           >ACCOUNT STATUS</label>
                                                    <select class="form-control" name="accStatus" id="accStatus">
                                                        <option>Active</option>
                                                        <option>Disabled</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="btn btn-primary"
                                                type="submit" id ="add" name="formAction" value="ADD GUIDELINE">ADD GUIDELINE</button>        
                                        <button class="btn btn-success"
                                                type="submit" id ="update" name="formAction" value="UPDATE GUIDELINE">UPDATE GUIDELINE</button>
                                        <button class="btn btn-dark"
                                                type="reset" id="clearButton">CLEAR FIELDS</button>
                                    </form>
                                </div>
                            </div>
                        </div>                                       

                    </div>
                </div>


                <!-- footer -->
                <%@include  file="../includes/footer.jsp" %>
                <!-- // END footer -->

            </div>

            <!-- // END drawer-layout__content -->

            <!-- drawer -->
            <%@include  file="../includes/drawer.jsp" %>
            <!-- // END drawer -->
        </div>
        <!-- // END drawer-layout -->


        <script>
            var table = document.getElementById("usersTable"), rIndex;

            for (var i = 0; i < table.rows.length; i++) {
                table.rows[i].onclick = function ()
                {
                    rIndex = this.rowIndex;
                    document.getElementById("eID").value = this.cells[0].innerHTML;
                    document.getElementById("fName").value = this.cells[1].innerHTML;
                    document.getElementById("lName").value = this.cells[2].innerHTML;
                    document.getElementById("password").value = "value";
                    document.getElementById("accType").value = this.cells[3].innerHTML;
                    document.getElementById("accStatus").value = this.cells[4].innerHTML;

                    $("#passwordDiv").hide();
                    $("#add").hide();
                    $("#update").show();
                    
                }
            }

        </script>
        <%@include file="../content/popupModel.jsp" %>
        <%@include file="../includes/script.jsp" %>

    </body>
</html>