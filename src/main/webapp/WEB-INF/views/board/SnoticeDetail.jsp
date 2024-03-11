<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.note-editor.note-airframe .note-editing-area .note-editable {
    background-color: transparent !important;
}

</style>
	
<link rel="stylesheet"
	href="${contextPath}/resources/style/css/sangjun.css/SnoticeDetail.css">
	<link rel="stylesheet" href="${contextPath}/resources/style/css/sangjun.css/summernote/summernote-lite.css">
	<style>
	.h_boardTitle{
	  height:330px;
	  padding-top: 100px;
	  background-image: url('${contextPath}/resources/images/board/notice2.jpg');
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
		<div class="Sn-wrapper1">
			<div class="Sn-wrapper2">
				<div>
					<div>
						<div>
									<h2 style="text-align: center; margin-top: 30px; font-size: 25px;">공지사항</h2>
        						<div class="donateGoodFormBorder" style="margin-left: auto; margin-right: auto;"></div>
						</div>
					</div>
				</div>


				<header class="entry-header">
					<h1 class="entry-title">${b.boardTitle}</h1>
					<div class="entry-meta">
						<div class="detail-date">등록일</div>
						<div class="detail-date-">${b.createDate}</div>
						 <div>조회수</div>
						<div>${b.count }</div> 
					</div>
					<div class="entry-meta">
						<div class="detail-date">작성자</div>
						<div class="detail-date-">${b.userName}</div>
					</div>
				</header>
				<div>
					<div class="attachment">
						<div>첨부파일</div>
						<c:forEach var="i" begin="0" end="1">
							<div>								
								<a href="${contextPath}/board/fileDownload/${b.boardTypeNo}/${imgList[i].fileNo}">
									${imgList[i].originName}
								</a>
							</div>
						</c:forEach>
					</div>
				</div>

				<section class="entry-content">
					<textarea class="detail-content" id="summernote" style="background-color: transparent; border: none;"  readonly="readonly">${b.boardContent}</textarea>

				</section>
				
				<div class="btn-group">
					<div class="login-detail-btn">
					 <c:if test="${loginUser.userNo eq 1}">	                       	
						<button class="delete-btn" onclick="deleteBoard(${b.boardNo})">삭제</button>			
					    <button class="modify-btn" onclick="window.location.href='${contextPath}/board/update/N/${b.boardNo}'">수정</button>					
					</c:if>
					
					</div>
					<div class="detail-btn">
						<button class="list-btn" onclick="window.location.href='${contextPath}/board/N'">목록</button>
					</div>

				</div>
			</div>
		</div>

	</main>
	
	<script>
	function deleteBoard(boardNo) {
        var boardTypeNo = 'N'; // boardTypeNo 값을 설정하거나 동적으로 가져옵니다.
        var url = '${contextPath}/board/delete/' + boardNo + '?boardTypeNo=' + boardTypeNo;
        window.location.href = url;
    }
	function stripHtmlTags(html) {
	    let doc = new DOMParser().parseFromString(html, 'text/html');
	    return doc.body.textContent || "";
	}

	$(document).ready(function() {
	    var text = "${b.boardContent}";
	    text = stripHtmlTags(text); // HTML 태그 제거

	    // 썸머노트 초기화
	    $('#summernote').summernote({
	        toolbar: [], // 툴바 비활성화 (읽기 전용으로 설정)
	        airMode: true, // 에어모드 활성화
	        disableResizeEditor: true, // 에디터 크기 조절 비활성화
	        focus: false, // 포커스 설정 (선택사항)
	        codeview: false // 코드 보기 비활성화
	    });

	    // 썸머노트에 텍스트 삽입
	    $('#summernote').summernote('code', text);

	    // 에디터를 비활성화하여 사용자의 입력을 막습니다.
	    $('#summernote').summernote('disable');
	});



	</script>
	<script src="${contextPath}/resources/js/sangjun.js/summernote/summernote-lite.js"></script>
	<script src="${contextPath}/resources/js/sangjun.js/summernote/lang/summernote-ko-KR.js"></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>