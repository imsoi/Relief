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
    <link rel="stylesheet" type= "text/css" href="/resources/css/index.css">
<title></title>

   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<body>
    <div class="header">
  		<h2 class="logo"><a href = "/" style="text-decoration: none; color: black;">RELIEF</a></h2>
      		<ul class="nav">
           	<li><a href = "/service">릴리프 서비스</a></li>
			<li><a href = "/introduce">릴리프 소개</a></li>
			<li><a href = "/test/list">테스트하기</a></li>
			<li><a href = "/notice/list">공지사항</a></li>
          </ul>
          
         <c:if test="${sessionScope.member != null}">
				<div>
					${sessionScope.member.name} 님 환영합니다 !
				</div>
				<div>
					<a href="/profile">마이페이지</a>
				</div>
				<div>
					<a href="/logout">로그아웃</a>
				</div>
		</c:if>
		
		<c:if test="${sessionScope.member == null}">
			<div>
				<a href="/signup" style="color: black;">회원가입</a>
			</div>
			<div>
				<a href="/login" style="color: black;">로그인</a>
			</div>
		</c:if>
			
	</div>
    <div class="idx1">
        <img src="/resources/images/main_img.jpg" class="img1">
    </div>
    <section id="idx2" class="mx-auto my-5 py-3">
    <div>
        <h2>스마트한 비대면 분석, <span style="color: #ffdd00;">릴리프</span></h2>
        <p style="font-weight:500";>릴리프는 전문적인 검사와 통계를 통해 워케이션 대상자를 선정합니다.<br>
        릴리프는 당신의 모든 일상을 응원합니다.</p>   
    </div>
</section>
<section id="idx3" class="mx-auto my-5 py-4">    

    <span class="prg">
        <h3>기업용 복지 프로그램</h3>
        <p style="font-weight:500";>업무능률도 오르고 생산성도<br>
        높아져 기업과 개인 모두가<br>
        만족하는 프로그램 입니다!</p>
        <button>테스트 하러 가기</button>
        </span>

        <img src="/resources/images/index1.jpg" class="img3">

</section>
<section id="idx4">   
 <div>
        <img src="/resources/images/1.png" class="img4">
        <h2><span style="color: #ffdd00;">릴리프,</span> 무엇이 특별한가요?</h2>
        <p style="font-weight:500";>릴리프만의 서비스</p>
        <img src="/resources/images/index2.png" class="mx-auto my-4 py-3">
    </div>
</section>
<footer class="footer">
    <div class="ft1">
    <p>건강한 기업 성장을 위한 진단도구</p>
    <h1>RELIEF</h1>

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