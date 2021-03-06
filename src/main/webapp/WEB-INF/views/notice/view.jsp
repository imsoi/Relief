<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" type= "text/css" href="/resources/css/notice.css">
<title></title>

	<script>
	function removeCheck(item) {
		 if (confirm("정말 삭제하시겠습니까")){ 
			// let url = location.href.replace("view","delete");
			 location.href = location.href.replace("view","delete");
		 }
		}
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

	<article>
		<section class="notice">
			<div class="page-title">
				<div class="container">
				    <h4 style="font-weight: bold;">NOTICE</h4><br>
				    <p style="margin-top: -25px;">공지사항 확인</p>
				</div>
			 </div>
	
		<div class="container">
			<form method="post">
			<div class="mb-3" style="border-top: 1px solid #ccc;">
				<label style="margin-top: 10px;">공지 제목 ㅣ&nbsp;</label>
				<span>${item.title}</span>
			</div>
			
			<div class="mb-3" style="border-bottom: 1px solid #ccc;">
				<label style="margin-bottom: 10px;">작성 일자 ㅣ&nbsp;</label> 
				<span><fmt:formatDate value="${item.regDate}" pattern="yy.MM.dd"/></span>
			</div>

			<div class="mb-3" style="border-bottom: 1px solid #ccc;">
				<span>${item.contents}</span>
			</div>
			
			<div>
			<ul>
				<c:if test="${item.images == null || item.images.size() < 1}">
					<li>등록 된 제품이미지가 없습니다.</li>
				</c:if>
				<c:forEach var="image" items="${item.images}">
					<li><img src="/upload/${image.uuid}_${image.filename}"/></li>
				</c:forEach>
			</ul>
			</div>
			
			<div style="text-align: center; margin-top: 80px;">
				<a class="btn btn-sm btn-dark" href="/notice/list" style="color: white; ">목록</a>
			</div>
			</form>
			
			<c:if test="${sessionScope.member.grade == 1}">
			<a href="../update/${item.ncode}" class="btn btn-sm btn-dark">변경</a>
			<button class="btn btn-sm btn-dark" onClick="removeCheck(${item.ncode})" >삭제</button>
			</c:if>
		</div>
		</section>
	</article>
</body>

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
</html>