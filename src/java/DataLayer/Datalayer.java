package DataLayer;

import MyBean.Mybean;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

public class Datalayer {
    
    Connection con;
    Statement st;
    private Connection getConnection()
    {  try{
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con=DriverManager.getConnection("jdbc:mysql:///aman","root","");
                  st = con.createStatement();
          }catch(Exception e){System.out.println("error in getConnection"+e);}
        return con;
    }

    public String  getDataInsert(Mybean ob) {
        String status="null";
        try{
          getConnection();
              String q="select * from user where uname='"+ob.getUname()+"'or email='"+ob.getEmail()+"'";
                                                          // logic gate Or work for both
                  ResultSet rs=st.executeQuery(q);
                  
                  if(rs.next())
                  {
                     System.out.println("username or email exist"); 
                     status="username or email exist";
                  }
                     else{
                  String f="insert into user(uname,email,gender,city,password) values('"+ob.getUname()+"','"+ob.getEmail()+"','"+ob.getGender()+"','"+ob.getCity()+"','"+ob.getPass()+"')";
                  int x=st.executeUpdate(f);
                  if(x>0){System.out.println("data inserted successfully");
                      status="data Inserted";}
                  else{ status="data not Inserted";}
                          }
         }
        catch(Exception e)
        {
            System.out.println("error in getDataInsert"+e);
        }
        return status;
    }

    public String validate(Mybean ob) {
         String status="null";
        try{
          getConnection();
               String q="select * from user where email='"+ob.getEmail()+"' AND password='"+ob.getPass()+"'";
                ResultSet rs=st.executeQuery(q);
                System.out.println(q);
               
                  
                  if(rs.next())
                  { 
                      System.out.println(ob.getType());
                      ob.setId(rs.getString(1));
                      status="done";
                  }
                   else{status="notdone";
                  System.out.println("notDone");}
         }
        catch(Exception e)
        {
            System.out.println("error in Validate"+e);
        }
        return status;
       
    }

    public String getDataId(Mybean ob) {
        String status="null";
        try{
          getConnection();
                String q="select * from user where id='"+ob.getId()+"'";
                ResultSet rs=st.executeQuery(q);
                  
                  if(rs.next())
                  { 
                     ob.setUname(rs.getString(2));
                     ob.setEmail(rs.getString(3));
                     ob.setGender(rs.getString(4));
                     ob.setCity(rs.getString(5));
                     ob.setPass(rs.getString(6));
                     ob.setType(rs.getString(7));
                     status="done";
                  }
                  
         }
        catch(Exception e)
        {
            System.out.println("error in getDataId"+e);
        }
        return status;
    }

    public String updateData(Mybean ob) {
         String status="null";
        try{
          
                  getConnection();
                  System.out.println(ob.getUname());
                  String f="update user set uname='"+ob.getUname()+"',city='"+ob.getCity()+"' where id="+ob.getId();
                  
                  System.out.println(f);
                  int x=st.executeUpdate(f);
                  if(x>0){System.out.println("data Update successfully");
                          status="data Update";
                         }
                  
                          
         }
        catch(Exception e)
        {
            System.out.println("error in updateDataInsert"+e);
        }
        return status;
    
    }

    public String auth(Mybean ob) {
         String status="null";
        try{
               getConnection();
               String q="select * from "+ ob.getTest() +" where id="+ob.getId();
                ResultSet rs=st.executeQuery(q);
                System.out.println(q);
               
                  
                  if(rs.next())
                  { 
                     // System.out.println("your test is submited go for next one");
                     // System.out.println("<tr><td><a href=search3?view=true&sub=Submit><h2>Check Errors</h2></a></td></tr>");
                      
                      status="done";
                  }
                   else{
                      String f = "insert into "+ob.getTest()+"(id,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10) values('"+ob.getId()+"','0','0','0','0','0','0','0','0','0','0')";
                      int up = st.executeUpdate(f);
                      if(up>0){System.out.println("update");}
                      else{System.out.println("notupdate");}
                      
                      status="notdone";
                      }
         }
        catch(Exception e)
        {
            System.out.println("error in auth"+e);
        }
        return status;
    }

