<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
         <form action="process/validate.jsp">
               <table border=2 align=center>
                    <tr>
                        <td>TYPE</td>
                        <td><select name=type>
                            <option>Select Type</option>
                            <option>Admin</option>
                            <option>Student</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Email Id</td>
                        <td><input type=text name=email></td>
                        
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type=password name=pass></td>
                    </tr>
                   
                    <tr>
                        <td>
                            <input type=submit name=sub value=LOGIN></td>
                        <td>
                        <a href=Signup.jsp>Sign up</a></td>
                    </tr>
                    </table></form>
    </body>
</html>
