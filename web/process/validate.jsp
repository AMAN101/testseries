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
        o.setEmail(request.getParameter("email"));
        o.setPass(request.getParameter("pass"));
        String status=o.validate(o);
        if(status.equalsIgnoreCase("done")){
            session.setAttribute("id",(String)o.getId());
            response.sendRedirect("../home.jsp");
          }
        else if(status.equalsIgnoreCase("notdone")){
            response.sendRedirect("../index.jsp");
          }
        %>
         
    </body>
</html>
