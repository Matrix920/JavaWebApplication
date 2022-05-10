<%-- 
    Document   : submitted_orders
    Created on : Jan 9, 2019, 10:44:51 PM
    Author     : Matrix
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> الطلبات المقدمة</title>

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
                    <b dir="rtl">  أهلا بك   الزبون  <span   style="color:red" id="LabelUsername"><%= login.user!=null?login.user.full_name:""  %></span>    </b>
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
                <div class="row"dir="rtl">
                    <h1 class="page-head-line">معلومات الطلبات القديمة</h1>
                     <div style="text-align:center">

     <div>
	<table cellspacing="0" cellpadding="4" align="Center" id="ContentPlaceHolderContent_GridView1" style="color:#333333;width:90%;border-collapse:collapse;">
		<tr align="center" valign="middle" style="color:White;background-color:#5D7B9D;font-weight:bold;">
			<th scope="col">رقم الطلب</th>
                        <th scope="col">اسم المركز</th>
                        <th scope="col">تاريخ التقديم</th>
                        <th scope="col">رقم السيارة</th>
                        <th scope="col">تاريخ الإنجاز</th>
                        <th scope="col">الكمية</th>
                        <th scope="col">الحالة</th>
		</tr>
                <% List<Order>orders=OrderRepository.getOrdersByCst(user_id);
                for(Order order:orders){
                    %>
                    <tr style="color:#333333;background-color:#F7F6F3;">
			<td><%=order.order_id%></td>
                        <td><%=order.center_name %></td>
                        <td><%=order.order_date %></td>
                        <td><%=order.car_number %></td>
                        <td><%=order.done_date %></td>
                        <td><%=order.quantity %></td>
                        <td><%=order.sState %></td>
		</tr>
                    <%
                }
                %>
	</table>
</div>

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
