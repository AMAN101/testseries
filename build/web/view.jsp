<%-- 
    Document   : view
    Created on : Sep 11, 2016, 12:39:55 PM
    Author     : aman
--%>

<%@page import="MyBean.Mybean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <%             Mybean o=new Mybean();
                    o.setId((String)session.getAttribute("id"));
                    o.setTest(request.getParameter("test"));
                    o.link(o);
                    out.println("<h3>"+o.getPaper()+"</h3>");
                    String status=o.viewresult(o);
                    out.println("<h1>Result are:-</h1><br>");
                    out.println("<h4>"+o.getQues()+"</h4>");
                    out.println("<h3>"+o.getMaxQues()+"</h3>");
                  
    %>

   <a href=home.jsp>BACK HOME</a>
    </body>
</html>
