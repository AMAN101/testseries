<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUp</title>
    </head>
    <body>
        <form  action="process/insertProcess.jsp">
            <table border="2" align="center">
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="uname"/></td>
                </tr>
                <tr>
                    <td>email</td>
                     <td><input type="text" name="email"/></td>
                </tr>
                <tr>
                    <td>gender</td>
                    <td><input type="radio" name="gender" value="male"/>Male
                        <input type="radio" name="gender" value="female"/>Female</td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="pass"/></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><select name="city">
                    <option>select region</option>
                    <option>Delhi</option>
                    <option>Chandigarh</option>
                    </select></td>
                </tr>
                 <tr>
                    <td><input type="submit" name="sub" value="SignUp"/></td>
                </tr>
                
                
            </table>
        </form>
        <% 
         if(session.getAttribute("InsertStatus")!=null)
                         {
               String res=(String)session.getAttribute("InsertStatus");
               out.println("<center><span style=color:red>"+res+"</span><center>");
         }
        %>
        
    </body>
</html>

