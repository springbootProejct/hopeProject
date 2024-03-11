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
	<c:if test="${not empty alertMsg}">
        <script>
            alert("${alertMsg}");
        </script>
    </c:if>

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
						<h2 style="text-align: center; margin-top: 70px; font-size: 25px;">나눔후기수정</h2>
        <div class="donateGoodFormBorder" style="margin-left: auto; margin-right: auto;"></div>
				<form method="POST" action="${contextPath}/board/update/R/${boardNo}" id="insertform" enctype="multipart/form-data">
					<div class="Sn-form">
						<div class="Sn-form-group">
							<label for="title">제목</label> <input type="text" id="title" name="boardTitle"
								class="Sn-input-title" value="${b.boardTitle}"placeholder="제목을 입력하세요" required>
						</div>
						<div class="Sn-form-group flex-container">
							<label>작성자</label>
							<div id="author" class="Sn-input-user">${b.userName}</div>
						</div>
						<c:if test="${not empty b.imgList}">
							<c:forEach items="${b.imgList}" var="attachment" varStatus="i">
								<c:choose>
									<c:when test="${attachment.imgLevel==0}">
										<c:set var="img0" value="${contextPath}/resources/images/board/${b.boardTypeNo }/${attachment.changeName }"/>																									
										<c:set var="img0no" value="${attachment.fileNo}"/>
										<c:set var="img0name" value="${attachment.originName}"/>
									</c:when>
									<c:when test="${attachment.imgLevel==1}">
										<c:set var="img1" value="${contextPath}/resources/images/board/${b.boardTypeNo }/${attachment.changeName }"/>										
										<c:set var="img1no" value="${attachment.fileNo}"/>
										<c:set var="img1name" value="${attachment.originName}"/>
									</c:when>
								</c:choose>
							</c:forEach>
						</c:if>
						<div class="Sn-form-group flex-container">
							<label for="img1" class="file-upload-label">대표이미지</label>
							<div class="file-preview">
							<img class="preview" alt="대표이미지 미리보기" src="${img0}">						
							</div>
							<input type="file" class="inputImage" id="img1" style="display:none;"accept="images/*" name="upfiles" >${attachment.originName}
							<button type="button" class="btn-secondary" id="updatefileInputButton" onclick="$('#img1').click()">파일선택</button>
							<span id="updateFileName1">${img0name}</span>
							<span class="delete-image" data-no="${img0no}">&times;</span>			
						</div>
						<div class="Sn-form-group flex-container">
							<label>추가 파일</label>
							<div style="display:none;">
							<img class="preview" alt="대표이미지 미리보기" src="${img1}">	
							</div>
							<input type="file" class="inputImage" id="img2" accept="images/*" style="display:none;" name="upfiles">														
							<button type="button" class="btn-secondary" id="updatefileInputButton" onclick="$('#img2').click()">파일선택</button>
							<span id="updateFileName2">${img1name}</span>
							<span class="delete-image" data-no="${img1no}">&times;</span> 	
						</div>
						<div class="Sn-form-group">
							<label for="boardContent">글내용</label>
							<textarea id="summernote" class="summernote" name="boardContent"
								placeholder="내용을 입력하세요">${b.boardContent}</textarea>
						</div>
					</div>
					<input type="hidden" name="deleteList" id="deleteList" value="" />
					<div class="Sn-btn-group">
						<button type="submit" class="Sn-insert-btn">등록</button>
						<button type="reset" class="Sn-cancel-btn" onclick="window.location.href='${contextPath}/board/R'">취소</button>
					</div>
				</form>
				</div>
			</div>
		</div>

		<script>
		function createPreview(){
			
			const inputImage = document.querySelectorAll('.inputImage');
			const preview = document.querySelectorAll('.preview');
			const deleteImage = document.querySelectorAll('.delete-image');
			
			const deleteList = document.querySelector("#deleteList");
			const deleteSet = new Set();
			
			
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
					let no = $(this).next().data('no');
					if(no != undefined && no) deleteSet.add(no);
					deleteList.value = [...deleteSet];
				
				})
				deleteImage[index].addEventListener('click',function(){
					if(preview[index].getAttribute("src")!=""){
						preview[index].removeAttribute("src");
						preview[index].style.display = 'none';
						inputImage[index].value="";
						
						let no = this.dataset.no;
						if(no != undefined && no) deleteSet.add(no);
						deleteList.value = [...deleteSet];

						let fileNameElement;
			            if (index === 0) {
			                fileNameElement = document.getElementById('updateFileName1');
			            } else if (index === 1) {
			                fileNameElement = document.getElementById('updateFileName2');
			            }
			            if (fileNameElement) {
			                fileNameElement.innerText = '선택된 파일 없음';
			            }
					}
				})
			})
			}
			
			
	        $(document).ready(function() {
	        	createPreview();

	            $('#summernote').summernote({
	                height: 500,
	                minHeight: 500,
	                maxHeight: 500,
	                focus: false,
	                lang: "ko-KR",
	                placeholder: '최대 2048자까지 쓸 수 있습니다'
	            });
	                  
	        });
			  $(document).ready(function() {
				  
			        $('#img1').on('change', function() {
			            // 선택된 파일의 이름을 가져와서 표시
			            let selectedFileNames = '';
			            // 여기에서 변수명 'thes'가 정의되어 있지 않습니다. $(this)로 수정합니다.
			            let selectedFiles = $(this)[0].files;
			            for (let i = 0; i < selectedFiles.length; i++) {
			                selectedFileNames += selectedFiles[i].name + ', ';
			            }
			            // 마지막 쉼표와 공백 제거
			            selectedFileNames = selectedFileNames.slice(0, -2);
			            // 파일 이름을 표시할 요소에 업데이트
			            $('#updateFileName1').text(selectedFileNames);
			        });
			        $('#img2').on('change', function() {
			            // 선택된 파일의 이름을 가져와서 표시
			            let selectedFileNames = '';
			           
			            let selectedFiles = $(this)[0].files;
			            for (let i = 0; i < selectedFiles.length; i++) {
			                selectedFileNames += selectedFiles[i].name + ', ';
			            }
			            // 마지막 쉼표와 공백 제거
			            selectedFileNames = selectedFileNames.slice(0, -2);
			            // 파일 이름을 표시할 요소에 업데이트
			            $('#updateFileName2').text(selectedFileNames);
			        });
			    });
	      
        </script>
   
	</main>
	


	<script src="${contextPath}/resources/js/sangjun.js/summernote/summernote-lite.js"></script>
	<script src="${contextPath}/resources/js/sangjun.js/summernote/lang/summernote-ko-KR.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>