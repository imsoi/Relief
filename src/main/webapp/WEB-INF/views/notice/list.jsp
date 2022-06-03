<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type= "text/css" href="/resources/css/notice.css">
<title></title>

	<script>
		function removeCheck(item) {
	
			 if (confirm("정말 삭제하시겠습니까")){   
				 location.href = "delete/"+item;
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
              <li style="margin-left: 520px"><a href="/login">로그인</a></li>
                 <li><a href="/signup">회원가입</a></li>
           </ul>
     </div>

	<section class="notice">
		<div class="page-title">
			<div class="container">
			    <h4 style="font-weight: bold;">NOTICE</h4><br>
			    <p style="margin-top: -25px;">공지사항입니다</p>
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
							<th style="width:500px">제목</th>
							<th>관리자</th>
							<th>등록일자</th>
							
							<c:if test="${sessionScope.member.grade == 1}">
							<th style="width:100px;">관리</th>
							</c:if>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td style="font-weight: bold;">공지</td>
							<td><a href="view/2" style="text-decoration: none;">릴리프 서버 이전 작업</a></td>
							<td style="font-weight: bold;">RELIEF</td>
							<td>2022-05-28</td>
							<c:if test="${sessionScope.member.grade == 1}">	
							<td>변경 불가</td>
							</c:if>
						</tr>
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.ncode}</td>
								<td><a href="view/${item.ncode}" style="text-decoration: none;">${item.title}</a></td>
								<td style="font-weight: bold;">관리자</td>
								<td><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd"/></td>
								
								<c:if test="${sessionScope.member.grade == 1}">
								<td>
								<a onClick="removeCheck(${item.ncode})" class="btn btn-sm btn-outline-danger">삭제</a> 
								<a href="update/${item.ncode}" class="btn btn-sm btn-outline-warning">변경</a>
								</td>
								</c:if>
								
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
					
				<c:if test="${sessionScope.member.grade == 1}">		
					<div style="margin-top: 20px">
					<a href="add" class="btn btn-sm btn-dark">등록</a>
					</div>
				</c:if>
				
			</div>
		</div>
	</section>
</body>
</html>