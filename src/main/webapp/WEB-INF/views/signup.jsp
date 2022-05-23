<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script>
   function check_id_Sync(){
      const form = document.getElementById("signup_form");
      
      const xhr = new XMLHttpRequest();
      //10%의  구역을 최신화 하고 싶을때 전체가 아닌 10%만 최신화를 할 수 있게 하는것 xhr
      xhr.open("GET","checkId?id=" + form.id.value,false);//동기적으로 호출(컨트롤러에 OK or FAIL이 출력될때가지 대기)
      
      xhr.send();
      
      const result = xhr.responseText;
      
      if(result == "OK"){
         alert(`사용가능한 아이디입니다.`);
         form.checkId.value = form.id.value;
      }
      else
         alert(`이미 사용중인 아이디입니다.`);
   }
   //jsp안에 넣어서 el처리 됨 그치만
   
   function check_id_Async() {
      const form = document.getElementById("signup_form");
      const xhr = new XMLHttpRequest();
      
   // 200 OK 300 redirect 400 서버에 해당하는 리소스가 없다 500 server internel 에러(서버 인터넬 에러 거의 코드 에러)   
      xhr.onreadystatechange = function() {
         console.log(xhr.readyState);
         
         if(xhr.readyState == XMLHttpRequest.DONE){
            if(xhr.status == 200) {
               const result = xhr.responseText;
               
               if(result == "OK")
                  alert(`사용가능한 아이디입니다.`);
                  form.checkId.value = form.id.value;
                  
               }
               else
                  alert(`이미 사용중인 아이디입니다.`);
            }
         
      }
      xhr.open("GET",`checkId?id=\${form.id.value}`,true);
      
      xhr.send();
   }
   function signup(){
      const form = document.getElementById("signup_form");
      const regx = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
      
      if(form.checkId.value != form.id.value){
         alert("아이디 중복 검사를 해 주세요");
         return;
      }
      
      
      if(form.id.value == ""){
         alert("아이디를 입력 해 주세요");
         form.id.focus();
         return;
      }
      
      if(form.passwd.value == ""){
         alert("비밀번호를 입력 해 주세요");
         form.passwd.focus();
         return;
      }
      
      if(form.passwd_confirm.value == ""){
         alert("비밀번호 확인을 입력 해 주세요");
         form.passwd_confirm.focus();
         return;
      }
      
      if(!regx.test(form.passwd.value)){
         alert("비밀번호 형식을 확인 해 주세요");
         form.passwd.focus();
         return;
      }
      
      if(form.passwd.value != form.passwd_confirm.value){
         alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
         form.passwd.value = "";
         form.passwd_confirm.value ="";
         form.passwd.focus();
         return;
      }
      
      if(form.name.value == ""){
         alert("이름을 입력 해 주세요");
         form.name.focus();
         return;
      }
      
      if(form.cname.value == ""){
         alert("회사명을 입력 해 주세요");
         form.cname.focus();
         return;
      }
      
      if(form.dept.value == ""){
         alert("부서를 입력 해 주세요");
         form.dept.focus();
         return;
      }
      
      if(form.rank.value == ""){
         alert("직급을 입력 해 주세요");
         form.rank.focus();
         return;
      }
      
      if(form.tel.value == ""){
         alert("전화번호 입력 해 주세요");
         form.tel.focus();
         return;
      }
      
      if(form.grade.value == ""){
         alert("등급을 입력 해 주세요");
         form.grade.focus();
         return;
      }
      
      alert("회원가입이 완료되었습니다");
      form.submit();
   }
</script>
</head>
<body>
   <div class="container">
      <h1>SIGNUP</h1>
      <form id="signup_form"  method="post">
         <input type="hidden" name="checkId">
         <div>
            <label>아이디: </label><!-- 용어는 통일해야한다 ex)아이디 != 회원번호 둘다 같아야함 -->
            <input type="text" name="id"><button type="button" onclick="check_id_Async()">중복확인</button>
         </div>
         <div>
            <label>비밀번호:</label>
            <input type="password" name="passwd">
            <span>(특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호)</span>
         </div>
         <div>
            <label>비밀번호 확인:</label>
            <input type="password" name="passwd_confirm">
         </div>
         <div>
            <label>이름:</label>
            <input type="text" name="name">
         </div>
         <div>
            <label>회사명:</label>
            <input type="text" name="cname">
         </div>
         <div>
            <label>부서:</label>
            <input type="text" name="dept">
         </div>
         <div>
            <label>직급:</label>
            <input type="text" name="rank">
         </div>
         <div>
            <label>전화번호:</label>
            <input type="text" name="tel">
         </div>
         <div>
            <label>등급:</label>
            <select name="grade">
               <option value="0">사원</option>
               <option value="1">회사 관리자</option>
            </select>
         </div>
         <div>
            <button type="button" onclick="signup()">회원가입</button>
         </div>
      </form>
   </div>
</body>
</html>