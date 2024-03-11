<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망의 조각 Admin</title>
	
	<link href="${contextPath}/resources/style/css/hyun.css/admin/boardManagement.css" rel="stylesheet">
	<script src="${contextPath }/resources/js/hyun.js/admin/sb-admin-2.min.js"></script>
</head>
	
<body>
	
	   <!-- Page Wrapper -->
    <div id="wrapper">
    
    	<jsp:include page="/WEB-INF/views/admin/common/navBar.jsp"/>

        
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
            
            	<jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">신고내역</h1>
                    </div>                 

						
						<div class="btn_confirm">
							<button class="btn_medium" onclick="window.location.href='${contextPath}/admin/report/Board'">게시글</button>
							<button class="btn_medium grey" onclick="window.location.href='${contextPath}/admin/report/Reply'">댓글</button>
						</div>
						<div class="boardList_table">
						    <table>
						     	<colgroup>
							        <col style="width: 5%;">
							        <col style="width: 35%;">
							        <col style="width: 15%;">
							        <col style="width: 10%;">
							        <col style="width: 10%;">
							        <col style="width: 10%;">
							        <col style="width: 7.5%;">
							        <col style="width: 7.5%;">
							    </colgroup>
						    
								    <thead>
								        <tr>
								            <th>번호</th>
								            <th>신고사유</th>								            
								            <th>작성자</th>
								            <th>참조게시글번호</th>
								            <th>참조댓글번호</th>
								            <th>신고날짜</th>
								            <th colspan="2">비고</th>
								        </tr>
								    </thead>
								    <tbody id="faqTableBody">
								        <c:forEach var="r" items="${list}">
								            <!-- 질문 -->
								            <tr>
								                <td>${r.reportNo}</td>
								                <td>${r.reportContent}</td>
								                <td>${r.email}</td>
								                <td>${r.boardNo }</td>
								                <td>${r.replyNo }</td>
								                <td>${r.reportDate }</td>
								                <td ><button onclick="deleteBoard(${r.reportNo})">확인</button></td>
								                <td ><button onclick="movePage(${r.replyNo})">상세보기</button></td>
								            </tr>
								           
								      </c:forEach>
								    </tbody>
								</table>

						</div>
						
						
					</div>
					
				</div>
			</div>
		</div>
	
	<script>
	function deleteBoard(reportNo) {
	       
        var url = '${contextPath}/admin/delete/report/Reply/' + reportNo 
        window.location.href = url;
    }
	function movePage(replyNo){
		location.href="${contextPath}/admin/report/detail/reply/"+replyNo
	}
		
	</script>
</body>
</html>									