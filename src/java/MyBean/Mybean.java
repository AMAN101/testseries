
package MyBean;

import java.util.ArrayList;

public class Mybean {
    
    DataLayer.Datalayer mb=new DataLayer.Datalayer();
    private String uname,email,type,pass,id,gender,city,test,paper,ques,q,qid,opt1,opt2,opt3,opt4,newpass,SUBMITSTATUS;

    public String getSUBMITSTATUS() {
        return SUBMITSTATUS;
    }

    public void setSUBMITSTATUS(String SUBMITSTATUS) {
        this.SUBMITSTATUS = SUBMITSTATUS;
    }

    public String getNewpass() {
        return newpass;
    }

    public void setNewpass(String newpass) {
        this.newpass = newpass;
    }
    private int maxQues,ans;

    public int getAns() {
        return ans;
    }

    public void setAns(int ans) {
        this.ans = ans;
    }

    public int getMaxQues() {
        return maxQues;
    }

    public void setMaxQues(int maxQues) {
        this.maxQues = maxQues;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
    }

    public String getPaper() {
        return paper;
    }

    public void setPaper(String paper) {
        this.paper = paper;
    }

   

    public String getQues() {
        return ques;
    }

    public void setQues(String ques) {
        this.ques = ques;
    }


    public String getQ() {
        return q;
    }

    public void setQ(String q) {
        this.q = q;
    }

    public String getQid() {
        return qid;
    }

    public void setQid(String qid) {
        this.qid = qid;
    }

    public String getOpt1() {
        return opt1;
    }

    public void setOpt1(String opt1) {
        this.opt1 = opt1;
    }

    public String getOpt2() {
        return opt2;
    }

    public void setOpt2(String opt2) {
        this.opt2 = opt2;
    }

    public String getOpt3() {
        return opt3;
    }

    public void setOpt3(String opt3) {
        this.opt3 = opt3;
    }

    public String getOpt4() {
        return opt4;
    }

    public void setOpt4(String opt4) {
        this.opt4 = opt4;
    }
    public String insertData(Mybean ob )
    {
        String a=mb.getDataInsert(ob);
        return a;
    }
    public String validate(Mybean ob)
    {
        String a=mb.validate(ob);
        return a;
    
    }
    public String getDataId(Mybean ob)
    {
    
         String a=mb.getDataId(ob);
          return a;
    }
    public String updateData(Mybean ob)
    {
    
     String a=mb.updateData(ob);
          return a;
    
    }
    
    public String updatePass(Mybean ob)
    {
    
     String a=mb.updatePass(ob);
          return a;
    
    }
    public String auth(Mybean ob)
    {
       String a=mb.auth(ob);
          return a;
    
    }
    public String viewresult(Mybean ob) 
    {
         String a=mb.viewresult(ob);
          return a;
    
    
    }
    public String link(Mybean ob)
    {
       String a=mb.link(ob);
          return a;
    }
    public String ans(Mybean ob)
    {
        String a=mb.ans(ob);
          return a;
    }
     public String serialQues(Mybean ob)
     {
        String a=mb.serialQues(ob);
          return a;
     
     }
     public String updateAns(Mybean ob)
     {
         String a=mb.updateAns(ob);
          return a;
     
     }
     public ArrayList getTestQuesValue(Mybean ob)
     {
     ArrayList a=mb.getTestQuesValue(ob);
     return a;
     
     }
     public String findMaxQues(Mybean ob)
     {
         String a=mb.findMaxQues(ob);
          return a;
     
     }
    
}
