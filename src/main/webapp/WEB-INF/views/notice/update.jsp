<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/sub.css">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

</head>
<body>
	<div class="header" style="padding-left: 20px">
   		<h2><a href = "/" >RELIEF</a></h2>
       		<ul class="nav" style="text-align: center; margin-left: 400px">
	           	<li><a href = "/serviceindex">릴리프 서비스</a></li>
				<li><a href = "/introduceindex">릴리프 소개</a></li>
				<li><a href = "/test/list">테스트하기</a></li>
				<li><a href = "/notice/list">공지사항</a></li>
				<li><a href = "/mypage/list">마이페이지</a></li>
           </ul>
	</div>


	<article>
		<div class="container" role="main" style="padding-top: 70px">
			<h2 style="text-align: center;">공지사항 변경</h2>
			<form method="post">
			<div class="mb-3" style="margin-top: 70px">
				<label>제목</label> 
				<input type="text" class="form-control" name="title" value="${item.title}" placeholder="제목을 입력해 주세요">
			</div>

			<div class="mb-3">
				<label>작성자</label> 
				<input type="text" class="form-control" name="admin" value="관리자" readonly="readonly" style="background-color: white;">
			</div>

			<div class="mb-3">
				<label>내용</label>
				<textarea class="form-control" rows="10" name="contents" placeholder="내용을 입력해 주세요">${item.contents}</textarea>
			</div>
			
			<div style="text-align: center; margin-top: 50px">
				<button class="btn btn-sm btn-dark">저장</button>
			</div>
			</form>
		</div>
	</article>
</body>
</html>