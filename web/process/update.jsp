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
        o.setCity(request.getParameter("city"));
        o.setPass(request.getParameter("pass"));
        o.setId((String)session.getAttribute("id"));
        String status=o.updateData(o);
        session.setAttribute("InsertStatus",status);
        response.sendRedirect("../home.jsp");
        %>
    </body>
</html>
