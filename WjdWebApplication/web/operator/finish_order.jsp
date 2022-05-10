<%-- 
    Document   : finish_order
    Created on : 12/01/2019, 11:30:30 ص
    Author     : Hananao.Tech
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            int order_id=Integer.parseInt(id);
        
            OrderRepository.finishOrder(order_id);
            response.sendRedirect("done_orders.jsp");
        }
        %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
