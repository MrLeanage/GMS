<%-- 
    Document   : index-content
    Created on : Jun 3, 2021, 4:06:11 PM
--%>


<%@page import="com.gsm.data.model.Guideline"%>
<%@page import="java.util.ArrayList"%>
<div class="border-bottom-2 py-32pt position-relative z-1">
    <div class="container-fluid page__container d-flex flex-column flex-md-row align-items-center text-center text-sm-left">
        <div class="flex d-flex flex-column flex-sm-row align-items-center mb-24pt mb-md-0">

            <div class="mb-24pt mb-sm-0 mr-sm-24pt">
                <h2 class="mb-0">MACRO GRIEVANCE MANAGEMENT SYSTEM</h2>

                <ol class="breadcrumb p-0 m-0">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>

                    <li class="breadcrumb-item active">

                        Dashboard

                    </li>

                </ol>

            </div>



        </div>

        <div class="row"
             role="tablist">

            <div class="col-auto border-left">
                <a href="<%=request.getContextPath()%>/PendingGrievance"
                   class="btn btn-primary">ACCEPT GRIEVANCES</a>
            </div>
        </div>

    </div>
</div>

<div class="container-fluid page__container">
    <div class="page-section">

        <div class="alert alert-soft-warning mb-lg-32pt">
            <div class="d-flex flex-wrap align-items-start">
                <div class="mr-8pt">
                    <i class="material-icons">access_time</i>
                </div>
                <div class="flex"
                     style="min-width: 180px">
                    <small class="text-100">
                        <strong>Analytics Service Issues.</strong><br>
                        <span>You may experience some issues with the Analytics API. Stay up to date by following our status page.</span>
                    </small>
                </div>
            </div>
        </div>

        <div class="page-separator">
            <div class="page-separator__text">Overview</div>
        </div>

        <div class="row card-group-row mb-lg-8pt">
            <div class="col-xl-6 col-md-6 card-group-row__col">
                <div class="card card-group-row__card">
                    <div class="card-body d-flex flex-column align-items-center">
                        <h4>TOTAL PENDING GRIEVANCES</h4>
                        <div class="d-flex align-items-center">
                            <div class="h2 mb-0 mr-3">3.6k</div>
                            <div class="flex">

                                <div class="col-auto border-left">
                                    <a href="<%=request.getContextPath()%>/PendingGrievance"
                                       class="btn btn-primary">CHECK NOW</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-6 col-md-6 card-group-row__col">
                <div class="card card-group-row__card">
                    <div class="card-body d-flex flex-column align-items-center">
                        <h4>TOTAL ONGOING GRIEVANCES</h4>
                        <div class="d-flex align-items-center">
                            <div class="h2 mb-0 mr-3">3.6k</div>
                            <div class="flex">
                                <div class="col-auto border-left">
                                    <a href="<%=request.getContextPath()%>/ProcessingGrievance"
                                       class="btn btn-success">CHECK NOW</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-12 col-md-6 card-group-row__col">
                <div class="card card-group-row__card">
                    <div class="card-body d-flex flex-column align-items-center">
                        <h4>You have handled 0 Grievances for this month</h4>
                        <div class="d-flex align-items-center">
                            
                            <div class="flex">
                                <div class="col-auto border-left">
                                    <a href="<%=request.getContextPath()%>/ProcessingGrievance"
                                       class="btn btn-success">CHECK NOW FINISHED GRIEVANCE TICKETS</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 card-group-row__col">
                <div class="card card-group-row__card">
                    <div class="card-body d-flex flex-column align-items-center">
                        <i class="material-icons icon-32pt text-20 mb-4pt">attach_money</i>
                        <div class="d-flex align-items-center">
                            <div class="h2 mb-0 mr-3">$12.3k</div>
                            <div class="flex">
                                <p class="mb-0"><strong>Sales</strong></p>
                                <p class="text-50 mb-0 mt-n1 d-flex align-items-center">
                                    51.5%
                                    <i class="material-icons text-accent ml-4pt icon-16pt">keyboard_arrow_up</i>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 card-group-row__col">
                <div class="card card-group-row__card card-body"
                     style="position: relative; padding-bottom: calc(80px - 1.25rem); overflow: hidden; z-index: 0;">

                    <div class="d-flex align-items-center">
                        <div class="h2 mb-0 mr-3">$8.3k</div>
                        <div class="flex">
                            <p class="mb-0"><strong>Products</strong></p>
                            <p class="text-50 mb-0 mt-n1 d-flex align-items-center">
                                31.5%
                                <i class="material-icons text-accent ml-4pt icon-16pt">keyboard_arrow_up</i>
                            </p>
                        </div>
                    </div>

                    <div class="chart"
                         style="height: 80px; position: absolute; left: 0; right: 0; bottom: 0;">
                        <canvas class="chart-canvas js-update-chart-line"
                                id="productsChart"
                                data-chart-hide-axes="true"
                                data-chart-line-border-color="primary"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 card-group-row__col">
                <div class="card card-group-row__card card-body"
                     style="position: relative; padding-bottom: calc(80px - 1.25rem); overflow: hidden; z-index: 0;">

                    <div class="d-flex align-items-center">
                        <div class="h2 mb-0 mr-3">$15.0k</div>
                        <div class="flex">
                            <p class="mb-0"><strong>Courses</strong></p>
                            <p class="text-50 mb-0 mt-n1 d-flex align-items-center">
                                31.5%
                                <i class="material-icons text-accent ml-4pt icon-16pt">keyboard_arrow_down</i>
                            </p>
                        </div>
                    </div>

                    <div class="chart"
                         style="height: 80px; position: absolute; left: 0; right: 0; bottom: 0;">
                        <canvas class="chart-canvas js-update-chart-line-accent"
                                id="coursesChart"
                                data-chart-hide-axes="true"
                                data-chart-line-border-color="teal"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mb-lg-8pt">
            <div class="col-lg-6">

                <div class="card">
                    <div class="card-header card-header-tabs-basic nav justify-content-center"
                         role="tablist">
                        <div data-toggle="chart"
                             data-target="#locationDoughnutChart"
                             data-update='{"data":{
                             "labels": ["United States", "United Kingdom", "Germany"], 
                             "datasets": [{"label": "Traffic", "data":[25,25,15]}]
                             }}'>
                            <a href="#"
                               class="active"
                               data-toggle="tab"
                               role="tab"
                               aria-selected="true">
                                Traffic
                            </a>
                        </div>
                        <div data-toggle="chart"
                             data-target="#locationDoughnutChart"
                             data-update='{"data":{
                             "labels": ["United States", "United Kingdom", "Germany"], 
                             "datasets": [{"label": "Purchases", "data":[15,17,25]}]
                             }}'>
                            <a href="#"
                               data-toggle="tab"
                               role="tab"
                               aria-selected="false">
                                Purchases
                            </a>
                        </div>
                        <div data-toggle="chart"
                             data-target="#locationDoughnutChart"
                             data-update='{"data":{
                             "labels": ["United States", "United Kingdom", "Germany"], 
                             "datasets": [{"label": "Quotes", "data":[53,17,25]}]
                             }}'>
                            <a href="#"
                               data-toggle="tab"
                               role="tab"
                               aria-selected="false">
                                Quotes
                            </a>
                        </div>
                    </div>
                    <div class="card-body d-flex align-items-center justify-content-center"
                         style="height: 220px;">
                        <div class="row">
                            <div class="col-7">
                                <div class="position-relative"
                                     style="height: calc(220px - 1rem * 2);">
                                    <div class="text-center fullbleed d-flex align-items-center justify-content-center flex-column z-0">
                                        <h3 class="mb-0">38%</h3>
                                        <small class="text-uppercase">United States</small>
                                    </div>
                                    <canvas class="chart-canvas"
                                            id="locationDoughnutChart"
                                            data-chart-legend="#locationDoughnutChartLegend"
                                            data-chart-line-background-color="teal;primary;gray"
                                            data-chart-suffix="%">
                                        <span style="font-size: 1rem;"
                                              class="text-muted"><strong>Location</strong> doughnut chart goes here.</span>
                                    </canvas>
                                </div>
                            </div>
                            <div class="col-5">
                                <div id="locationDoughnutChartLegend"
                                     class="chart-legend chart-legend--vertical"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card dashboard-area-tabs"
                     id="dashboard-area-tabs">
                    <div class="card-header p-0 nav">
                        <div class="row no-gutters flex"
                             role="tablist">
                            <div class="col"
                                 data-toggle="chart"
                                 data-target="#earningsTrafficChart"
                                 data-update='{"data":{"datasets":[{"label": "Traffic", "data":[10,2,5,15,10,12,15,25,22,30,25,40]}]}}'
                                 data-prefix=""
                                 data-suffix="k">
                                <a href="#"
                                   data-toggle="tab"
                                   role="tab"
                                   aria-selected="true"
                                   class="dashboard-area-tabs__tab card-body text-center active">
                                    <span class="font-weight-bold">Sessions</span>
                                    <span class="h2 mb-0 mt-n1">18.3k</span>
                                </a>
                            </div>
                            <div class="col border-left"
                                 data-toggle="chart"
                                 data-target="#earningsTrafficChart"
                                 data-update='{"data":{"datasets":[{"label": "Earnings", "data":[7,35,12,27,34,17,19,30,28,32,24,39]}]}}'
                                 data-prefix="$"
                                 data-suffix="k">
                                <a href="#"
                                   data-toggle="tab"
                                   role="tab"
                                   aria-selected="false"
                                   class="dashboard-area-tabs__tab card-body text-center">
                                    <span class="font-weight-bold">Orders</span>
                                    <span class="h2 mb-0 mt-n1">&dollar;8.9k</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body text-muted">
                        <div id="earningsTrafficChartLegend"
                             class="chart-legend mt-0 mb-24pt justify-content-start"></div>
                        <div class="chart"
                             style="height: calc(240px - 1rem * 2);">
                            <canvas class="chart-canvas js-update-chart-line"
                                    id="earningsTrafficChart"
                                    data-chart-suffix="k"
                                    data-chart-legend="#earningsTrafficChartLegend">
                                <span style="font-size: 1rem;"><strong>Website Traffic / Earnings</strong> area chart goes here.</span>
                            </canvas>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-lg-6">

                <div class="card">
                    <div class="card-header p-0 nav">
                        <div class="row no-gutters flex"
                             role="tablist">
                            <div class="col-auto">
                                <div class="p-card-header">
                                    <p class="mb-0"><strong>Revenue</strong></p>
                                    <p class="text-50 mb-0 mt-n1 d-flex align-items-center">
                                        &dollar;203k
                                        <i class="material-icons text-accent ml-4pt icon-16pt">keyboard_arrow_up</i>
                                    </p>
                                </div>
                            </div>
                            <div class="col-auto border-left">
                                <div class="p-card-header">
                                    <p class="mb-0"><strong>Employees</strong></p>
                                    <p class="text-50 mb-0 mt-n1 d-flex align-items-center">
                                        264
                                        <i class="material-icons text-accent ml-4pt icon-16pt">keyboard_arrow_up</i>
                                    </p>
                                </div>
                            </div>
                            <div class="col-auto ml-sm-auto">
                                <div class="p-card-header"><a href="#"><i class="material-icons text-50">more_horiz</i></a></div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="vector-map-revenue"
                             class="map mb-3"
                             style="height: 328px;"
                             data-toggle="vector-map"
                             data-vector-map-map="world_en"
                             data-vector-map-show-tooltip="false"
                             data-vector-map-enable-zoom="true"
                             data-vector-map-scale="1.1"
                             data-vector-map-pins='{
                             "it": "<div class=\"map-pin blue\"><span>Vatican City</span></div>",
                             "us": "<div class=\"map-pin blue\"><span>New York</span></div>",
                             "au": "<div class=\"map-pin blue\"><span>Sydney</span></div>"
                             }'>
                        </div>

                        <div class="alert alert-soft-warning">
                            <div class="d-flex flex-wrap align-items-start">
                                <div class="mr-8pt">
                                    <i class="material-icons">access_time</i>
                                </div>
                                <div class="flex"
                                     style="min-width: 180px">
                                    <small class="text-100">
                                        <strong>Congrats to the New York Team</strong> For the excellent revenue so far!
                                    </small>
                                </div>
                            </div>
                        </div>

                        <ul class="list-unstyled dashboard-location-tabs nav flex-column m-0"
                            role="tablist">
                            <li data-toggle="vector-map-focus"
                                data-target="#vector-map-revenue"
                                data-focus="us"
                                data-animate="true">
                                <div class="dashboard-location-tabs__tab active"
                                     data-toggle="tab"
                                     role="tab"
                                     aria-selected="true">
                                    <div><strong>New York</strong></div>
                                    <div class="d-flex align-items-center">
                                        <div class="flex mr-2">
                                            <div class="progress"
                                                 style="height: 4px;">
                                                <div class="progress-bar"
                                                     role="progressbar"
                                                     style="width: 72%;"
                                                     aria-valuenow="72"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <div>72k</div>
                                    </div>
                                </div>
                            </li>
                            <li data-toggle="vector-map-focus"
                                data-target="#vector-map-revenue"
                                data-focus="it"
                                data-animate="true">
                                <div class="dashboard-location-tabs__tab"
                                     data-toggle="tab"
                                     role="tab"
                                     aria-selected="true">
                                    <div><strong>Vatican City</strong></div>
                                    <div class="d-flex align-items-center">
                                        <div class="flex mr-2">
                                            <div class="progress"
                                                 style="height: 4px;">
                                                <div class="progress-bar bg-primary"
                                                     role="progressbar"
                                                     style="width: 39%;"
                                                     aria-valuenow="39"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <div>39k</div>
                                    </div>
                                </div>
                            </li>
                            <li data-toggle="vector-map-focus"
                                data-target="#vector-map-revenue"
                                data-focus="au"
                                data-animate="true">
                                <div class="dashboard-location-tabs__tab"
                                     data-toggle="tab"
                                     role="tab"
                                     aria-selected="true">
                                    <div><strong>Sydney</strong></div>
                                    <div class="d-flex align-items-center">
                                        <div class="flex mr-2">
                                            <div class="progress"
                                                 style="height: 4px;">
                                                <div class="progress-bar bg-primary"
                                                     role="progressbar"
                                                     style="width: 25%;"
                                                     aria-valuenow="25"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <div>25k</div>
                                    </div>
                                </div>
                            </li>
                        </ul>

                    </div>
                </div>

            </div>
        </div>

        <div class="row mb-lg-8pt">
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body d-flex align-items-center">
                        <div class="h2 mb-0 mr-3">&dollar;12.9k</div>
                        <div class="flex">
                            <p class="mb-0"><strong>Target</strong></p>
                            <p class="text-50 mb-0 mt-n1 d-flex align-items-center">
                                31.5%
                                <i class="material-icons text-accent ml-4pt icon-16pt">keyboard_arrow_up</i>
                            </p>
                        </div>
                        <i class="material-icons icon-48pt text-20 ml-2">access_time</i>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body d-flex align-items-center">
                        <div class="h2 mb-0 mr-3">&dollar;3.6k</div>
                        <div class="flex">
                            <p class="mb-0"><strong>Earnings</strong></p>
                            <p class="text-50 mb-0 mt-n1 d-flex align-items-center">
                                51.5%
                                <i class="material-icons text-accent ml-4pt icon-16pt">keyboard_arrow_up</i>
                            </p>
                        </div>
                        <i class="material-icons icon-48pt text-20 ml-2">attach_money</i>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body d-flex align-items-center">
                        <div class="h2 mb-0 mr-3">8.3k</div>
                        <div class="flex">
                            <p class="mb-0"><strong>Visits</strong></p>
                            <p class="text-50 mb-0 mt-n1 d-flex align-items-center">
                                3.5%
                                <i class="material-icons text-accent ml-4pt icon-16pt">keyboard_arrow_down</i>
                            </p>
                        </div>
                        <i class="material-icons icon-48pt text-20 ml-2">person_outline</i>
                    </div>
                </div>
            </div>

        </div>

        <div class="page-separator">
            <div class="page-separator__text">Current Users</div>
        </div>

        <div class="card mb-lg-32pt">

            <div class="table-responsive"
                 data-toggle="lists"
                 data-lists-sort-by="js-lists-values-employee-name"
                 data-lists-values='["js-lists-values-employee-name", "js-lists-values-employer-name", "js-lists-values-projects", "js-lists-values-activity", "js-lists-values-earnings"]'>

                <div class="card-header">
                    <form class="form-inline">
                        <label class="mr-sm-2 form-label"
                               for="inlineFormFilterBy">Filter by:</label>
                        <input type="text"
                               class="form-control search mb-2 mr-sm-2 mb-sm-0"
                               id="inlineFormFilterBy"
                               placeholder="Search ...">

                        <label class="sr-only"
                               for="inlineFormRole">Role</label>
                        <select id="inlineFormRole"
                                class="custom-select mb-2 mr-sm-2 mb-sm-0">
                            <option value="All Roles">All Roles</option>
                        </select>

                        <div class="ml-auto mb-2 mb-sm-0 custom-control-inline mr-0">
                            <label class="form-label mb-0"
                                   for="active">Active</label>
                            <div class="custom-control custom-checkbox-toggle ml-8pt">
                                <input checked=""
                                       type="checkbox"
                                       id="active"
                                       class="custom-control-input">
                                <label class="custom-control-label"
                                       for="active">Active</label>
                            </div>
                        </div>
                    </form>
                </div>

                <table class="table mb-0 thead-border-top-0 table-nowrap">
                    <thead>
                        <tr>

                            <th style="width: 18px;"
                                class="pr-0">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox"
                                           class="custom-control-input js-toggle-check-all"
                                           data-target="#staff"
                                           id="customCheckAllstaff">
                                    <label class="custom-control-label"
                                           for="customCheckAllstaff"><span class="text-hide">Toggle all</span></label>
                                </div>
                            </th>

                            <th>
                                <a href="javascript:void(0)"
                                   class="sort"
                                   data-sort="js-lists-values-employee-name">Employee</a>
                            </th>

                            <th style="width: 150px;">
                                <a href="javascript:void(0)"
                                   class="sort"
                                   data-sort="js-lists-values-employer-name">Employer</a>
                            </th>

                            <th class="text-center"
                                style="width: 48px;">
                                <a href="javascript:void(0)"
                                   class="sort"
                                   data-sort="js-lists-values-projects">Projects</a>
                            </th>

                            <th style="width: 37px;">Status</th>

                            <th style="width: 120px;">
                                <a href="javascript:void(0)"
                                   class="sort"
                                   data-sort="js-lists-values-activity">Activity</a>
                            </th>
                            <th style="width: 51px;">
                                <a href="javascript:void(0)"
                                   class="sort"
                                   data-sort="js-lists-values-earnings">Earnings</a>
                            </th>
                            <th style="width: 24px;"
                                class="pl-0"></th>
                        </tr>
                    </thead>
                    <tbody class="list"
                           id="staff">

                        <tr class="selected">

                            <td class="pr-0">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox"
                                           class="custom-control-input js-check-selected-row"
                                           checked=""
                                           id="customCheck1_1">
                                    <label class="custom-control-label"
                                           for="customCheck1_1"><span class="text-hide">Check</span></label>
                                </div>
                            </td>

                            <td>

                                <div class="media flex-nowrap align-items-center"
                                     style="white-space: nowrap;">
                                    <div class="avatar avatar-32pt mr-8pt">

                                        <img src="assets/images/people/110/guy-1.jpg"
                                             alt="Avatar"
                                             class="avatar-img rounded-circle">

                                    </div>
                                    <div class="media-body">

                                        <div class="d-flex flex-column">
                                            <p class="mb-0"><strong class="js-lists-values-employee-name">Michael Smith</strong></p>
                                            <small class="js-lists-values-employee-email text-50"></small>
                                        </div>

                                    </div>
                                </div>

                            </td>

                            <td>
                                <div class="d-flex align-items-center">
                                    <a href="#"
                                       class="text-warning"><i class="material-icons mr-8pt">star</i></a>
                                    <a href="#"
                                       class="text-70"><span class="js-lists-values-employer-name">Black Ops</span></a>
                                </div>
                            </td>

                            <td class="text-center js-lists-values-projects small">12</td>

                            <td>

                                <a href="#"
                                   class="chip chip-outline-secondary">Admin</a>

                            </td>

                            <td class="text-50 js-lists-values-activity small">3 days ago</td>
                            <td class="js-lists-values-earnings small">$12,402</td>
                            <td class="text-right pl-0">
                                <a href="#"
                                   class="text-50"><i class="material-icons">more_vert</i></a>
                            </td>
                        </tr>

                        <tr>

                            <td class="pr-0">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox"
                                           class="custom-control-input js-check-selected-row"
                                           id="customCheck1_2">
                                    <label class="custom-control-label"
                                           for="customCheck1_2"><span class="text-hide">Check</span></label>
                                </div>
                            </td>

                            <td>

                                <div class="media flex-nowrap align-items-center"
                                     style="white-space: nowrap;">
                                    <div class="avatar avatar-32pt mr-8pt">

                                        <span class="avatar-title rounded-circle">CS</span>

                                    </div>
                                    <div class="media-body">

                                        <div class="d-flex flex-column">
                                            <p class="mb-0"><strong class="js-lists-values-employee-name">Connie Smith</strong></p>
                                            <small class="js-lists-values-employee-email text-50"></small>
                                        </div>

                                    </div>
                                </div>

                            </td>

                            <td>
                                <div class="d-flex align-items-center">
                                    <a href="#"
                                       class="text-warning"><i class="material-icons mr-8pt">star</i></a>
                                    <a href="#"
                                       class="text-70"><span class="js-lists-values-employer-name">Backend Ltd</span></a>
                                </div>
                            </td>

                            <td class="text-center js-lists-values-projects small">42</td>

                            <td>

                                <a href="#"
                                   class="chip chip-outline-secondary">User</a>

                            </td>

                            <td class="text-50 js-lists-values-activity small">1 week ago</td>
                            <td class="js-lists-values-earnings small">$1,943</td>
                            <td class="text-right pl-0">
                                <a href="#"
                                   class="text-50"><i class="material-icons">more_vert</i></a>
                            </td>
                        </tr>

                        <tr>

                            <td class="pr-0">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox"
                                           class="custom-control-input js-check-selected-row"
                                           id="customCheck1_3">
                                    <label class="custom-control-label"
                                           for="customCheck1_3"><span class="text-hide">Check</span></label>
                                </div>
                            </td>

                            <td>

                                <div class="media flex-nowrap align-items-center"
                                     style="white-space: nowrap;">
                                    <div class="avatar avatar-32pt mr-8pt">

                                        <img src="assets/images/people/110/guy-2.jpg"
                                             alt="Avatar"
                                             class="avatar-img rounded-circle">

                                    </div>
                                    <div class="media-body">

                                        <div class="d-flex flex-column">
                                            <p class="mb-0"><strong class="js-lists-values-employee-name">John Connor</strong></p>
                                            <small class="js-lists-values-employee-email text-50"></small>
                                        </div>

                                    </div>
                                </div>

                            </td>

                            <td>
                                <div class="d-flex align-items-center">
                                    <a href="#"
                                       class="text-warning"><i class="material-icons mr-8pt">star</i></a>
                                    <a href="#"
                                       class="text-70"><span class="js-lists-values-employer-name">Frontted</span></a>
                                </div>
                            </td>

                            <td class="text-center js-lists-values-projects small">31</td>

                            <td>

                                <a href="#"
                                   class="chip chip-outline-secondary">Manager</a>

                            </td>

                            <td class="text-50 js-lists-values-activity small">2 weeks ago</td>
                            <td class="js-lists-values-earnings small">$1,401</td>
                            <td class="text-right pl-0">
                                <a href="#"
                                   class="text-50"><i class="material-icons">more_vert</i></a>
                            </td>
                        </tr>

                        <tr class="selected">

                            <td class="pr-0">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox"
                                           class="custom-control-input js-check-selected-row"
                                           checked=""
                                           id="customCheck1_4">
                                    <label class="custom-control-label"
                                           for="customCheck1_4"><span class="text-hide">Check</span></label>
                                </div>
                            </td>

                            <td>

                                <div class="media flex-nowrap align-items-center"
                                     style="white-space: nowrap;">
                                    <div class="avatar avatar-32pt mr-8pt">

                                        <span class="avatar-title rounded-circle">LB</span>

                                    </div>
                                    <div class="media-body">

                                        <div class="d-flex flex-column">
                                            <p class="mb-0"><strong class="js-lists-values-employee-name">Laza Bogdan</strong></p>
                                            <small class="js-lists-values-employee-email text-50"></small>
                                        </div>

                                    </div>
                                </div>

                            </td>

                            <td>
                                <div class="d-flex align-items-center">
                                    <a href="#"
                                       class="text-warning"><i class="material-icons mr-8pt">star</i></a>
                                    <a href="#"
                                       class="text-70"><span class="js-lists-values-employer-name">Frontted</span></a>
                                </div>
                            </td>

                            <td class="text-center js-lists-values-projects small">44</td>

                            <td>

                                <a href="#"
                                   class="chip chip-outline-secondary">Admin</a>

                            </td>

                            <td class="text-50 js-lists-values-activity small">3 weeks ago</td>
                            <td class="js-lists-values-earnings small">$22,402</td>
                            <td class="text-right pl-0">
                                <a href="#"
                                   class="text-50"><i class="material-icons">more_vert</i></a>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>

            <div class="card-footer p-8pt">

                <ul class="pagination justify-content-start pagination-xsm m-0">
                    <li class="page-item disabled">
                        <a class="page-link"
                           href="#"
                           aria-label="Previous">
                            <span aria-hidden="true"
                                  class="material-icons">chevron_left</span>
                            <span>Prev</span>
                        </a>
                    </li>
                    <li class="page-item dropdown">
                        <a class="page-link dropdown-toggle"
                           data-toggle="dropdown"
                           href="#"
                           aria-label="Page">
                            <span>1</span>
                        </a>
                        <div class="dropdown-menu">
                            <a href="#"
                               class="dropdown-item active">1</a>
                            <a href="#"
                               class="dropdown-item">2</a>
                            <a href="#"
                               class="dropdown-item">3</a>
                            <a href="#"
                               class="dropdown-item">4</a>
                            <a href="#"
                               class="dropdown-item">5</a>
                        </div>
                    </li>
                    <li class="page-item">
                        <a class="page-link"
                           href="#"
                           aria-label="Next">
                            <span>Next</span>
                            <span aria-hidden="true"
                                  class="material-icons">chevron_right</span>
                        </a>
                    </li>
                </ul>

            </div>
        </div>

        <div class="row card-group-row mb-lg-8pt">
            
            <div class="col-lg card-group-row__col">
                <div class="card card-group-row__card">
                    <div class="card-header d-flex align-items-center">
                        <strong class="flex">FEEDBACK SUMMARY</strong>
                        <a href="#"><i class="material-icons text-50">more_horiz</i></a>
                    </div>
                    <div class="card-body d-flex flex-column align-items-center justify-content-center">
                        <ul class="list-unstyled list-skills w-100">
                            <li class="mb-8pt">
                                <div class="text-100 border-right"><small>Service Appreciation Feedback</small></div>
                                <div class="flex">
                                    <div class="progress"
                                         style="height: 10px;">
                                        <div class="progress-bar bg-success"
                                             role="progressbar"
                                             style="width: 61%;"
                                             aria-valuenow="61"
                                             aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="text-70"><small>61%</small></div>
                            </li>
                            <li class="mb-8pt">
                                <div class="text-50 border-right"><small>Service Request to Re Open Grievance</small></div>
                                <div class="flex">
                                    <div class="progress"
                                         style="height: 10px;">
                                        <div class="progress-bar bg-accent"
                                             role="progressbar"
                                             style="width: 39%;"
                                             aria-valuenow="39"
                                             aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="text-70"><small>39%</small></div>
                            </li>
                            <li class="mb-8pt">
                                <div class="text-50 border-right"><small>Service Complain Feedback</small></div>
                                <div class="flex">
                                    <div class="progress"
                                         style="height: 10px;">
                                        <div class="progress-bar bg-warning"
                                             role="progressbar"
                                             style="width: 76%;"
                                             aria-valuenow="76"
                                             aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="text-70"><small>76%</small></div>
                            </li>
                           
                        </ul>
                    </div>
                    <div class="card-footer p-8pt">

                        <ul class="pagination justify-content-start pagination-xsm m-0">
                            <li class="page-item disabled">
                                <a class="page-link"
                                   href="#"
                                   aria-label="Previous">
                                    <span aria-hidden="true"
                                          class="material-icons">chevron_left</span>
                                    <span>Prev</span>
                                </a>
                            </li>
                            <li class="page-item dropdown">
                                <a class="page-link dropdown-toggle"
                                   data-toggle="dropdown"
                                   href="#"
                                   aria-label="Page">
                                    <span>1</span>
                                </a>
                                <div class="dropdown-menu">
                                    <a href="#"
                                       class="dropdown-item active">1</a>
                                    <a href="#"
                                       class="dropdown-item">2</a>
                                    <a href="#"
                                       class="dropdown-item">3</a>
                                    <a href="#"
                                       class="dropdown-item">4</a>
                                    <a href="#"
                                       class="dropdown-item">5</a>
                                </div>
                            </li>
                            <li class="page-item">
                                <a class="page-link"
                                   href="#"
                                   aria-label="Next">
                                    <span>Next</span>
                                    <span aria-hidden="true"
                                          class="material-icons">chevron_right</span>
                                </a>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>
        </div>

        <div class="page-separator">
            <div class="page-separator__text">Discussions</div>
        </div>

        <div class="container-fluid page__container">
            <div class="page-section">




                <div class="container p-1">
                    <p>Add Your Grievance Guideline description here</p>
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
                                        <%
                                            ArrayList<Guideline> guidelineList = (ArrayList<Guideline>) request.getAttribute("guidelineList");
                                            for (Guideline guideline : guidelineList) {
                                        %>
                                        <tr>
                                            <td><%=guideline.getgLVersionID()%></td>
                                            <td><%=guideline.getgLTitle()%></td>
                                            <td><%=guideline.getgLDescription()%></td>
                                            <td><%=guideline.getgLUploadDate()%></td>
                                            <td><%=guideline.getgLModifyDate()%></td>
                                            <td><button class="btn btn-success" ><a style="color:white;" href="<%=request.getContextPath()%>/DownloadGuideline?gLVersionID=<%=guideline.getIntegergLVersionID()%>"><b>DOWNLOAD</b></a></button></td>

                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>                                                  

            </div>
        </div>
        <script>
            var table = document.getElementById("usersTable"), rIndex;

            for (var i = 0; i < table.rows.length; i++) {
                table.rows[i].onclick = function ()
                {
                    $("#gLVersion").show();
                    $("#gLVersionUDate").show();
                    $("#gLVersionMDate").show();
                    rIndex = this.rowIndex;
                    document.getElementById("gLVersionID").value = this.cells[0].innerHTML;
                    document.getElementById("gLTitle").value = this.cells[1].innerHTML;
                    document.getElementById("gLDescription").value = this.cells[2].innerHTML
                    document.getElementById("gLUDate").value = this.cells[3].innerHTML
                    document.getElementById("gLMDate").value = this.cells[4].innerHTML

                    $("#gLFileDiv").hide();
                    $("#add").hide();
                    $("#update").show();


                }
            }
            function showDiv() {
                $("#gLVersion").hide();
                $("#gLFileDiv").show();
                $("#gLVersionUDate").hide();
                $("#gLVersionMDate").hide();
            }

        </script>
        <%@include file="../content/popupModel.jsp" %>
        <%@include file="../includes/script.jsp" %>
    </div>
</div>

<!-- footer -->
<%@include  file="../includes/footer.jsp" %>
<!-- // END footer -->