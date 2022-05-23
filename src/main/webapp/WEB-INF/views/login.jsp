<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" type= "text/css" href="/resources/css/login.css">
<title></title>

<script>
	function submit() {
		const data = {
				id : $("input [name='id']").val(),
				passwd : $("input [name='passwd']").val()
		}
		
		if(data.id == "") {
			alert("아이디를 입력해주세요")
			return;
		}
		
		if(data.passwd == "") {
			alert("비밀번호를 입력해주세요")
			return;
		}
		
		$("#login_form").submit();
	}
</script>

</head>
<body>
    <div class="header">
        <h2 class="logo"><a href = "/" style="color: #4c4c4c;">RELIEF</a></h2>
     </div>
	<section>
        <hr style="border: solid 1px rgb(187, 187, 187);">
        <h1>로그인</h1>
        <h3 style="margin-top:50px">아이디와<br>비밀번호를 입력하세요</h3>
    </section>
		<form method="post">
		<div class="mb-3 mx-auto my-5 py-1" style="width:17%;">
         <label>아이디</label>
         <input class="form-control" name="id" type="text" class="form-control" placeholder="아이디를 입력하세요" style=" border: 1px solid black;">
		 </div>
		 <div class="mb-3 mx-auto" style="width:17%;">
                    <label>비밀번호</label>
                    <input class="form-control" name="passwd" type="password" class="form-control" placeholder="문자/숫자/특수문사 포함 8~15자" style=" border: 1px solid black;">
		  </div>
		 
		  <c:if test="${msg != null}">
		  	<p id="msg">${msg}</p>
		  </c:if>
		  
		  <button onclick="submit()" class="btn1">로그인</button>
		</form>
	

        <footer class="footer">
            <div class="ft1">
            <p>건강한 기업 성장을 위한 진단도구</p>
            <h1 style = "font-family: 'Fredoka', sans-serif;">RELIEF</h1>
        
        </div>
        <div class="ft2">
            <nav class="na">
                <h5 style="font-weight: 600;">릴리프</h5>
                <a href="#">회사 소개 |</a>
                <a href="#">서비스 소개 |</a>
                <a href="#">테스트 |</a>
                <a href="#">공지사항</a>
            </nav>
            <p style="font-size: 14px; font-weight: 200;">사업자등록번호: 184-98-12021 <br>
            주소 : 34503 서울특별시 용산구 한남동 123</p>
            <p style="color: rgb(180, 180, 180); font-size: 12px; margin-left: 970px;">© 2022 RELIEF All right reserved.</p>
        </div>
        </footer>
        </body>
        </html>