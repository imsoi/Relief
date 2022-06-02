<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
    <!-- JQuery -->	
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
 	<!-- include summernote css/js-->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type= "text/css" href="/resources/css/notice.css">
    <script>
	$(function(){
		$("#summernote").summernote({
			height: 300,
			placeholder: '공지 내용을 입력해 주세요.'
	 	}); 
	});
	
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
				<li style="margin-left: 520px"><a href="/login">로그인</a></li>
            	<li><a href="/signup">회원가입</a></li>
			</ul>
	</div>

	<article>
		<section class="notice">
		<div class="page-title">
			<div class="container">
			    <h4 style="font-weight: bold;">NOTICE</h4><br>
			    <p style="margin-top: -25px;">공지사항 등록</p>
			</div>
		 </div>
	
		<div class="container">
			<form method="post">
			<div class="mb-3">
				<label>제목</label> 
				<input type="text" class="form-control" name="title" placeholder="제목을 입력해 주세요">
			</div>

			<div class="yui3-cssreset">
				<label>내용</label>
				<textarea id="summernote" class="form-control" name="contents" rows="10" placeholder="내용을 입력해 주세요"></textarea>
			</div>
			
			<div class="mb-3">
				<label>첨부파일 (이미지 형식) <span id = "add_image" class="btn btn-outline-primary btn-sm">추가</span></label>
				<input type="file" name="productImage" class="form-control">	
			</div>
			
			<div style="text-align: center; margin-top: 50px">
				<button class="btn btn-sm btn-dark">저장</button>
				<a class="btn btn-sm btn-dark" href="/notice/list" style="color: white;">목록</a>
			</div>
			</form>
		</div>
		</section>
	</article>
</body>
</html>