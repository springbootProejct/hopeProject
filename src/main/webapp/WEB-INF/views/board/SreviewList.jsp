<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="../resources/style/css/sangjun.css/SreviewList.css">
	<style>
	.h_boardTitle{
	  height:330px;
	  padding-top: 100px;
	  background-image: url('../resources/images/board/board1.jpg');
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
							<div>
								<h2 style="text-align: center; margin-top: 70px; font-size: 25px;">나눔후기</h2>
        <div class="donateGoodFormBorder" style="margin-left: auto; margin-right: auto;"></div>
							</div>
						</div>
					</div>

					<div class="Sn-selection">
						<div>
							<div class="Sn-component-1">
								<div class="Sn-chip-1">
								  <c:if test="${not empty loginUser}">
								   <div class="Sn-text-1" onclick="window.location.href='${contextPath}/board/insert/R'">글쓰기</div>
								</c:if>
									
								</div>
								<div class="Sn-chip-2">
									<div class="Sn-text-2" onclick="window.location.href='${contextPath}/board/C'">자유게시판</div>
								</div>
							</div>
						</div>
					</div>

					<div class="Sn-section">
						<div class="Sn-notice-container"></div>
						<div class="Sn-list">
							<c:choose>
							 	<c:when test="${empty list}">
									<div class="Ss-nonList">
										<span>게시글이 없습니다.</span>
									</div>
								</c:when> 
								<c:otherwise>
									<c:forEach var="b" items="${list}">
										<div class="Sn-row">
											<div class="Sn-article" onclick="movePage(${b.boardNo})">
												<div class="Sn-image-container" >
												<c:choose>    
							                            <c:when test="${not empty b.changeName}"> 
															<div class="Sn-notice-image">
																<img src="<c:url value='/resources/images/board/R/${b.changeName}'/>">
															</div>
														</c:when>
														<c:otherwise>
							                            	<div class="Sn-notice-image">
																<img src="<c:url value='/resources/images/board/storydefault.png'/>">
															</div>
							                            </c:otherwise>
							                            </c:choose>
													
							                            
												</div>
												<div class="Sn-notice-frame">
													<div class="Sn-notie-title">${b.boardTitle}</div>													
													<div class="Sn-notice-count">${b.userName}</div>
													<div class="Sn-notice-date">${b.createDate}</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
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
					<form class="search-form" method="get" action="R">
						<div class="archive-search">


							<div class="Sn-btn">
								<select class="custom-select" name="condition">
									<option value="writer"
										${param.condition eq 'writer'? 'selected':'' }>작성자</option>
									<option value="title"
										${param.condition eq 'title'? 'selected':'' }>제목</option>

								</select> <input type="text"
									class="archive-search-text input-md width-280px" name="keyword"
									value="${param.keyword}" placeholder="제목 또는 내용 검색을 입력하세요">
								<input type="submit" class="green" value="검색">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		 <script>  
		function movePage(bno){
			location.href="${contextPath}/board/detail/R/"+bno
		}
		
	</script>
	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>