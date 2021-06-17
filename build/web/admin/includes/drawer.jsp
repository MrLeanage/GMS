<%-- 
    Document   : drawer
    Created on : Jun 3, 2021, 4:02:11 PM
--%>

<div class="mdk-drawer js-mdk-drawer"
     id="default-drawer">
    <div class="mdk-drawer__content">
        <div class="sidebar sidebar-dark sidebar-left"
             data-perfect-scrollbar>

            <!-- Navbar toggler -->


            <a href="<%=request.getContextPath()%>/Dashboard"
               class="sidebar-brand ">
                <img class="sidebar-brand-icon"
                     src="${pageContext.request.contextPath}/assets/images/logo/Logo-Without-Text.png"
                     alt="MACRO">
                <span>M A C R O</span>
            </a>


            <div class="sidebar-heading">Overview</div>
            <ul class="sidebar-menu">
                <li class="sidebar-menu-item active">
                    <a class="sidebar-menu-button"
                       href="<%=request.getContextPath()%>/Dashboard">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left">insert_chart_outlined</span>
                        <span class="sidebar-menu-text">Dashboard</span>
                    </a>
                </li>   
            </ul>

            <div class="sidebar-heading">Applications</div>
            <ul class="sidebar-menu">
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                       data-toggle="collapse"
                       href="#messaging_menu">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left">message</span>
                        Grievances
                        <span class="sidebar-menu-badge badge badge-accent badge-notifications ml-auto">2</span>
                        <span class="sidebar-menu-toggle-icon"></span>
                    </a>
                    <ul class="sidebar-submenu collapse sm-indent"
                        id="messaging_menu">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="messages.html">
                                <span class="sidebar-menu-text">New Grievance</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="email.html">
                                <span class="sidebar-menu-text">Processing Grievances</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="email.html">
                                <span class="sidebar-menu-text">Finished Grievances</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                       data-toggle="collapse"
                       href="#cms_menu">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left">content_copy</span>
                        HR Management
                        <span class="ml-auto sidebar-menu-toggle-icon"></span>
                    </a>
                    <ul class="sidebar-submenu collapse sm-indent"
                        id="cms_menu">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="cms-dashboard.html">
                                <span class="sidebar-menu-text">New Enrolls</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="posts.html">
                                <span class="sidebar-menu-text">News Updates</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                       data-toggle="collapse"
                       href="#account_menu">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left">account_box</span>
                        Accounts
                        <span class="ml-auto sidebar-menu-toggle-icon"></span>
                    </a>
                    <ul class="sidebar-submenu collapse sm-indent"
                        id="account_menu">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="<%=request.getContextPath()%>/ManageEmployee">
                                <span class="sidebar-menu-text">Employee Accounts</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="<%=request.getContextPath()%>/ResetEmployee">
                                <span class="sidebar-menu-text">Reset Employee Password</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="<%=request.getContextPath()%>/ManageManager">
                                <span class="sidebar-menu-text">Manager Accounts</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="<%=request.getContextPath()%>/ResetManager">
                                <span class="sidebar-menu-text">Reset Manager Password</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="<%=request.getContextPath()%>/ManageAdmin">
                                <span class="sidebar-menu-text">Admin Accounts</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="<%=request.getContextPath()%>/ResetAdmin">
                                <span class="sidebar-menu-text">Reset Admin Password</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                       data-toggle="collapse"
                       href="#components_menu">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left">tune</span>
                        Grievance Guidelines
                        <span class="ml-auto sidebar-menu-toggle-icon"></span>
                    </a>
                    <ul class="sidebar-submenu collapse sm-indent"
                        id="components_menu">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="ui-buttons.html">
                                <span class="sidebar-menu-text">Current Guideline Version</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="ui-avatars.html">
                                <span class="sidebar-menu-text">All Guideline Versions</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="ui-forms.html">
                                <span class="sidebar-menu-text">ADD Guideline</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="ui-loaders.html">
                                <span class="sidebar-menu-text">Modify Guideline</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button"
                       data-toggle="collapse"
                       href="#community_menu">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left">people_outline</span>
                        Feedbacks
                        <span class="ml-auto sidebar-menu-toggle-icon"></span>
                    </a>
                    <ul class="sidebar-submenu collapse sm-indent"
                        id="community_menu">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="faq.html">
                                <span class="sidebar-menu-text">View Feedbacks</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a class="sidebar-menu-button js-sidebar-collapse"
                       data-toggle="collapse"
                       href="#enterprise_menu">
                        <span class="material-icons sidebar-menu-icon sidebar-menu-icon--left">donut_large</span>
                        Statistics
                        <span class="ml-auto sidebar-menu-toggle-icon"></span>
                    </a>
                    <ul class="sidebar-submenu collapse sm-indent"
                        id="enterprise_menu">
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="erp-dashboard.html">
                                <span class="sidebar-menu-text">View Statistics</span>
                            </a>
                        </li>
                        <li class="sidebar-menu-item">
                            <a class="sidebar-menu-button"
                               href="crm-dashboard.html">
                                <span class="sidebar-menu-text">Generate Report</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
