package kr.ac.kopo.relief.model;

public class Member {
   private String id;
   private String passwd;
   private String name;
   private String cname;
   private String dept;
   private String rank;
   private String tel;
   private char grade;

   public String getCname() {
      return cname;
   }

   public void setCname(String cname) {
      this.cname = cname;
   }

   public char getGrade() {
      return grade;
   }

   public void setGrade(char grade) {
      this.grade = grade;
   }

   public String getDept() {
      return dept;
   }

   public void setDept(String dept) {
      this.dept = dept;
   }

   public String getRank() {
      return rank;
   }

   public void setRank(String rank) {
      this.rank = rank;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPasswd() {
      return passwd;
   }

   public void setPasswd(String passwd) {
      this.passwd = passwd;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getTel() {
      return tel;
   }

   public void setTel(String tel) {
      this.tel = tel;
   }

}