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
        int x;
        o.setId((String)session.getAttribute("id"));
        o.setTest(request.getParameter("test"));
        String ans=request.getParameter("ans");
        if(ans==null){x=0;}
        else { x=Integer.parseInt(request.getParameter("ans")); }
        
        String sub=request.getParameter("sub");
        String SUBMITstatus="SUBMIT";
        if(sub.equalsIgnoreCase("clear")){x=0;SUBMITstatus="CLEAR";}
        if(sub.equalsIgnoreCase("REVIEW$Next")){x=-1;SUBMITstatus="MARK";}
        o.setSUBMITSTATUS(SUBMITstatus);
        o.setAns(x);
        int y=Integer.parseInt(request.getParameter("max"));
        o.setMaxQues(y);
        o.setQues(request.getParameter("ques"));
        System.out.println(o.getId());
        System.out.println(o.getTest());
        System.out.println(o.getAns());
        System.out.println(o.getMaxQues());
        String status=o.updateAns(o);
        System.out.println(status);
        System.out.println("../TEST.jsp?ques="+o.getQues()+"&sub=Submit&test="+o.getTest());
        if(status=="movetonext"){response.sendRedirect("../TEST.jsp?ques="+o.getQues()+"&sub=Submit&test="+o.getTest());}
        else if(status=="revind"){response.sendRedirect("../TEST.jsp?ques="+1+"&sub=Submit&test="+o.getTest());
               }
        
        %>
    </body>
</html>
