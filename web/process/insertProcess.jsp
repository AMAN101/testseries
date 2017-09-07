<%@page import="MyBean.Mybean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        Mybean o=new Mybean();
        o.setUname(request.getParameter("uname"));
        o.setEmail(request.getParameter("email"));
        o.setGender(request.getParameter("gender"));
        o.setCity(request.getParameter("city"));
        o.setPass(request.getParameter("pass"));
        String status=o.insertData(o);
        session.setAttribute("InsertStatus",status);
        response.sendRedirect("../index.jsp");
        %>
         
    </body>
</html>
