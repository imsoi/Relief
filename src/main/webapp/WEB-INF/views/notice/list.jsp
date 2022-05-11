<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<h2><a href = "/" >RELIEF</a></h2>
			<ul class="nav">
				<li><a href = "/serviceindex">릴리프 서비스</a></li>
				<li><a href = "/introduceindex">릴리프 소개</a></li>
				<li><a href = "/test/list">테스트하기</a></li>
				<li><a href = "/notice/list">공지사항</a></li>
				<li><a href = "/mypage/list">마이페이지</a></li>
			</ul>
	</div>

	<section class="notice">
		<div class="page-title">
			<div class="container">
			    <h3>공지사항</h3>
			</div>
		 </div>
	
	  <!--search -->
		<div id="board-search">
			<div class="container">
				<div class="search-window">
					<form action="">
						<div class="search-wrap">
						    <label for="search" class="blind">공지사항 내용 검색</label>
						    <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
						    <button type="submit" class="btn btn-dark">검색</button>
						</div>
					</form>
				</div>
			</div>
		 </div>
	  
	<!--list-->
		<div id="board-list">
			<div class="container">
				<table class="board-table">
					<thead>
						<tr>
							<th>NO</th>
							<th>제목</th>
							<th>등록일자</th>
							<th>관리자</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.ncode}</td>
								<td><a href="view/${item.ncode}" style="text-decoration: none;">${item.title}</a></td>
								<td><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd"/></td>
								<td>관리자</td>
							</tr>
						 </c:forEach>
					
						<c:if test="${list.size() < 1}">
							<tr>
								<td colspan="4">등록 된 공지사항이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
					
				<div style="margin-top: 20px">
				<a href="add" class="btn btn-sm btn-dark">등록</a>
				</div>
			</div>
		</div>
	</section>
</body>
</html>