<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/nav.css">
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
				<li><a href = "/serviceindex">릴리프 서비스</a></li>
				<li><a href = "/introduceindex">릴리프 소개</a></li>
				<li><a href = "/test/list">테스트하기</a></li>
				<li><a href = "/notice/list">공지사항</a></li>
				<li style="margin-left: 520px"><a href="/login">로그인</a></li>
            	<li><a href="/signup">회원가입</a></li>
			</ul>
	</div>

	<article>
		<section class="notice">
		<div class="page-title">
			<div class="container">
			    <h3>공지사항</h3>
			</div>
		 </div>
	
		<div class="container">
			<form method="post">
			<div class="mb-3">
				<label>제목</label> 
				<input value="${item.title}" class="form-control" name="title" readonly="readonly" style="background-color: white;">
			</div>

<!-- 			<div class="mb-3">
				<label>작성자</label> 
				<input type="text" class="form-control" name="admin" value="관리자" readonly="readonly" style="background-color: white;">
			</div> -->

			<div class="mb-3">
				<label>내용</label>
				<textarea class="form-control" rows="10" name="contents" readonly="readonly" style="background-color: white;">${item.contents}</textarea>
			</div>
			
			<div style="text-align: center; margin-top: 50px">
				<a class="btn btn-sm btn-dark" href="/notice/list" style="color: white; ">목록</a>
			</div>
			</form>
			
			<a href="../update/${item.ncode}" class="btn btn-sm btn-dark">변경</a>
			<button class="btn btn-sm btn-dark" onClick="removeCheck(${item.ncode})" >삭제</button>
		</div>
		</section>
	</article>
</body>
</html>