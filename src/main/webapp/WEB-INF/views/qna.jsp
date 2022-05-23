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
    
</head>
<body>
    <div class="header">
        <h2 class="logo"><a href = "/" style="color: #4c4c4c;">RELIEF</a></h2>
           <ul class="nav">
              <li><a href = "/serviceindex">릴리프 서비스</a></li>
              <li><a href = "/introduceindex">릴리프 소개</a></li>
              <li><a href = "/test/list">테스트하기</a></li>
              <li><a href = "/notice/list">공지사항</a></li>
              <li style="margin-left: 520px"><a href="/login">로그인</a></li>
              <li><a href="/signup">회원가입</a></li>
           </ul>
     </div>
     <div class="mmain">
    <div class="container">
    <section id = "main" class="mx-auto mt-5 py-5 px-3">
        <div>
        <h3>스트레스 지수 테스트</h3>
        <h4>나의 심리 상태 평가하기</h4>
        <p>오늘의 기분은 어떤가요? 나의 심리상태를 평가해주세요.</p>
        
        <button type="button" class="btn btn-dark" onclick="js:begin()">시작</button>
    </div>
    </section>
    <section id="qna"> 
        <div class="status mx-auto mt-5">
            <div class="statusBar">

            </div>
        </div>
        <div class="qBox my-5 py-3 mx-auto">
  
        </div>
        <div class="answerBox my-5 py-3">

        </div>
    </section>
    <section id="result">
        <h3>당신의 스트레스 점수는?</h3>
        <div class="resultname">

            
        </div>
        
        <button type="button" class="btn btn-dark">공유하기</button>
    </section>
</div>

</div>
<script src="/resources/js/data.js" charset="utf-8"></script>
<script src="/resources/js/start.js" charset="utf-8"></script>
</body>
</html>