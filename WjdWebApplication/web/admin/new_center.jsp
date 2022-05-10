
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>
	
    إضافة مركز جديد

</title>

    <!--
     <link href="App_Themes/style.css" rel="stylesheet" type="text/css" />

    <!--------------from other template--------------->
    
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
            if(!login.isAdmin()){
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
        
        String user_id=request.getParameter(User.USER_ID);
        String center_name=request.getParameter(Center.CENTER_NAME);
        String phone1=request.getParameter(Center.PHONE1);
        String phone2=request.getParameter(Center.PHONE2);
        String address=request.getParameter(Center.CENTER_ADDRESS);
        
        if(user_id!=null && center_name!=null && phone1!=null && phone2!=null && address!=null){
            Center center=new Center( Integer.parseInt(user_id), center_name, address, Integer.parseInt(phone1), Integer.parseInt(phone2));
            
            CenterRepository.addCenter(center) ;
            response.sendRedirect("centers.jsp");
        }
        %>
    <body>
         <form method="post" action=""  id="form1">

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
                <a class="navbar-brand" href="index.jsp">الرئيسية</a>
            </div>

            <div class="header-right">

                
                <div id="userPanel" style="display:inline-block">
                    <b dir="rtl">  أهلا بك   المدير  <span   style="color:red" id="LabelUsername"><%= login.user!=null?login.user.full_name:""  %></span>    </b>
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
                        <a class="active-menu" href="index.jsp"><i class="fa fa-dashboard "></i>الرئيسية</a>
                    </li>
                    
                     
                    <li id="centerManage">
                        <a href="#"><i class="fa fa-desktop "></i>إدارة مراكز التوزيع <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="centers.jsp"><i class="fa fa-toggle-on"></i>عرض المراكز</a>
                            </li>
                            <li>
                                <a href="new_center.jsp"><i class="fa fa-bell "></i>إضافة مركز جديد</a>
                            </li>
                            
                           
                        </ul>
                    </li>

                    <li id="usersManager">
                        <a href="#"><i class="fa fa-desktop "></i>إدارة المستخدمين وصلاحياتهم <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="users.jsp"><i class="fa fa-toggle-on"></i>عرض جميع المستخدمين</a>
                            </li>
                            <li>
                                <a href="new_user.jsp"><i class="fa fa-bell "></i>إضافة مستخدم جديد</a>
                            </li>
                            
                           
                        </ul>
                    </li>

                    <li id="mothlyReport">
                        <a href="monthly_report.jsp"><i class="fa fa-flash "></i>التقارير الشهرية </a>
                        
                    </li>
                   
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
            
                 
    <div id="page-wrapper">
            <div id="page-inner">
                <div class="row" dir="rtl">
                    <h1 class="page-head-line">معلومات المركز
                    </h1>
                    <div class="pages-style">
                    <table style="width: 100%;" dir="rtl">
                        <tr>
                            <td>اسم المشغل</td>
                            <td>
                                <select name="user_id" id="ContentPlaceHolderContent_DropDownListOperator">
                                    <%
                                    List<User>operators=UserRepository.getOperators();
                                    for(User operator:operators){
                                        %>
                                        <option  value="<%=operator.user_id%>"><%=operator.full_name%></option>
                                        <%
                                        
                                    }
                                    %>
                                   </select>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>اسم المركز</td>
                            <td>
                                <input name="center_name" type="text" id="ContentPlaceHolderContent_TextBoxName" /></td>
                            <td>
                                <span id="ContentPlaceHolderContent_RequiredFieldValidator1" style="visibility:hidden;">(فارغ)</span>
                            </td>
                        </tr>
                        <tr>
                            <td>رقم الهاتف 1</td>
                            <td>
                                <input name="phone1" type="text" id="ContentPlaceHolderContent_TextBoxPhone1" /></td>
                            <td>
                                <span id="ContentPlaceHolderContent_RequiredFieldValidator4" style="visibility:hidden;">(فارغ)</span>
                                                                                          <span id="ContentPlaceHolderContent_CompareValidator1" style="visibility:hidden;">(رقم غير صالح)</span>

                                 </td>
                        </tr>

                        <tr>
                            <td>رقم الهاتف 2</td>
                            <td>
                                <input name="phone2" type="text" id="ContentPlaceHolderContent_TextBoxPhone2" /></td>
                            <td>
                                <span id="ContentPlaceHolderContent_RequiredFieldValidator6" style="visibility:hidden;">(فارغ)</span>
                                                               <span id="ContentPlaceHolderContent_CompareValidator3" style="visibility:hidden;">(رقم غير صالح)</span>

                                 </td>
                        </tr>

                         <tr>
                            <td>عنوان المركز</td>
                            <td>
                                <input name="center_address" type="text" id="ContentPlaceHolderContent_TextBoxAdress" /></td>
                            <td>
                                <span id="ContentPlaceHolderContent_RequiredFieldValidator5" style="visibility:hidden;">(فارغ)</span>
                            </td>
                        </tr>
                    </table>
                        <input type="submit" name="ctl00$ContentPlaceHolderContent$ButtonNewCenter" value="إضافة"  id="ContentPlaceHolderContent_ButtonNewCenter" />
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
