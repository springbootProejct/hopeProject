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
<link rel="stylesheet"
	href="${contextPath}/resources/style/css/sangjun.css/summernote/summernote-lite.css">
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

		<div class="Sn-wrapper1">
			<div class="Sn-wrapper2">
				<div>
					<div>
						<div>
								<h2 style="text-align: center; margin-top: 70px; font-size: 25px;">자유게시판</h2>
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
								<a
									href="${contextPath}/board/fileDownload/${b.boardTypeNo}/${imgList[i].fileNo}">
									${imgList[i].originName} </a>
							</div>
						</c:forEach>					
					</div>
				</div>

				<section class="entry-content">
					<textarea class="detail-content" id="summernote"
						style="background-color: transparent; border: none;"
						readonly="readonly">${b.boardContent}</textarea>

				</section>
				<div class="reply-insert">
					<c:if test="${not empty loginUser}">
					<div class="comment-section">
						<textarea class="form-control comment-input" name="replyContent"
							id="replyContent" style="resize: none; width: 100%;"
							placeholder="댓글을 입력하세요..."></textarea>
						<button class="btn btn-secondary comment-button"
							onclick="insertReply()">등록하기</button>
					</div>
					<div class="comment-list">
						<h3>
							댓글 (<span id="rcount">0</span>)
						</h3>
						<table id="replyArea" class="table">

							<tbody>


							</tbody>
						</table>
					</div>

				</div>
				</c:if>
				<div class="btn-group">
					<div class="login-detail-btn">
						<c:if test="${not empty loginUser}">
					    <c:if test="${loginUser.userNo ne b.userNo}">
					        <button class="report-btn" onclick="openModal()">신고</button>
					    </c:if>
					</c:if>
					
					<c:if test="${loginUser.userNo eq b.userNo}">
						<button class="delete-btn" onclick="deleteBoard(${b.boardNo})">삭제</button>
						<button class="modify-btn"
							onclick="window.location.href='${contextPath}/board/update/${b.boardTypeNo}/${b.boardNo}'">수정</button>
					</c:if>
					</div>
					<div class="detail-btn">
						<button class="list-btn"
							onclick="window.location.href='${contextPath}/board/C'">목록</button>
					</div>

				</div>
			</div>
		</div>
		<div class="reportForm" id="reportForm">
			<div class="reportSecondForm">
				<div class="report-content">
					<div class="reportHeader">
						<h5 class="report-title" id="reportModalLabel">신고하기</h5>
						<button type="button">
							<span>&times;</span>
						</button>
					</div>
					<div class="report-Content">
						<form id="reportForm">
							<div class="form-group">
								<label for="reportContent">신고 내용:</label>
								<textarea class="form-control" id="reportContent"
									name="reportContent" rows="4" required></textarea>
							</div>
							<button type="button" class="insertbtn btn-primary"
								onclick="reportInsert()">신고 보내기</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</main>

	<script>
	
	/*============*/
	let loginUserNo = ${empty loginUser ? null : loginUser.userNo}
	
	function loadComments(boardNo) {
	    $.ajax({
	        url: '${contextPath}/reply/list', // 댓글 목록을 조회하는 API의 주소
	        data:{boardNo:${b.boardNo}},
	        type: 'GET',
	        success: function(list) {
	           	            const tbody = $('#replyArea tbody'); // 댓글을 추가할 tbody 엘리먼트
	            tbody.empty(); // 기존의 댓글을 모두 지우고 시작

	            // 각 댓글을 순회하며 HTML에 추가
	             for (let i = 0; i < list.length; i++) {
				    let r = list[i];
				    let row = '<tr>' +
				        '<td>' + r.userName + '</td>' +
				        '<td class="comment-content">' + r.replyContent + '</td>' +
				        '<td>' + r.createDate + '</td>' +
				        '<td>';
				
				    // 로그인 상태를 확인하여 버튼을 생성
				    if (loginUserNo && loginUserNo == r.userNo) {
				        row += '<button onclick="editComment(' + i + ', ' + r.replyNo + ')">수정</button>' +
				            '<button onclick="deleteComment(' + i + ', ' + r.replyNo + ')">삭제</button>';
				    }
				
				    // 항상 신고 버튼을 생성
				    row += '<button onclick="reportComment(' + i + ', ' + r.replyNo + ')">신고</button>';
				
				    row += '</td>' +
				        '</tr>';
				    tbody.append(row); // 댓글을 tbody에 추가
				}
	            // 댓글 개수 업데이트
	            $('#rcount').text(list.length);
	        },
	        error: function(xhr, status, error) {
	            console.error('댓글 조회에 실패하였습니다:', error);
	            alert('댓글 조회에 실패하였습니다. 상세 정보는 콘솔을 확인해주세요.');
	        }
	    });
	}
	function reportComment(i , replyNo){
		$('#reportForm').css('display', 'block');
		$('#reportForm').data('replyNo', replyNo); 
	}
	function reportInsert(){
		const reportContent = $('#reportContent').val();
		const replyNo = $('#reportForm').data('replyNo');
		const replyNoValue = replyNo !== null ? replyNo : null;
		const data={
			boardNo:'${b.boardNo}',
		    replyNo: replyNoValue,
			userNo:'${loginUser.userNo}',
			reportContent
			}
			
		$.ajax({
			url:'${contextPath}/report/board',
			type:'POST',
			contentType:"application/json; charset=UTF-8",
			data: JSON.stringify(data),
			success:function(result){
				if(result.msg === "성공"){
					  alert("신고 되었습니다.");
	            }else{
	                 alert("신고에 실패하였습니다.")
	            }
				$('#reportContent').val("");
				$('#reportForm').css('display', 'none');
			}
		})
	}
	function openModal(){
		$('#reportForm').css('display', 'block');
		
	}
	
	$(document).ready(function() {
	    $('.reportHeader button').click(function() {
	    	$('#reportForm').css('display', 'none');
	    });
	});
	
		
	// 페이지 로드시 댓글 조회
	$(document).ready(function() {
	    loadComments();
	});
	function deleteComment(i , replyNo){
		let commentRow = $('#replyArea tbody tr').eq(i); 
		 
	          $.ajax({
	               url: '${contextPath}/reply/delete', // 서버로 전송할 URL 설정
	               method: 'POST', // 전송 방식 설정 (POST 방식으로 전송)
	               data: { 
	                  replyNo: replyNo
	                  
	               },
	               success: function(response) {
	                   if(response==="success"){
	                       alert("삭제가 완료되었습니다.");
	                       commentRow.remove();
	                 
	                   }else{
	                       alert("삭제에 실패하였습니다.")
	                   }
	               },
	               error: function(xhr, status, error) {
	                   // 서버 요청이 실패한 경우 에러 메시지 출력
	                   console.error('서버 요청 실패:', error);
	               }
	           });
	     
		
	}
	function editComment(i , replyNo) {
        let commentRow = $('#replyArea tbody tr').eq(i); // 인덱스에 해당하는 댓글 행 선택
       let commentContent = commentRow.find('.comment-content').text(); // 댓글 내용 가져오기
       // 수정할 수 있는 입력란으로 변경
       let inputField = $('<input type="text" style="width:450px" rows="2" class="comment-edit-input">').val(commentContent);
       commentRow.find('.comment-content').html(inputField); // 댓글 내용을 입력란으로 변경
       // 수정 완료 버튼 생성
       let editButton = $('<button class="btn btn-secondary">수정완료</button>');
       commentRow.find('td:last-child').html(editButton); 
       // 수정 완료 버튼 클릭 이벤트 처리
       editButton.click(function() {
           let editedContent = inputField.val(); // 수정된 내용 가져오기
           // 서버로 수정된 내용을 전송하여 저장하는 Ajax 요청
           $.ajax({
               url: '${contextPath}/reply/update', // 서버로 전송할 URL 설정
               method: 'POST', // 전송 방식 설정 (POST 방식으로 전송)
               data: { 
                  replyNo: replyNo, // 수정된 댓글의 인덱스
                   replyContent: editedContent // 수정된 내용
               },
               success: function(response) {
                   if(response==="success"){
                       alert("수정이 완료되었습니다.");
                       location.reload(); // 페이지 새로고침
                   // 서버에서 성공적으로 응답을 받으면 화면에 수정된 내용 반영
                   commentRow.find('.comment-content').text(editedContent);
                   // 수정 버튼으로 변경
                   commentRow.find('td:last-child').html('<button onclick="editComment(' + i + ')">수정</button>' +
                                                        '<button onclick="deleteComment(' + i + ')">삭제</button>');
                       
                   }else{
                       alert("수정에 실패하였습니다.")
                   }
               },
               error: function(xhr, status, error) {
                   // 서버 요청이 실패한 경우 에러 메시지 출력
                   console.error('서버 요청 실패:', error);
               }
           });
       });
       inputField.focus(); // 입력란에 포커스 설정
   }
    function deleteBoard(boardNo) {
        var boardTypeNo = 'C'; // boardTypeNo 값을 설정하거나 동적으로 가져옵니다.
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
	
	function insertReply(){

		const replyContent = $('#replyContent').val();
		
		const data={
			boardNo:'${b.boardNo}',
			userNo:'${loginUser.userNo}',
			replyContent
			}
		console.log(data);
		$.ajax({
			url:'${contextPath}/reply/insert',
			type:'POST',
			contentType:"application/json; charset=UTF-8",
			data: JSON.stringify(data),
			success : function(result){
				if(result.msg === "성공"){
					alert("댓글 등록에 성공하였습니다.");
					loadComments();
				}
				if(result.msg==='실패'){
					alert("로그인하세요");
					
				}
				$('#replyContent').val("");
			},
			error: function(xhr, status, error) {
	            console.error('댓글 등록에 실패하였습니다:', error);
	            alert('댓글 등록에 실패하였습니다. 상세 정보는 콘솔을 확인해주세요.');
	        }
					
		})
	}
	
	</script>
	<script
		src="${contextPath}/resources/js/sangjun.js/summernote/summernote-lite.js"></script>
	<script
		src="${contextPath}/resources/js/sangjun.js/summernote/lang/summernote-ko-KR.js"></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>