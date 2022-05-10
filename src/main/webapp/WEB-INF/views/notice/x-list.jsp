<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>공지사항</title>
 
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/resources/css/sub.css">
		
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<div class="header" style="padding-left: 20px">
   		<h2><a href = "/" >RELIEF</a></h2>
       		<ul class="nav" style="text-align: center; margin-left: 50px">
	           	<li><a href = "/serviceindex">릴리프 서비스</a></li>
				<li><a href = "/introduceindex">릴리프 소개</a></li>
				<li><a href = "/test/list">테스트하기</a></li>
				<li><a href = "/notice/list">공지사항</a></li>
				<li><a href = "/mypage/list">마이페이지</a></li>
           </ul>
	</div>
	
<div class="page-container">
<div class="container mt-3" >
  <h2 style="text-align: center;">공지사항</h2>
  <table class="table table-hover" style="margin-top: 50px">
    <thead>
      <tr>
        <th>NO</th>
        <th>제목</th>
        <th>등록일자</th>
        <th>작성자</th>
      </tr>
    </thead>
   
	<tbody>
		<c:forEach var="item" items="${list}">
			<tr>
				<td>${item.ncode}</td>
				<td><a href="view/${item.ncode}" style="color: green; text-decoration: none;">${item.title}</a></td>
				<td><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd"/></td>
				<td>관리자</td>
<%-- 				
					<td><a href="view/${item.ncode}" class="btn btn-sm btn-dark">보기</a>  
					<a href="delete/${item.ncode}" class="btn btn-sm btn-light">삭제</a>
					<a href="update/${item.ncode}" class="btn btn-sm btn-light">변경</a></td> --%>
			</tr>
		</c:forEach>

		<c:if test="${list.size() < 1}">
			<tr>
				<td colspan="6">등록 된 공지사항이 없습니다.</td>
			</tr>
		</c:if>

	</tbody>
	 
	<tfoot>
	</tfoot>
  </table>
  
	<div>
<%-- 		<c:if test="${sessionScope.member.state} = 0">
			<a href="add" class="btn btn-sm btn-dark">홈으로</a> --%>
			<a href="add" class="btn btn-sm btn-dark">등록</a>
<%-- 		</c:if> --%>
	</div>
	
</div>
</div>
</body>
</html>
