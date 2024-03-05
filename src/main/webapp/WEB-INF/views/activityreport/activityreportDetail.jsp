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
	href="${contextPath}/resources/style/css/sangjun.css/summernote/summernote-lite.css">
<link rel="stylesheet"
	href="${contextPath}/resources/style/css/dowon.css/activityreportDetail.css">

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
		<div class="ar-wrapper1">
			<div>
				<div>
					<div>
						<div>
							<div class="ar-TextLabel">활동보고서</div>
						</div>
					</div>
				</div>


				<header class="ar-header">
					<h1 class="entry-title">${ar.reportTitle}</h1>
					<div class="ar-meta">
						<div class="detail-date">등록일</div>
						<div class="detail-date">${ar.createDate}</div>
						<div>조회수</div>
						<div>${ar.count }</div>
					</div>
					<div class="ar-meta">
						<div class="detail-date">작성자</div>
						<div class="detail-date-">관리자</div>
					</div>
				</header>


				<div class="table-div">

					<table>
						
						<tr>
							<th class="header">작성일자</th>
							<td colspan="2" style="width: 30%;">${ar.createDate}</td>
							<th class="header" colspan="2">작성자</th>
							<td colspan="2">관리자</td>
						</tr>
						
						<tr>
							<th class="header">제목</th>
							<td class="span-two" colspan="6">${ar.reportTitle}</td>

						</tr>
						
						<tr>
							<th class="header">활동기간</th>
							<td class="span-two" colspan="6">${ar.activityStartDate} ~ ${ar.activityEndDate}</td>
						</tr>


						<tr>
							<th class="header" style="height: 500px;">활동내용</th>
							<td class="span-two" colspan="6">${ar.reportContent}</td>
						</tr>

						
						
					</table>
				</div>

				<div class="btn-group">
					<div class="detail-btn">
						<button class="list-btn"
							onclick="window.location.href='${contextPath}/activityreport'">목록</button>
						<button class="list-btn"
							onclick="window.location.href='${contextPath}/activityreport'">삭제</button>
					</div>

				</div>
			</div>
		</div>

	</main>


	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>