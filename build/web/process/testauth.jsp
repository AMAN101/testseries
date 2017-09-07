<%@page import="MyBean.Mybean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            <table>
         <% 
        session.setAttribute("test",(request.getParameter("test")));
        Mybean o=new Mybean();
        o.setTest(request.getParameter("test"));
        o.setId((String)session.getAttribute("id"));
        o.link(o);
        o.findMaxQues(o);
        String status=o.auth(o);
        if(status.equals("done"))
                       {
                         out.println("your test is submited go for next one");
                         out.println("<tr><td><a href=view.jsp?view=true&sub=Submit><h2>Check Errors</h2></a></td></tr>");
                        }
               else if(status.equals("notdone"))
                                     {
               
                out.println("<tr><td>Read the instruction carefully"
                        + "<br>Student can't leave paper during exam time"
                        + "<br>Blue colour on question means you not select answer"
                        + "<br>Red colour means you select answer"
                        + "<br>Each ques carry 1 marks"
                        + "<br>there will be no Negative"
                        + "<br> total ques are " + o.getMaxQues() + "</td></tr>");
                out.println("<tr><td><a href=TEST.jsp?ques=1&sub=Submit>Start Test</a></td></tr>");
               
               }
         %>
        
            </table>
        </form>
    </body>
</html>
