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
	href="resources/style/css/dowon.css/activityreportInsert.css">

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<main>
		<section>
			<article class="activityreportTitle">
				<h1>자원봉사</h1>
				<p>자원봉사 함께 나아가는 더 나은 세상.</p>
			</article>
		</section>
		<div class="container">
        <h2>활동 보고서 입력</h2>
        <form action="activityreportinsert" method="post">
            <div class="form-group">
                <label for="title">보고서 제목:</label> <input type="text" id="title"
                    name="reportTitle" placeholder="보고서 제목을 입력해주세요." required>
            </div>
            <div class="form-group">
                <label for="content">보고서 내용:</label> 
                <textarea type="text" id="content" name="reportContent" placeholder="보고서 내용을 입력해주세요." required></textarea>
            </div>
            <div class="form-group">
                <label for="address">활동시작 날짜:</label>
                <input type="date" id="date" name="activityStartDate" required>
            </div>
            <div class="form-group">
                <label for="address">활동종료 날짜:</label>
                <input type="date" id="date" name="activityEndDate" required>
            </div>
            <div class="form-group">
                <input type="submit" value="저장">
            </div>
        </form>
    </div>

	</main>


	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>