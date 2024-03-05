<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="resources/style/css/sangjun.css/SnoticeList.css">
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
							<div>
								<div class="Sn-TextLabel">활동보고서</div>
							</div>
						</div>
					</div>

					<div class="Sn-selection">
						<div>
							<div class="Sn-component-1">
								<div class="Sn-chip-1">
									<c:if test="${not empty loginUser}">
										<div class="Sn-text-1"
											onclick="window.location.href='${contextPath}/activityreportinsert'">글쓰기</div>
									</c:if>
								</div>

							</div>
						</div>
					</div>

					<div class="Sn-section">
						<table class="Sn-table">
							<thead>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성날짜</th>


							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list}">
										<tr>
											<td colspan="5">게시글이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="ar" items="${list}">
											<tr onclick="movePage(${ar.reportNo})">
												<td>${ar.reportNo}</td>
												<td>${ar.reportTitle}</td>
												<td>관리자</td>
												<td>${ar.createDate}</td>

											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>


							</tbody>
							<!-- 리스트의 각 항목에 대해 이 구조를 반복합니다 -->
						</table>
					</div>

					<c:if test="${not empty param.condition}">
						<c:set var="url"
							value="&condition=${param.condition}&keyword=${param.keyword}" />
					</c:if>

					<div id="pagingArea">
						<ul class="pagination">
							<c:if test="${pi.currentPage ne 1}">
								<li class="page-item"><a class="page-link"
									href="?currentPage=${pi.currentPage-1}${url}">Previous</a></li>
							</c:if>
							<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
								<li class="page-item"><a class="page-link"
									href="?currentPage=${p}${url}">${p}</a></li>
							</c:forEach>
							<c:if test="${pi.currentPage ne pi.maxPage}">
								<li class="page-item"><a class="page-link"
									href="?currentPage=${pi.currentPage+1}${url}">Next</a></li>
							</c:if>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</main>
	<script>
		function movePage(arno){
			location.href="${contextPath}/activityreport/"+arno
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>