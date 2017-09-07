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
        
        o.setPass(request.getParameter("old"));
        o.setNewpass(request.getParameter("new"));
        o.setId((String)session.getAttribute("id"));
        String status=o.updatePass(o);
        session.setAttribute("Status",status);
        response.sendRedirect("../changepassword.jsp");
        %>
    </body>
</html>
