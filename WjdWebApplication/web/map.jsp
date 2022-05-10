-- 
    Document   : index
    Created on : Jan 9, 2019, 3:40:38 PM
    Author     : Matrix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>توزع المراكز</title>

        <meta charset="utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0" />


    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
       <!--CUSTOM BASIC STYLES-->
    <link href="assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
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
         #map{
            width:800px;
            height:800px;
        }

    </style>
    </head>
  
    <body>
        
    <form method="post" action="">






        
            <!--------------------------------->
             <div id="wrapper"><img src="Images/main-image.jpg" width="100%" alt="Main Image" />
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

        </nav>
        <!-- /. NAV TOP  -->
        
        <!-- /. NAV SIDE  -->
            
                 
                <div id="page-wrapper">
            <div id="page-inner">
                <div class="row"dir="rtl">
                    <h1 class="page-head-line">خريطة سورية تظهر توزع مراكز توزيع المحروقات ضمن الجمهورية العربية السورية</h1>
                     <div style="text-align:center">
                         <div id="map"></div>
                         <script>
                             var map;
                             function InitializeMap() {
                                 var latlngc = new google.maps.LatLng(35.216667, 38.583333);
                                 var myOptions = {
                                     zoom: 7,
                                     center: latlngc,
                                     mapTypeId: google.maps.MapTypeId.ROADMAP,
                                     //from this update 1
                                     /*
                                     mapTypeControl: true,
                                     navigationControl: true,
                                     navigationControlOptions:
                                     {
                                         style: google.maps.NavigationControlStyle.ZOOM_PAN
                                     },
                                     scaleControl: true,
                                     disableDoubleClickZoom: true,
                                     draggable: false,
                                     streetViewControl: true,
                                     draggableCursor: 'move'
                                     //end of update 1
                                     */
                                     scaleControl: false,
                                     draggable: false
                                 };

                                 map = new google.maps.Map(document.getElementById("map"), myOptions);

                                 //add marker
                                 /*
                                 var marker = new google.maps.Marker
                                    (
                                        {
                                            position: new google.maps.LatLng(36.468403, 40.765659),
                                            map: map,
                                            title: 'فرع الحسكة'
                                        }
                                    );
                                 var infowindow = new google.maps.InfoWindow({
                                     content: 'فرع الحسكة<br/>الحسكة-طريق ديرالزور<br/>'
                                 });
                                 google.maps.event.addListener(marker, 'click', function () {
                                     // Calling the open method of the infoWindow 
                                     infowindow.open(map, marker);
                                 });
                                 */

                                 //multiple markers
                                 var marker;
                                 var infowindow;
                                 var ltlng = [];
                                 var contents = [
                                     "فرع الحسكة <br/>الحسكة-طريق دير الزور",
                                     "فرع ديرالزور <br/>محطة القطار",
                                     "فرع الرقة <br/> الرقة الشمالية-محطة القطار",
                                     "فرع حلب <br/>الراموسة <hr/>فرع المنطقة الشمالية <br/>حلب اخر الراموسة الجديدة منطقة الدباغات",
                                     "فرع إدلب<br/>طريق سرمين",
                                     "فرع اللاذقية <br/>طريق حلب-مفرق الشيخ محمود",
                                     "فرع حماة<br/>المنطقة الصناعية",
                                     "فرع طرطوس<br/>ضاحية الأسد الجنوبية<hr/>فرع المنطقةالساحلية لتوزيع الغاز<br/>بانياس شمال غرب شركة مصفاة بانياس",
                                     "فرع حمص <br/>جانب مصفاة حمص",
                                     "فرع دمشق<br/>الحجاز بناء ملا وماضي ط1 <hr/>فرع ريف دمشق<br/>القدم طريق الحجر الأسود <hr/>فرع المنطقة الجنوبية<br/>عدرا-مقابل المدينة العمالية-مفرق الضمير<hr/>فرع دمشق وريفها لتوزيع الغاز<br/>عدرا جوار الدفاع المدني",
                                     "فرع درعا<br/>منطقة إزرع على طريق بعد الحرير",
                                     "فرع السويداء<br/>عريفة"]
                                 //الحسكة
                                 ltlng.push(new google.maps.LatLng(36.468403, 40.765659));
                                 //دير الزور
                                 ltlng.push(new google.maps.LatLng(35.344246, 40.151922));
                                 //الرقة
                                 ltlng.push(new google.maps.LatLng(35.958035, 39.020685));
                                 //حلب
                                 ltlng.push(new google.maps.LatLng(36.204734, 37.141808));
                                 //إدلب
                                 ltlng.push(new google.maps.LatLng(35.928874, 36.652772));
                                 //اللاذقية
                                 ltlng.push(new google.maps.LatLng(35.52441, 35.817887));
                                 //حماة
                                 ltlng.push(new google.maps.LatLng(35.140105, 36.754390));
                                 //طرطوس
                                 ltlng.push(new google.maps.LatLng(34.797898, 35.970443));
                                 //حمص
                                 ltlng.push(new google.maps.LatLng(34.758272, 36.735500));
                                 //دمشق
                                 ltlng.push(new google.maps.LatLng(33.513862, 36.282803));
                                 //درعا
                                 ltlng.push(new google.maps.LatLng(32.620061, 36.110768));
                                 //السويداء
                                 ltlng.push(new google.maps.LatLng(32.709851,36.574718));

                                 //map.setCenter(ltlng[0]);
                                 for (var i = 0; i < ltlng.length; i++) {
                                     marker = new google.maps.Marker({
                                         map: map,
                                         position: ltlng[i]
                                     });

                                     (function (i, marker) {

                                         google.maps.event.addListener(marker, 'click', function () {

                                             if (!infowindow) {
                                                 infowindow = new google.maps.InfoWindow();
                                             }

                                             infowindow.setContent(contents[i]);

                                             infowindow.open(map, marker);

                                         });

                                     })(i, marker);

                                 }
                             }
                             window.onload = InitializeMap;
                         </script>
                         <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
                    </div>
                </div>
              </div>
    </div>


                <!-- /. ROW  -->
                
                <!-- /. ROW  -->

                
            <!-- /. PAGE INNER  -->
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
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
       <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    

    


</form>




    </body>
</html>