    public String viewresult(Mybean ob) {
       String status="null";
        try{
               getConnection();
               ob.link(ob);
               ob.findMaxQues(ob);
               String k="select * from "+ ob.getTest() +" where id="+ob.getId();
               ResultSet rs=st.executeQuery(k);
               System.out.println(k);
                
               int marks[]=new int[ob.getMaxQues()];
                    
                            if(rs.next())
                             {    int x;
                                  for(x=1;x<=ob.getMaxQues();x++) 
                                   { int y=x;
                                     y++;
                                     marks[x-1] = Integer.parseInt(rs.getString(y));
                                   }
                             }
                            String q = "select * from "+ob.getPaper();
                            int score = 0;
                            ResultSet rs2 = st.executeQuery(q);
                            System.out.println("<h1>Incorrect are:-</h1><br>");
                   
                            int countQues=0;String xy="";
                            while (rs2.next()) 
                            {
                                String aman= String.valueOf( marks[countQues]);
                               
                                if (aman.equals(rs2.getString(8))) 
                                {
                                  score++;
                                } 
                                else 
                                {
                                   xy=xy+ "QUES " + rs2.getString(1) + "   " + rs2.getString(6) + "<br>";
                                   xy=xy+"(a)  " + rs2.getString(2) + "<br>";
                                   xy=xy+"(b)  " + rs2.getString(3) + "<br>";
                                   xy=xy+"(c)  " + rs2.getString(4) + "<br>";
                                   xy=xy+"(d)  " + rs2.getString(5) + "<br>";
                                   
                                   int res = Integer.parseInt(aman);

                                   if (res > 0) 
                                   {
                                     res++;
                                     xy=xy+"Your answer is  " + rs2.getString(res);
                                    } // in case of zero
                                   else {
                                         xy=xy+"you not give any answer<br>";
                                        }

                                    int res1 = Integer.parseInt(rs2.getString(8));
                                    res1++;
                                   xy=xy+"<br><hr>Correct answer is " + rs2.getString(res1) + "<br><hr>";
                                 }

                            countQues++;
                            
                            System.out.println(countQues);
                            }
                            
                            
                            ob.setMaxQues(countQues);

                    xy=xy+"<br>your score is " + score + "";
                    ob.setQues(xy);
                    System.out.println(xy);
                  
         }
        catch(Exception e)
        {
            System.out.println("error in View Result"+e);
        }
        return status;
    }

    public String link(Mybean ob) {
        String status="null";
        try{
          getConnection();
                String q="select * from link where Ans='"+ob.getTest()+"'";
                ResultSet rs=st.executeQuery(q);
                  
                  if(rs.next())
                  { 
                     ob.setPaper(rs.getString(2));
                     
                     status="done";
                  }
                  
         }
        catch(Exception e)
        {
            System.out.println("error in link"+e);
        }
        return status;
    }

    public String ans(Mybean ob) {
         String status="null";
        try{
          getConnection();
          System.out.println(ob.getTest());
               String g = "select * from "+ob.getTest()+" where id="+ob.getId();
               System.out.println(g);
               ResultSet rs = st.executeQuery(g);
               if(rs.next())
                 {
                     int ques   = Integer.parseInt(ob.getQues());
                    ob.setAns(Integer.parseInt(rs.getString(ques+1)));
                 }
                  
         }
        catch(Exception e)
        {
            System.out.println("error in ans"+e);
        }
        return status;
    }

    public String serialQues(Mybean ob) {
        String status="null";
        try{
          getConnection();
               String g = "select * from "+ob.getPaper()+" where id=" + ob.getQues();
               ResultSet rs = st.executeQuery(g);
               if(rs.next())
                 {  ob.setQid(rs.getString(1));
                    ob.setQ(rs.getString(6));
                    ob.setOpt1(rs.getString(2));
                    ob.setOpt2(rs.getString(3));
                    ob.setOpt3(rs.getString(4));
                    ob.setOpt4(rs.getString(5));
                 }
                  
         }
        catch(Exception e)
        {
            System.out.println("error in ans"+e);
        }
        return status;
    }

