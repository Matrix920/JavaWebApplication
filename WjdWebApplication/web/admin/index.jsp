
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
	
    الشركة العامة للمحروقات

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
                <a class="navbar-brand" href="index.jsp">الرئيسية</a>
            </div>

            <div class="header-right">

                
                <div id="userPanel" style="display:inline-block">
                    <b dir="rtl">  أهلا بك   المدير  <span  style="color:red"  id="LabelUsername"><%= login.user!=null?login.user.full_name:""  %></span>    </b>
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
                <div class="row">
                    <div class="col-md-12" dir="rtl">
                        <h1 class="page-head-line">لمحة عامة عن الشركة</h1>
                    <p style="text-align: justify;"><span style="font-family: simplified Arabic;"><b>&nbsp;&nbsp;تعتبر شركة محروقات إحدى أهم شركات القطاع العام النفطية ذات الطابع الاقتصادي والخدمي،
                      وقد أُنيطت بها مهام تأمين المشتقات النفطية بأنواعها المختلفة إلى القطاعات المستهلكة
                      في القطر،  وكذلك تأمين كافة المستلزمات لتنفيذ مهامها ، من نقل وتخزين وتوزيع سواءً
                      المنتجات النفطية المحلية أو المستوردة.</b></span></p>
                       <p style="text-align: justify;"><span style="font-family: simplified Arabic;"><b>
                      &nbsp;&nbsp;تقوم الشــركة بنقلِ وتخزينِ وتوزيعِ المواد التالية(البنزين بأنواعـه ـ المازوت ـ الديزل ـ الكيروســين بأنواعه ـ الفيــول ـ الغاز الســائل LPG ـ الإسفلت ـ فحم الكوك ـ المواد المذيبــة / البنزين المحسَّــن ، النفتا الخفيفة المهدرجــة ، الأكزيليــن ، الوايت سبيريت ، التولوين ) . </b></span></p>
                       <p style="text-align: justify;"><span style="font-family: simplified Arabic;"><b>
                      &nbsp;&nbsp;كما تقوم شركة محروقات بتسويق الزيوت المعدنية من إنتاج معمل مزج الزيوت المعدنية
                      التابع للشركة العامة لمصفاة حمص وتأمين احتياجات جميع جهات القطاع العام من الزيوت المعدنية و
                      الشحوم والتي لا ينتجها معمل المزج.<br>
                      &nbsp;&nbsp;تؤمن الشركة القسم الأكبر من المواد التي تتعامل بها محلياً من مصفاتي / حمص وبانياس /
                      وتستورد باقي احتياجاتها عن طريق مكتب تسويق النفط التابع لرئاسة مجلس الوزراء.  </b></span></p>
                      <p style="text-align: justify;"><span style="font-family: simplified Arabic;"><b>
                      <font color="red">* </font>تهدف خطة الشركة لعام  2010&nbsp;إلى تحقيق مبيعاتٍ إجماليَّة قيمتها (320,282) مليار ليرة سورية بأسعار البيع الحالية للمشتقات داخل القطر وبكمية مشتقات تصل إلى حوالي <font face="paper">16</font> مليون طن.</b></span></p>
                      <p style="text-align: justify;"><span style="font-family: simplified Arabic;"><b>
                      <font color="red">*</font> تقوم الشــركة بتنفيذ مهامهــا من خلال خطط سنوية اســتثمارية وتجاريــة  وقوى عاملة
                      منســجمة مع النمو الاقتصادي والاجتماعي والخدمي الذي يشهده القطر في مختلف المجالات.  </b></span></p>
                      <p style="text-align: justify;"><span style="font-family: simplified Arabic;"><b>
                      <font color="red">* </font> تستثمر الشركة حالياً شبكة أنابيب يبلغ طولها حوالي  /1300/&nbsp;كم ومستودعات لتخزين المشتقات
                      النفطية تبلغ  طاقتها التخزينية /2,000/ مليون متر مكعب تغطي محافظات القطر.</b></span></p>
                      <p style="text-align: justify;"><span style="font-family: simplified Arabic;"><b>
                      <font color="red">* </font> و لدى الشركة أسطولاً متخصصاً من الصهاريج لنقل كيروسين الطيران إلى المطارات،
                      وصهاريج للتوزيع المباشر لمادة المازوت على المنشآت والمواطنين، كما يوجد مستودعات للزيوت والشحوم ومحطات لشحن المشتقات البترولية بالصهاريج
                      وبالقطارات، ومحطات ضخ على خطوط الأنابيب وعدد من محطات الوقود، وغيرها من
                      المنشآت والمرافق الحيوية. </b></span></p>
                      <p style="text-align: justify;"><span style="font-family: simplified Arabic;"><b>
                      <font color="red">* </font> وتتابع الشركة الجهد المستمر لتوسيع مرافقها ونشاطاتها لتكون ملبيةً بشكل دائم لحاجة
                      جميع القطاعات ومسايرةً لمتطلبات النمو في المجالات المختلفة ( الإنتاجية والخدمية )
                      وأتمتة العمل وتكنولوجيا المعلومات .   </b></span></p>
                      <p style="text-align: justify;"><span style="font-family: simplified Arabic;"><b>
                      <font color="red">* </font> وبهدف المحافظة على البيئة عملت الشركة على توزيع البنزين من  بنزين
                      حاوي  رصاص إلى بنزين خالي رصاص من خلال تنفيذ برنامج زمني بدأ عام /1998/،
                      حيث يتم توزيع البنزين بنسبة&nbsp;100 %  من النوع خالي الرصاص منذ عام 2004، كذلك قامت
                      الشــركة  بتركيب أســقف عائمــة لجميع خزانــات البنزين الهوائيــة لمنع التبخــر وتلوث الهواء . </b></span></p>
                      <p style="text-align: justify;"><span style="font-family: simplified Arabic;"><b>
                      <font color="red">* </font>وقد تــمَّ خلال عـــام 2009 صدورُ مواصفةٍ لمازوتِ الحرقِ /التدفئة والتسخين/ ، ومواصفةِ لمازوت الديــزل /المازوت الأخضر/ ، وبدأت شركة محروقات منذ الربع الأخير من عام /2009/ بتوزيعِ المازوت الأخضر
                      على شــركات النقــل الداخلــي والمحطات المملوكة من قبل شركة محروقات، وتمُّ تعميمها خلال الربع الثاني عام /2010/ على محطَّــاتِ الوقــودِ  وقامت الشركة بإعداد دفاتر الشروط الفنية لإنشاء ثلاث محطات لتموين الباصات بالغاز (CNG)،و تم تسليم هذه الشروط الفنية إلى وزارة النقل للإعلان عن شراء  /1000/&nbsp;باص مع إنشاء ثلاث محطات لتموين الباصات بالغاز (CNG) وتقوم الشركة بإعداد دفاتر الشروط الفنية لإيصال الغاز إلى المدينة الصناعية بعدرا ومعامل السيراميك في دير علي مع عدد من محطات تموين السيارات من الغاز الطبيعي CNG.</b></p>
                      <p style="text-align: justify;"><span style="font-family: simplified Arabic;"><b>
                      &nbsp;&nbsp;تسعى الشركة بشكلٍ دائم إلى تخفيض كلف الإنتاج وترشيد الإنفاق من خلال تطوير
                      أساليب  عملها وتحديثها وقد حققت مؤخراً إنجازات هامة بذلك <br>  <br>  </b></span></p>
                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="main-box mb-red">
                            <a href="#">
                                <h5></h5>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="main-box mb-dull">
                            <a href="../map.jsp">
                                <h5>خريطة توزع المراكز</h5>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="main-box mb-pink">
                            <a href="#">
                                <h5></h5>
                            </a>
                        </div>
                    </div>

                </div>
                <!-- /. ROW  -->

                <div class="row">
                    <div class="col-md-8">
                        <div class="panel panel-default">

                            <div id="carousel-example" class="carousel slide" data-ride="carousel" style="border: 5px solid #000;">

                                <div class="carousel-inner">
                                    <div class="item active">

                                        <img src="../Images/a.jpg" alt="" />

                                    </div>
                                    <div class="item">
                                        <img src="../Images/b.jpg" alt="" />

                                    </div>
                                    <div class="item">
                                        <img src="../Images/c.jpg" alt="" />

                                    </div>
                                </div>
                                <!--INDICATORS-->
                                <ol class="carousel-indicators">
                                    <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-example" data-slide-to="1"></li>
                                    <li data-target="#carousel-example" data-slide-to="2"></li>
                                </ol>
                                <!--PREVIUS-NEXT BUTTONS-->
                                <a class="left carousel-control" href="#carousel-example" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                </a>
                                <a class="right carousel-control" href="#carousel-example" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- /.REVIEWS &  SLIDESHOW  -->
                     <!-- Chat box -->

                <!-- /. ROW  -->


            </div>
            <!-- /. PAGE INNER  -->
      </div>
                     </div>
               
               
               
               
                 </span>
               
               
               
               

                
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
