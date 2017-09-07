<%@page import="MyBean.Mybean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% Mybean o=new Mybean();
        String id=(String)session.getAttribute("id");
        if(id!=null){
                          
                          o.setId(id);
                          o.getDataId(o);
                    }
        %>
        <form action="process/update.jsp">
            <table>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="uname" value="<%= o.getUname() %>" /></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><input type="text" name="city" value="<%= o.getCity() %>" /></td>
                </tr>
                <tr>
                    <td><input type="submit" name="sub" value="Update" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