    public String updateAns(Mybean ob) {
         String status="null";
        try{
            System.out.println("aman");
             getConnection();
          String ans=String.valueOf(ob.getAns());
            
            if(ans==null){ans="0";}
            String ques=ob.getQues();
            int max=ob.getMaxQues();
           // String hd="update ques set user='"+ans+"' where id='"+ques+"'";
            String hd="update "+ob.getTest() +" set q"+ques+"='"+ans+"' where id='"+ob.getId()+"'";
            System.out.println(hd);
            int a=st.executeUpdate(hd);
            if(a>0){System.out.println("done");}
            else {System.out.println("notdone");}
             int q=Integer.parseInt(ques);
              int r=max;
              if(ob.getSUBMITSTATUS().equalsIgnoreCase("SUBMIT")||ob.getSUBMITSTATUS().equalsIgnoreCase("MARK"))
              { q++;}        // check status is clear,mark,submit;
            if(r>=q){
                status="movetonext";
                System.out.println(status);
                     ob.setQues(String.valueOf(q));
                }
            else{status="revind";
             System.out.println(status);
            
                }
         
         }
        catch(Exception e)
        {
            System.out.println("error in updateAns"+e);
        }
        return status;
    }

    public ArrayList getTestQuesValue(Mybean ob) {
        ArrayList alist=new ArrayList();
        int ans;
        try{ 
            getConnection();
            ob.link(ob);
            ob.findMaxQues(ob);
            System.out.println(ob.getMaxQues());
        String h="select * from "+ob.getTest()+" where id="+ob.getId();
        System.out.println(h);
        ResultSet rs=st.executeQuery(h);
       // ResultSetMetaData rsmd=rs.getMetaData();
       // System.out.println(rsmd.getColumnCount());
       // int y=rsmd.getColumnCount();
        if(rs.next()){
       // for(int i=2;i<y;i++)
            for(int i=2;i<=ob.getMaxQues()+1;i++)
        {
            ans=Integer.parseInt(rs.getString(i));
            System.out.println(ans);
            alist.add(ans);
            }
        }
        }catch(Exception e){System.out.println("error in getTestQuesValue"+e);}
        return alist;
    }

    public String findMaxQues(Mybean ob) {
         String status="null";
        try{
               getConnection();
               String q = "select * from "+ob.getPaper();
               ResultSet rs2 = st.executeQuery(q);
               int countQues=0;
                            while (rs2.next()) 
                            {
                               countQues++;
                            System.out.println(countQues);
                            }
                           ob.setMaxQues(countQues);
      
             }
        catch(Exception e)
        {
            System.out.println("error in findMaxQues"+e);
        }
        return status;
    }

    public String updatePass(Mybean ob) {
        String status="null";
        try{
          
                  getConnection();
                  System.out.println(ob.getPass());
                  String check=ob.getPass();
                  String sd="select * from user where id="+ob.getId();
                  
                  System.out.println(sd);
                  ResultSet rs=st.executeQuery(sd);
                  if(rs.next())
                  {
                          System.out.println(rs.getString(6));
                          String old=rs.getString(6);
                          if(check.equalsIgnoreCase(old))
                          {
                          
                          String f="update user set password='"+ob.getNewpass()+"' where id="+ob.getId();
                          System.out.println(f);
                          int x=st.executeUpdate(f);
                          if(x>0){System.out.println("PassWord Update successfully");
                                  status="Password Update";
                                 }
                          else{status="Password NotUpdate";}
                          
                           }
                          else {status="OldPassword not matchs";}
                   }
                  
                          
         }
        catch(Exception e)
        {
            System.out.println("error in updateDataInsert"+e);
        }
        return status;
    
        
        }
    
}
