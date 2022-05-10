<%-- 
    Document   : new_order
    Created on : Jan 9, 2019, 10:45:07 PM
    Author     : Matrix
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> تقديم طلب جديد</title>

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
            if(!login.isCustomer()){
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
        
        int user_id=login.user.user_id;
        
        String quantity=request.getParameter(Order.QUANTITY);
        String center_id=request.getParameter(Center.CENTER_ID);
        
        if(quantity!=null  && center_id!=null){
            Calendar c=Calendar.getInstance();
            Date date=new Date(c.get(Calendar.YEAR),c.get(Calendar.MONTH),c.get(Calendar.DATE));
           // String sDate=DateRepo.getDate(date);
            
            Order order=new Order(Integer.parseInt(quantity), 0, date, null, 1,user_id,Integer.parseInt(center_id));
            
            OrderRepository.addOrder(order);
            
            response.sendRedirect("submitted_orders.jsp");
        }
        %>
    <body>
           <form method="post" action="" id="form1">

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

                
                <div id="userPanel" style="display:inline-block">
                    <b dir="rtl">  أهلا بك   الزبون  <span  style="color:red"  id="LabelUsername"><%= login.user!=null?login.user.full_name:""  %></span>    </b>
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
                    <li id="customerPanel">
                        <a href="#"><i class="fa fa-desktop "></i>لوحة الزبون <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="new_order.jsp"><i class="fa fa-toggle-on"></i>طلب جديد</a>
                            </li>
                            <li>
                                <a href="submitted_orders.jsp"><i class="fa fa-bell "></i>متابعة الطلبات</a>
                            </li>
                             <li>
                                 <a href="old_orders.jsp"><i class="fa fa-circle-o "></i>الطلبات القديمة</a>
                            </li>
                           
                        </ul>
                    </li>
                     
                    

                    

                    
                   
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
            
                 
                 <div id="page-wrapper">
            <div id="page-inner">
                <div class="row" dir="rtl">
                    <h1 class="page-head-line">معلومات الطلب</h1>
                    <div class="pages-style">
                        <table style="width: 100%;" dir="rtl">
                            <tr>
                                <td>اسم المركز</td>
                                <td>
                                    <select name="center_id" id="ContentPlaceHolderContent_DropDownListDCenter">
                                        <% List<Center> centers=CenterRepository.getCenters();
                                        for(Center center:centers){
                                            %>
                                            <option value="<%=center.center_id%>"><%=center.center_name%></option>
                                            <%
                                        }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>الكمية</td>
                                <td>
                                    <input name="quantity" type="text" id="ContentPlaceHolderContent_TextBoxQuantity" /></td>
                                <td>


                                </td>
                            </tr>
                        </table>
                        <input type="submit" name="ctl00$ContentPlaceHolderContent$ButtonNewOrder" value="تقديم" id="ContentPlaceHolderContent_ButtonNewOrder" />
                        </div>
                    </div>
                </div>
              </div>

                
        <!-- /. PAGE WRAPPER  -->

    </div>
    <!-- /. WRAPPER  -->
               
               
               
               
               
               

                
        <!-- /. PAGE WRAPPER  -->

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
