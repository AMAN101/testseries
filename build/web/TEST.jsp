<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
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
        <table border=2 align=right>     
            <tr><td>Question</td></tr><tr>
                
        <%  //bgcolor=green in table tag;
            Mybean o=new Mybean();
            o.setId((String)session.getAttribute("id"));
            o.setTest(request.getParameter("test"));
            ArrayList alist=o.getTestQuesValue(o);
            Iterator itr=alist.iterator();
            String td;
            int x=1;
            while(itr.hasNext())
                {   td="td";
                   int ans=(Integer)itr.next();
                   if (ans > 0) {
                        td = "td bgcolor=red";
                                }
                   if (ans < 0) {
                        td = "td bgcolor=blue";
                                }
                   out.println("<" + td + "><a href=TEST.jsp?ques=" + x + "&sub=Submit&test="+o.getTest()+">"
                                + "" + x + "</a></td></tr>");
            
            
                    x++;
                 }
        
                 out.println("</table></form>");
    
    %>
            
            <%
            o.link(o);
            o.setQues(request.getParameter("ques"));
            int res=0;
            o.ans(o);
            res=o.getAns();
            out.println("<form action=process/updateAns.jsp>"
                        + "<table>"
                        + "<tr>");
            o.serialQues(o);
                    String str1 = "input type=radio name=ans value=1";
                    String str2 = "input type=radio name=ans value=2";
                    String str3 = "input type=radio name=ans value=3";
                    String str4 = "input type=radio name=ans value=4";
                    String str5 = " checked";
                   
                    
                    if (res == 1) {
                        str1 = str1 + str5;
                    }
                    if (res == 2) {
                        str2 = str2 + str5;
                    }
                    if (res == 3) {
                        str3 = str3 + str5;
                    }
                    if (res == 4) {
                        str4 = str4 + str5;
                    }


                    out.println("<td>Ques"+o.getQid()+"</td><td>" + o.getQ() + "</td></tr>");
                    out.println("<tr><td>(a)</td><td>" + o.getOpt1() + "</td>");
                    out.println("<tr><td>(b)</td><td>" + o.getOpt2() + "</td>");
                    out.println("<tr><td>(c)</td><td>" + o.getOpt3() + "</td>");
                    out.println("<tr><td>(d)</td><td>" + o.getOpt4() + "</td>");
                    out.println("<tr><td>Answer</td><td>");
                    out.println("<" + str1 + ">a");
                    out.println("<" + str2 + ">b");
                    out.println("<" + str3 + ">c");
                    out.println("<" + str4 + ">d");
                    out.println("<input type=hidden name=ques value=" + o.getQid() + ">");
                    out.println("<input type=hidden name=test value=" + o.getTest() + ">");

                    out.println("<input type=hidden name=max value=" + o.getMaxQues() + ">");
                    out.println("</td></tr><tr><td><input type=submit name=sub></td><td><input type=submit name=sub value=clear><input type=submit name=sub value=REVIEW$Next></td>");
                    out.println("<tr><td></td><td></td><td><a href=view.jsp?view=true&sub=Submit&test="+o.getTest()+"><h2>SUBMIT PAPER</h2></a></td></tr>"
                            + "</table>"
                            + "</form>"
                            + "</head>"
                            + "</html>");
                
                 
    
%>
    </body>
</html>