<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/nav.css">
<link rel="stylesheet" type= "text/css" href="/resources/css/notice.css">

<title></title>
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
<!-- 						    <label for="search" class="blind">공지사항 내용 검색</label> -->
						    <input id="search" type="text" name="keyword" placeholder="검색어를 입력해주세요." value="${pager.keyword}">
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
					
					<tfoot>
						<tr>
							<td colspan="7">
								<div class="pagination justify-content-center">							
									<div class="page-item"><a href="?page=1&${pager.query}" class="page-link">처음</a></div>
									<div class="page-item"><a href="?page=${pager.prev}&${pager.query}" class="page-link">이전</a></div>		
														
									<c:forEach var="page" items="${pager.list}">
										<div class="page-item ${page == pager.page ? 'active' : ''}"><a href="?page=${page}&${pager.query}" class="page-link">${page}</a></div>
									</c:forEach>
									
									<div class="page-item"><a href="?page=${pager.next}&${pager.query}" class="page-link">다음</a></div>
									<div class="page-item"><a href="?page=${pager.last}&${pager.query}" class="page-link">마지막</a></div>							
								</div>
							</td>
						</tr>
					</tfoot>
					
				</table>
					
				<div style="margin-top: 20px">
				<a href="add" class="btn btn-sm btn-dark">등록</a>
				</div>
			</div>
		</div>
	</section>
</body>
</html>