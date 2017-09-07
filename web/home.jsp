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
                    
        %>
        
        <h1>Welcome <%=o.getUname()%></h1> 
        
        <table>
                    <tr>
                        <td><a href="edit.jsp">Edit Profile</a></td>
                        <td><a href="changepassword.jsp">Change Pass</a></td>
                        
                    </tr>
        </table>
        <form action="testauth.jsp">
        <table align="center">
                    
                    
                    <tr>
                        <td>TEST</td>
                        <td><select name=test>
                            <option>test1ans</option>
                            <option>test2ans</option>
                            </select>
                        </td>
                        <td><input type="submit" value="Submit" /></td>
                    </tr>
                    
        </table>
        </form>
    </body>
</html>
                 <%
                               }
               else{
               
               response.sendRedirect("http://localhost:8080/testseries/index.jsp");
               
               }


%>