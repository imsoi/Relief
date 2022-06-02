<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
   rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Fredoka:wght@600&display=swap"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap"
   rel="stylesheet">
<link rel="stylesheet" type="text/css"
   href="/resources/css/signup copy.css">
<title></title>
<script>
   function check_id_Sync() {
      const form = document.getElementById("signup_form");

      const xhr = new XMLHttpRequest();
      //10%의  구역을 최산화 하고 싶을때 전체가아닌 10%만 최신화를 할 수 있게 하는것 xhr
      xhr.open("GET", "checkId?id=" + form.id.value, false);//동기적으로 호출(컨트롤러에 OK or FAIL이 출력될때가지 대기)

      xhr.send();

      const result = xhr.responseText;

      if (result == "OK") {
         alert(`[동기] \${form.id.value}는 사용가능한 아이디입니다.`);
         form.checkId.value = form.id.value;
      } else
         alert(`[동기] \${form.id.value}는 이미 사용중인 아이디입니다.`);
   }
   //jsp안에 넣어서 el처리 됨 그치만

   function check_id_Async() {
      const form = document.getElementById("signup_form");
      const xhr = new XMLHttpRequest();

      // 200 OK 300 redirect 400 서버에 해당하는 리소스가 없다 500 server internel 에러(서버 인터넬 에러 거의 코드 에러)   
      xhr.onreadystatechange = function() {
         console.log(xhr.readyState);

         if (xhr.readyState == XMLHttpRequest.DONE) {
            if (xhr.status == 200) {
               const result = xhr.responseText;

               if (result == "OK") {
                  alert(`사용가능한 아이디입니다.`);
                  form.checkId.value = form.id.value;

               } else
                  alert(`이미 사용중인 아이디입니다.`);
            }
         }
      }
      xhr.open("GET", `checkId?id=\${form.id.value}`, true);

      xhr.send();
   }
   function signup() {
      const form = document.getElementById("signup_form");
      const regx = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
      const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

      if (form.checkId.value != form.id.value) {
         alert("아이디 중복 검사를 해 주세요");
         return;
      }

      if (form.id.value == "") {
         alert("아이디를 입력 해 주세요");
         form.id.focus();
         return;
      }

      if (form.passwd.value == "") {
         alert("비밀번호를 입력 해 주세요");
         form.passwd.focus();
         return;
      }

      if (form.passwd_confirm.value == "") {
         alert("비밀번호 확인을 입력 해 주세요");
         form.passwd_confirm.focus();
         return;
      }

      if (!regx.test(form.passwd.value)) {
         alert("비밀번호 형식을 확인 해 주세요");
         form.passwd.focus();
         return;
      }

      if (form.passwd.value != form.passwd_confirm.value) {
         alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
         form.passwd.value = "";
         form.passwd_confirm.value = "";
         form.passwd.focus();
         return;
      }

      if (form.name.value == "") {
         alert("이름을 입력 해 주세요");
         form.name.focus();
         return;
      }

      if (form.cname.value == "") {
         alert("회사명을 입력 해 주세요");
         form.cname.focus();
         return;
      }

      if (form.dept.value == "") {
         alert("부서를 입력 해 주세요");
         form.dept.focus();
         return;
      }

      if (form.rank.value == "") {
         alert("직급을 입력 해 주세요");
         form.rank.focus();
         return;
      }

      if (form.tel.value == "") {
         alert("전화번호 입력 해 주세요");
         form.tel.focus();
         return;
      }
      if(!regPhone.test(form.tel.value)){
            alert("전화번호 형식을 확인 해주세요");
            form.tel.focus();
            return;
         }

      if (form.grade.value == "") {
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

   <div class="header">
      <h2 class="logo">
         <a href="/" style="color: #4c4c4c;">RELIEF</a>
      </h2>
   </div>
   <section>
      <hr style="border: solid 1px rgb(187, 187, 187);">
      <h1>회원가입</h1>
      <h3 style="margin-top: 50px">
         계정으로 사용할 아이디와<br>비밀번호를 입력하세요
      </h3>
   </section>

   <div class="container">
      <form method="post" id="signup_form">
         <input type="hidden" name="checkId">
         
         <div class="mb-3 mx-auto" style="width: 25%;">
            <label>아이디</label> 
            <input class="form-control" name="id" type="text" placeholder="아이디를 입력하세요" style="border: 1px solid black;">
            <button type="button" class="btn1" onclick="check_id_Async()">중복확인</button>
         </div>
         <div class="mb-3 mx-auto" style="width: 25%;">
            <label>비밀번호</label>
             <input class="form-control"  type="password" name="passwd"  placeholder="문자/숫자/특수문자 포함 8~15자" style="border: 1px solid black;"> 
         </div>
         <div class="mb-3 mx-auto" style="width: 25%;">
            <label>비밀번호 재확인</label> 
            <input class="form-control"  type="password" name="passwd_confirm" placeholder="비밀번호를 다시 입력해주세요" style="border: 1px solid black;">
         </div>
         <div class="mb-3 mx-auto" style="width: 25%;">
            <label>이름</label> 
            <input class="form-control"  type="text" name="name" placeholder="이름을 입력해주세요" style="border: 1px solid black;">
         </div>
         <div class="mb-3 mx-auto" style="width: 25%;">
            <label>회사명</label> 
            <input class="form-control"  type="text" name="cname" placeholder="회사를 입력하세요" style="border: 1px solid black;">
         </div>
         <div class="mb-3 mx-auto" style="width: 25%;">
            <label>부서</label> 
            <input class="form-control"  type="text" name="dept" placeholder="부서를 입력하세요" style="border: 1px solid black;">
         </div>
         <div class="mb-3 mx-auto" style="width: 25%;">
            <label>직급</label> 
            <input class="form-control"  type="text" name="rank" placeholder="직급 입력하세요" style="border: 1px solid black;">
         </div>
         <div class="mb-3 mx-auto" style="width: 25%;">
            <label>전화번호</label> 
            <input class="form-control"  type="text" name="tel" placeholder="예) 010-1234-5678" style="border: 1px solid black;">
         </div>
         <div class="mb-3 mx-auto" style="width: 25%;">
            <label>등급</label> 
            <select name="grade" class="form-select" aria-label="Default select example" style="border: 1px solid black;">
               <option value="0">사원</option>
               <option value="1">회사 관리자</option>
            </select>
         </div>
         <div>
            <button type="button" class="btn2" onclick="signup()">가입하기</button>
         </div>
      </form>
   </div>

   <footer class="footer">
      <div class="ft1">
         <p>건강한 기업 성장을 위한 진단도구</p>
         <h1 style="font-family: 'Fredoka', sans-serif;">RELIEF</h1>

      </div>
      <div class="ft2">
         <nav class="na">
            <h5 style="font-weight: 600;">릴리프</h5>
            <a href="#">회사 소개 |</a> <a href="#">서비스 소개 |</a> <a href="#">테스트
               |</a> <a href="#">공지사항</a>
         </nav>
         <p style="font-size: 14px; font-weight: 200;">
            사업자등록번호: 184-98-12021 <br> 주소 : 34503 서울특별시 용산구 한남동 123
         </p>
         <p
            style="color: rgb(180, 180, 180); font-size: 12px; margin-left: 970px;">©
            2022 RELIEF All right reserved.</p>
      </div>
   </footer>
</body>
</html>

</body>
</html>