<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${contextPath}/resources/style/css/sangjun.css/SnoticeInsert.css">

<!-- include summernote css/js-->

<link rel="stylesheet" href="${contextPath}/resources/style/css/sangjun.css/summernote/summernote-lite.css">
<style>
	.h_boardTitle{
	  height:330px;
	  padding-top: 100px;
	  background-image: url('${contextPath}/resources/images/board/board1.jpg');
	   background-size: cover;
	  background-position: center;
	  margin-bottom: 50px;
	}
	</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<main>
		<section>
			<article class="h_boardTitle">
					 <h1>소식</h1>
            <p>나눔과 순환의 아름다운 세상 이야기를 전합니다</p>
			</article>
		</section>
		<div class="Sn-insert-wrapper">
			<div class="Sn-insert-section">
				<div class="Sn-insert-container">
					<h2 style="text-align: center; margin-top: 70px; font-size: 25px;">나눔후기 등록</h2>
        <div class="donateGoodFormBorder" style="margin-left: auto; margin-right: auto;"></div>
				<form method="POST" action="${contextPath}/board/insert/${boardTypeNo}" id="insertform" enctype="multipart/form-data">
					<div class="Sn-form">
						<div class="Sn-form-group">
							<label for="title">제목</label> <input type="text" id="title" name="boardTitle"
								class="Sn-input-title" placeholder="제목을 입력하세요" required>
						</div>
						<div class="Sn-form-group flex-container">
							<label>작성자</label>
							<div id="author" class="Sn-input-user">${loginUser.userName}</div>
						</div>
						<div class="Sn-form-group flex-container">
							<label for="img1"class="file-upload-label">대표이미지</label>
							<div class="file-preview">
							<img class="preview" alt="대표이미지 미리보기">						
							</div>
							<input type="file" class="inputImage" id="img1" accept="images/*" name="upfiles">	
													
						</div>
						<div class="Sn-form-group flex-container">
							<label for="img2" class="file-upload-label">추가 파일</label>							
							<input type="file" class="inputImage" id="img2" accept="images/*" name="upfiles">							
						</div>
						<div class="Sn-form-group">
							<label for="boardContent">글내용</label>
							<textarea id="summernote" class="summernote" name="boardContent"
								placeholder="내용을 입력하세요"></textarea>
						</div>
					</div>
					
					<div class="Sn-btn-group">
						<button type="submit" class="Sn-insert-btn">등록</button>
						<button type="reset" class="Sn-cancel-btn" onclick="window.location.href='${contextPath}/board/R'">취소</button>
					</div>
				</form>
				</div>
			</div>
		</div>

		<script>
		const inputImage = document.querySelectorAll('.inputImage');
		const preview = document.querySelectorAll('.preview');
		
		inputImage.forEach(function(value,index){
			value.addEventListener('change',function(){
				if(this.files[0] != undefined){
					const reader = new FileReader();
					reader.readAsDataURL(this.files[0]);
					reader.onload = function(e){
						preview[index].setAttribute("src",e.target.result);
						  preview[index].style.display = 'block';
					}
				}else{
					preview[index].removeAttribute("src");
					preview[index].style.display = 'none';
				}
			})
		})
		
		
        $(document).ready(function() {

            $('#summernote').summernote({
                height: 500,
                minHeight: 500,
                maxHeight: 500,
                focus: false,
                lang: "ko-KR",
                placeholder: '최대 2048자까지 쓸 수 있습니다'
            });
        });
        </script>
   
	</main>
	


	<script src="${contextPath}/resources/js/sangjun.js/summernote/summernote-lite.js"></script>
	<script src="${contextPath}/resources/js/sangjun.js/summernote/lang/summernote-ko-KR.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>