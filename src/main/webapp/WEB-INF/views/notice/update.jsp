<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
    <!-- JQuery -->	
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
	<!-- summernote-lite ver -->
	<script src="/resources/css/summernote/summernote-lite.js"></script>
	<script src="/resources/css/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" type= "text/css" href="/resources/css/notice.css">

	<script>
	$(function(){
		$("#summernote").summernote({
			height: 300,
			placeholder: '공지 내용을 입력해 주세요.'
	 	}); 
		
	      $("#add_image").click(function(){
	          const div = $("<div>").addClass("mt-2")
	          const label = $("<label>").text("제품 이미지: ");
	          const button = $("<span>").text("삭제");
	          button.addClass("btn btn-outline-danger btn-sm");
	          const file = $("<input>").attr("type","file");
	          file.attr("name", "noticeImage");
	          file.addClass("form-control");   
	          
	          
	          button.click(function(){
	             $(this).parent().remove();
	          });
	          
	          div.append(label);
	          div.append(button);
	          div.append(file);
	          
	          
	          $("form > div:last-child").before(div);
	       });
	       
	       $("button.delete").click(function(){ // 여 기서의 this는 button을 가리킴 왜냐면 문맥(일을 시키는 사람)이기 때문에
	          const code= $(this).data("code");
	          
	          $.ajax("../image/delete/" + code, {
	             method:"GET",
	             success: function(result) {
	            	
	             	console.log(typeof result);
	             	console.log(result);
	             	
	             	if(result){ // ===은 타입과 값이 맞는지 확인, ==은 값만 맞는지 확인
	             		$("button.delete[data-code='"+code+"']").parent().remove();
	             	}
	             },
	             error: function(jqXhr, status) {
	             	console.log(status);
	             }
	          });
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
		<section class="notice"">
			<div class="page-title">
				<div class="container">
				    <h4 style="font-weight: bold;">NOTICE</h4><br>
				    <p style="margin-top: -25px;">공지사항 변경</p>
				</div>
			 </div>
	
		<div class="container">
			<form method="post">
			<div class="mb-3">
				<label>제목</label> 
				<input type="text" class="form-control" name="title" value="${item.title}" placeholder="제목을 입력해 주세요">
			</div>

			<div class="mb-3">
				<label>내용</label>
				<textarea id="summernote" class="form-control" name="contents" placeholder="내용을 입력해 주세요">${item.contents}</textarea>
			</div>
			
			<div>
            <ul>
               <c:if test="${item.images == null || item.images.size() < 1}">
                  <li>등록 된 제품이미지가 없습니다.</li>
               </c:if>
               <c:forEach var="image" items="${item.images}">
                  <li>${image.filename}<button type="button" class="btn btn-outline-danger btn-sm delete" data-code="${image.icode}"> 삭제</button></li>
               </c:forEach>
            </ul>
         </div>
			
			<div class="mb-3">
				<label>첨부파일 (이미지 형식) <span id = "add_image" class="btn btn-outline-primary btn-sm">추가</span></label>
				<input type="file" name="noticeImage" class="form-control">	
			</div>
			
			<div style="text-align: center; margin-top: 50px">
				<button class="btn btn-sm btn-dark">저장</button>
			</div>
			</form>
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