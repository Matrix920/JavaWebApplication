<%-- 
    Document   : order_details
    Created on : Jan 9, 2019, 10:46:19 PM
    Author     : Matrix
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    < <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>تجهيز الطلب</title>

        <meta charset="utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0" />


    <!-- BOOTSTRAP STYLES-->
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
       <!--CUSTOM BASIC STYLES-->
    <link href="../assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="../assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />
    <!--------------end of other template------------------>
    <style>
        .pages-style{
            width:70%;
            margin:0 auto;
            padding:50px;
        }
        .pages-style  td{
            padding-top:10px;
        }
        .pages-style{
            font-size:20px;
            font-family:'Simplified Arabic'
        }

        .pages-style input[type=text]{

            width:250px;
        }

        .pages-style input[type=submit]{
            display:block;
            background-color:#00ca79;
            color:white;
            width:200px;
            margin:10px auto;
            padding:20px;
        }
        #ContentPlaceHolderContent_GridView1 th{
            text-align:center;
        }
        .new-style tr td,.new-style tr td:last-child{
           min-width:200px;
        }
    </style>

        
    </head>
     <%@page import="wjd_package.*" %>
    <%
        /*
        check for login
        */
        Login login=new Login();
        
        Object o=session.getAttribute(Login.LOGIN);
        if(o!=null){
            login=(Login)o;
            if(!login.isOperator()){
                response.sendRedirect("../index.jsp");
            }
        }else{
            response.sendRedirect("../index.jsp");
        }
        String lgout=request.getParameter("logout");
        if(lgout!=null){
            session.invalidate();
            response.sendRedirect("../index.jsp");
        }
        
        if(login.user!=null){
                int user_id=login.user.user_id;
                if(!CenterRepository.isLinkedToCenter(user_id)){
                    response.sendRedirect("index.jsp");
                }
        }
        
        Order order=new Order();
        
        String id=request.getParameter("id");
        if(id!=null){
            order=OrderRepository.getOrder(Integer.parseInt(id));
        }
        
        String day=request.getParameter("day");
        String month=request.getParameter("month");
        String car_number=request.getParameter("car_number");
        
        if(id!=null && day!=null && month!=null){
            Integer.parseInt(car_number);
            int m=Integer.parseInt(month);
            m--;
            Date done_date=new Date(Calendar.getInstance().get(Calendar.YEAR), m, Integer.parseInt(day));
            
            Order ord=new Order(Integer.parseInt(id), 0, Integer.parseInt(car_number), null, done_date, 2, 0);
            
            OrderRepository.updateOrder(ord);
            
            response.sendRedirect("new_orders.jsp");
        }
        %>
    <body>
        <form method="post" action="../achieve_order?id=<%=id%>" id="form1">

            <!--------------------------------->
             <div id="wrapper"><img src="../Images/main-image.jpg" width="100%" alt="Main Image" />
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">الصفحة الرئيسية</a>
            </div>

            <div class="header-right">

                
                <div id="userPanel"  style="display:inline-block">
                     <b dir="rtl">  أهلا بك     <span style="color:red" id="LabelUsername"><%= login.user!=null?login.user.full_name:""  %></span>  
                    <% 
                    if(CenterRepository.isLinkedToCenter(login.user.user_id)){
                        %>
                        <b dir="rtl">  المشغل التابع لـ    <span style="color:red" id="LabelUsername"><%= CenterRepository.getCenterByOperator(login.user.user_id).center_name %></span>    </b>
                        <%
                    }
                        %>
                         </b>
                    <a style="margin-left:5px;margin-right:5px;" href="../logout.jsp" class="btn btn-danger" title="Logout"><i type="submit" name="ctl00$ButtonLogout" value="" id="ButtonLogout" class="fa fa-exclamation-circle fa-2x" /></i></a>

                    </div>
            </div>
        </nav>
        <!-- /. NAV TOP  -->
         <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
                        <div class="user-name">
                             
                            
                            <div class="inner-text">
                            </div>
                        </div>

                    </li>


                    <li>
                        <a class="active-menu" href="index.jsp"><i class="fa fa-dashboard "></i>الصفحة الرئيسية</a>
                    </li>
                    
                     <li id="operatorPanel">
                        <a href="#"><i class="fa fa-yelp "></i>لوحة المشغل<span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="new_orders.jsp"><i class="fa fa-coffee"></i>الطلبات المقدمة</a>
                            </li>
                            <li>
                                <a href="done_orders.jsp"><i class="fa fa-flash "></i>الطلبات المنجزة</a>
                            </li>
                           
                        </ul>
                    </li>
                    

                    

                    
                   
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
            
                 
                  <div id="page-wrapper">
            <div id="page-inner">
                <div class="row"dir="rtl">
                    <h1 class="page-head-line">معلومات الطلب</h1>
                    <div class="pages-style">
                        <table style="width: 100%;" dir="rtl">
                            <tr>
                                <td>الاسم بالكامل</td>
                                <td>
                                    <span id="ContentPlaceHolderContent_LabelName"><%= order.full_name!=null?order.full_name:"" %></span></td>
                            </tr>

                            <tr>
                                <td>المركز</td>
                                <td>
                                    <span id="ContentPlaceHolderContent_LabelCenter"><%= order.center_name!=null?order.center_name:"" %></span></td>

                            </tr>
                            <tr>
                                <td>ربطه مع سيارة (رقم السيارة)</td>
                                <td>
                                    <input type="text" name="car_number">
                                </td>

                            </tr>

                            <tr>
                                <td>تحديد موعد التعبئة</td>
                                <td>
                                  
                                </td>
                            </tr>

                            <tr>
                                <td>اليوم</td>
                                <td>
                                    <select name="day">
                                    <%
                                    for(int i=1;i<=30;i++){
                                        %>
                                        <option value="<%=i%>"><%=i%></option>
                                        <% } %>
                                    </select>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>الشهر</td>
                                <td>
                                  <select name="month">
                                    <%
                                    int max=12;
                                    int min= Calendar.getInstance().get(Calendar.MONTH);
                                    min++;
                                    for(int i=min;i<=max;i++){
                                        %>
                                        <option value="<%=i%>"><%=i%></option>
                                        <% } %>
                                    </select>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>السنة</td>
                                <td>
                                  <%=Calendar.getInstance().get(Calendar.YEAR)%>
                                </td>
                            </tr>
                            
                        </table>
                        <input type="submit" name="ctl00$ContentPlaceHolderContent$ButtonSave" value="حفظ" id="ContentPlaceHolderContent_ButtonSave" />
                        </div>
                    </div>
                </div>
        </div>
                
        <!-- /. PAGE WRAPPER  -->

    </div>
    <!-- /. WRAPPER  -->

   <div id="footer-sec" dir="rtl" style="text-align:center;font-size:16px">
       الشركة العامة للمحروقات - سورية - هاتف 4451348 - فاكس : 4445796 - بريد إلكتروني : mahrukat@net.sy
    </div>
    <!-- /. FOOTER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="../assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="../assets/js/bootstrap.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="../assets/js/jquery.metisMenu.js"></script>
       <!-- CUSTOM SCRIPTS -->
    <script src="../assets/js/custom.js"></script>
         </form>
    </body>
</html>
