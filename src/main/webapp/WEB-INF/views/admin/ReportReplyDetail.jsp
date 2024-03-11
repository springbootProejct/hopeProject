<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.note-editor.note-airframe .note-editing-area .note-editable {
    background-color: transparent !important;
}
</style>
<link rel="stylesheet"
	href="${contextPath}/resources/style/css/sangjun.css/adminDetail.css">

	<link rel="stylesheet" href="${contextPath}/resources/style/css/sangjun.css/summernote/summernote-lite.css">
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
                    <main>
    
                        <div class="Sn-wrapper1">
                            
                            <div class="Sn-wrapper2">
                                
                                <header class="entry-header">
                                    <h1 class="entry-title">작성자 : ${b.email}</h1>
                                    <div class="entry-meta">
                                        <div class="detail-date">번호</div>
                                        <div class="detail-date-">${b.replyNo}</div>
                                         <div class="detail-date">등록일</div>
                                        <div class="detail-date-">${b.createDate}</div>
                                          <div class="detail-date"  style="margin-left :8px;">참조게시글</div>
                                        <div class="detail-date-" style="margin-left :8px;">${b.boardNo}</div>
                                        
                                    </div>
                                  </header>
                                                            
                               
                                
                                <section style="margin :20px; height:50px" class="reply-content">
                                    <div class="detail-content" id="summernote" style="background-color: transparent; border: none; height:50px;"  readonly="readonly">${b.replyContent}</div>
    
                                </section>
                                
                                <div class="btn-group1">
                                    <div class="login-detail-btn">
                                                              
                                        <button class="delete-btn" onclick="deleteBoard(${b.replyNo})">삭제</button>                                                     
                               			<button class="list-btn" onclick="window.location.href='${contextPath}/admin/report/Reply'">목록</button>
                                    
                                    </div>
                                  
    
                                </div>
                            </div>
                        </div>
    
                    </main>
                    
                </div>
            </div>
        </div>
    </div>
    <script>
	function deleteBoard(replyNo) {
       
        var url = '${contextPath}/admin/delete/report/reply/' + replyNo
        window.location.href = url;
    }
	
	



	</script>
	
    
</body>
</html>
