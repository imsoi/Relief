<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" type= "text/css" href="/resources/css/service.css">
<title></title>
</head>
<body>
    <div class="header">
        <h2 class="logo"><a href = "/" style="color: #4c4c4c;">RELIEF</a></h2>
           <ul class="nav">
             <li><a href = "/service">릴리프 서비스</a></li>
             <li><a href = "/introduce">릴리프 소개</a></li>
              <li><a href = "/qna">테스트하기</a></li>
              <li><a href = "/notice/list">공지사항</a></li>
              
              <c:if test="${sessionScope.member != null}">
	            <div style="margin-left:350px;">
	               ${sessionScope.member.name}님 환영합니다 !
	            </div>
	            <div>
	               <a href="/stats" >마이페이지</a>
	            </div>
	            <div>
	               <a href="/logout" style="color: black;">로그아웃</a>
	            </div>
	         </c:if>
	         
	         <c:if test="${sessionScope.member == null}">
	            <div style="margin-left: 520px;">
	               <a href="/signup" style="color: black;">회원가입</a>
	            </div>
	            <div style="padding-left: 50px">
	               <a href="/login" style="color: black;">로그인</a>
	            </div>
	         </c:if>
	         
           </ul>
     </div>
     
     <div>
        <div class="about">
            <h2>RELIEF SERVICE</h2><br>
            <p>우리는 하루 중 가장 많은 시간을 일을 하며 보냅니다. <br>
                직원들 마음 관리도 필요한 지금! 서비스를 신청하세요.<br>
                릴리프에서 <b style="font-size: 18px; text-decoration: underline;">워케이션 적합자</b>를 찾아드립니다.</p>
        </div>
    </div>

    <div class="text">
        <h3>릴리프 서비스, 무엇을 제공하나요?</h3><br>
        <p>기업에서 업무 시작전 “체조”를 실시해서 안전 사고 예방을 하는 것처럼<br>
            업무 시작 전 “간단한 설문”을 통해 스트레스 지수를 측정합니다.<br>
            그 후 통계를 내어 임계치를 넘은 직원을 워케이션 대상자로 선정하여 .<br>
            회사의 방침에 따라 <mark style="background-color: #fbe352;">워케이션 서비스</mark>를 제공합니다.</p>
    </div>

    <div class="text">
        <h3>릴리프의 프로세스</h3><br>
        <div>
            <img src="/resources/images/process.png" >
        </div>
    </div>

    <div class="text" ><br>
        <img src="/resources/images/check.png" >
        <div style="margin-top: 50px;">
            <h3>조직의 건강과 성공을 위한<br>
                최선의 솔루션 - 워케이션</h3>
                <br><br>
            <p>직장 내 스트레스로 인한 <mark style="background-color: #fbe352;">업무 생산성 저하와 조직 이탈을 케어</mark>합니다.</p>
            <br><br>
        </div>
        <div style="margin-bottom: 100px;">
            <img src="/resources/images/graph.png" >
        </div>
    </div>

<footer class="footer">
    <div class="ft1">
    <p>건강한 기업 성장을 위한 진단도구</p>
    <h1>RELIEF</h1>

</div>
<div class="ft2">
    <nav class="na">
        <h5 style="font-weight: 600;">릴리프</h5>
        <a href="/introduce">회사 소개 |</a>
        <a href="/service">서비스 소개 |</a>
        <a href="/qna">테스트 |</a>
        <a href="/notice/list">공지사항</a>
    </nav>
    <p style="font-size: 14px; font-weight: 200;">사업자등록번호: 184-98-12021 <br>
    주소 : 34503 서울특별시 용산구 한남동 123</p>
    <p style="color: rgb(180, 180, 180); font-size: 12px; margin-left: 970px;">© 2022 RELIEF All right reserved.</p>
</div>
</footer>
</body>
</html>