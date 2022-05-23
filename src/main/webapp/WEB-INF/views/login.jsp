<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title></title>

<script>
	function submit() {
		const data = {
				id : $("input [name='id']").val(),
				passwd : $("input [name='passwd']").val()
		}
		
		if(data.id == "") {
			alert("아이디를 입력해주세요")
			return;
		}
		
		if(data.passwd == "") {
			alert("비밀번호를 입력해주세요")
			return;
		}
		
		$("#login_form").submit();
	}
</script>

</head>
<body>
	<div>
		<h1>LOGIN</h1>
		<form method="post">
		  <input type="text" name="id" placeholder="아이디">
		  <input type="password" name="passwd" placeholder="비밀번호">
		 
		  <c:if test="${msg != null}">
		  	<p id="msg">${msg}</p>
		  </c:if>
		  
		  <button onclick="submit()">로그인</button>
		</form>
	</div>

</body>
</html>