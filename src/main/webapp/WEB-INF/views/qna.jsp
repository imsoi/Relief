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
    <link rel="stylesheet" type= "text/css" href="/resources/css/qna.css">
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
    Kakao.init('db6246dac717964fcbdf3f0124fdbfc6');
    Kakao.isInitialized();
    </script>
    
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
     <div class="mmain">
    <div class="container">
    
    <section id = "main">
    
        <div>
        <h3 style="font-weight: bold; font-size:40px; font-family: 'Jua', sans-serif; background:linear-gradient(to top, #ffe400 50%, transparent 40%); width:360px;margin-left: 465px;">스트레스 지수 테스트</h3>
        <h4 class="mx-auto mt-5 px-3" style = "font-family: 'Jua', sans-serif; ">나의 심리 상태 평가하기</h4>
        <p class="mx-auto mt-5 px-3" style = "font-family: 'Jua', sans-serif; font-weight: 400;">오늘의 기분은 어떤가요? 나의 심리상태를 평가해주세요.</p>
      <div class="col-lg-6 col-md-8 col-sm-10 col-12 mx-auto">

      </div>
        
        <button type="button" class="btn1 mx-auto" onclick="js:begin()">START!</button>
    </div>
    </section>

    <section id="qna"> 
    <div class="mx-auto py-3">
        <div class="status mx-auto mt-5">
            <div class="statusBar">

            </div>
        </div>
        <div class="qBox my-5 py-3 mx-auto">
  
        </div>
        <div class="answerBox my-5 py-3">

        </div>
     </div>   
    </section>
    <section id="result" class="mx-auto my-5 py-5 px-3">
      <h2 style="font-weight: 500; font-family: 'Jua', sans-serif; font-size: 40px;background:linear-gradient(to top, #ffe400 50%, transparent 40%); width:380px; margin-left: 445px;">당신의 스트레스 결과는?</h2>
      <div class="resultname" style="font-weight: 500; font-family: 'Jua', sans-serif;">

      </div>
      <div id="resultImg" class="my-3 col-lg-6 col-md-8 col-sm-10 col-12 mx-auto">

      </div>
      <div class="resultDesc" style="font-weight: 500; font-family: 'Jua', sans-serif;">

      </div>
        <button type="button" class="kakao my-5 py-2 px-3"  onclick="js:kakaoShare()">공유하기</button>
    </section>
</div>

</div>
<script src="/resources/js/data.js" charset="utf-8"></script>
<script src="/resources/js/start.js" charset="utf-8"></script>
<script src="/resources/js/share.js" charset="utf-8"></script>
</body>
</html>