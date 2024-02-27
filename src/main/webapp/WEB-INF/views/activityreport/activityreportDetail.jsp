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
	href="${contextPath}/resources/style/css/sangjun.css/SnoticeDetail.css">
<link rel="stylesheet"
	href="${contextPath}/resources/style/css/sangjun.css/summernote/summernote-lite.css">
<link rel="stylesheet"
	href="${contextPath}/resources/style/css/dowon.css/activityreportDetail.css">

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<main>
		<section>
			<article class="h_boardTitle">
				<h1>자원봉사</h1>
				<p>자원봉사 함께 나아가는 더 나은 세상.</p>
			</article>
		</section>
		<div class="Sn-wrapper1">
			<div class="Sn-wrapper2">
				<div>
					<div>
						<div>
							<div class="Sn-TextLabel">활동보고서</div>
						</div>
					</div>
				</div>


				<header class="entry-header">
					<h1 class="entry-title">${ar.reportTitle}</h1>
					<div class="entry-meta">
						<div class="detail-date">등록일</div>
						<div class="detail-date-">${ar.createDate}</div>
						<div>조회수</div>
						<div>${ar.count }</div>
					</div>
					<div class="entry-meta">
						<div class="detail-date">작성자</div>
						<div class="detail-date-">관리자</div>
					</div>
				</header>


				<div class="table-div">

					<table>
						
						<tr>
							<th class="header">작성일자</th>
							<th colspan="2" style="width: 30%;">${ar.createDate}</th>
							<th class="header" colspan="2">작성자</th>
							<th colspan="2">임도원</th>

						</tr>
						
						<tr>
							<td class="header">제목</td>
							<td class="span-two" colspan="6">${ar.reportTitle}</td>

						</tr>
						
						<tr>
							<td class="header">활동기간</td>
							<td class="span-two" colspan="6">${ar.activityStartDate} ~ ${ar.activityEndDate}</td>
						</tr>

						

						<tr>
							<td class="header" style="height: 500px;">활동내용</td>
							<td class="span-two" colspan="6">${ar.reportContent}</td>
						</tr>

						
						
					</table>
				</div>

				<div class="btn-group">
					<div class="detail-btn">
						<button class="list-btn"
							onclick="window.location.href='${contextPath}/activityreport'">목록</button>
					</div>

				</div>
			</div>
		</div>

	</main>


	<script
		src="${contextPath}/resources/js/sangjun.js/summernote/summernote-lite.js"></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>