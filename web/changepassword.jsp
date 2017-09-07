<%-- 
    Document   : changepassword
    Created on : Oct 5, 2016, 2:27:09 PM
    Author     : AMAN MITTAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
       <%  String id=(String)session.getAttribute("id");
        if(id!=null){ %>
        <form action="process/updatepass.jsp">
            <table>
                <tr>
                    <td>OLD PASSWORD</td>
                    <td><input type="text" name="old" /></td>
                </tr>
                <tr>
                    <td>NEW PASSWORD</td>
                    <td><input type="text" name="new" /></td>
                </tr>
                <tr>
                    <td><input type="submit" name="sub" value="Update" /></td>
                    <td><a href="home.jsp">HOME</a></td>
                </tr>
              <% } String status=(String)session.getAttribute("Status");
                     if(status!=null){
                  out.println(status);}
              %>
            </table>
        </form>
    </body>
</html>
