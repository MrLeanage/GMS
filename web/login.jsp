<%-- 
    Document   : login
    Created on : Apr 16, 2021, 5:07:23 PM
    Author     : chamathka
--%>
<%@page import="com.gsm.data.model.User"%>
<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">


    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <title> Grievance Management System - Login</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/bootstrap/css/bootstrap.min.css" />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/gms.css" />

    </head>
    <body class="font-muli theme-cyan gradient">
        <div class="auth option2">
            <div class="auth_left">
                <div class="card">
                    <div class="card-body">
                        <div class="text-center">
                            <img src="${pageContext.request.contextPath}/assets/images/logo/logo100x100.png" class="logo img-responsive center-block" />
                            <div class="card-title mt-3">Login to your account</div>
                        </div>
                        <form action="<%=request.getContextPath()%>/Login-Validate" method="POST">
                            <%
                                User user = (User) session.getAttribute("authUser");%>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Employee ID</label>
                                <input class="form-control" name="uEmpID" aria-describedby="emailHelp" placeholder="Enter Employee ID" value="<%=user.getuEmpID()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" name="uPassword" placeholder="Enter User Password" value="<%=user.getuPassword()%>" required>
                            </div>
                            <div class="form-group">
                                <p class="validation-label danger">
                                    <%=user.getuStatus()%>
                                </p>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/assets/bundles/lib.vendor.bundle.js" type="543548f55cd2d2fff7210659-text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/core.js" type="543548f55cd2d2fff7210659-text/javascript"></script>
        <script src="../../../../ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js" data-cf-settings="543548f55cd2d2fff7210659-|49" defer=""></script>

    </body>

</html>
