<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- css -->
    <link rel="stylesheet" href="${contextPath }/resources/style/css/common.css">
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="${contextPath }/resources/js/common/header.js"></script>
</head>
<body>
    <header class="common">
        <div class='h_header'>
            <div class="h_headerLogo">
                <a href="${contextPath}"><img class="h_logo_img" src='${contextPath}/resources/style/img/mainPage/HOPE_logo.png' ></a>
            </div>
            <div class='h_headerSelect'>
                <div>
                    <a href="${contextPath }"><div id="h_home">홈</div></a>
                    <a href=""><div id="h_support">후원모집</div></a>
                    <a href="${contextPath}/product"><div id="h_donate">물품기부</div></a>
                    <a href=""><div id="h_activity" class="hoverToShowMenu_activity">활동</div></a>
                    <a href=""><div id="h_news" class="hoverToShowMenu_news">소식</div></a>
                </div>
            </div>
			
			<c:choose>
				<c:when test="${empty loginUser}">
					<!-- 로그인 하지 않을 경우 -->
					<div class='h_headerLogin'>
					    <ul>
					        <li><a href="${contextPath}/login">로그인</a></li>
							<li> | </li>
							<li><a href="${contextPath}/login">회원가입</a></li>
				        </ul>
				    </div>
				</c:when>
		        <c:otherwise>
				   <!-- 로그인 이후 -->
		           <div class="h_headerLogout">
		                 <ul style="margin-left: 25px;"> 
		                     <li>${loginUser.userName} 회원님 환영합니다<img style="width: 17px;" src="https://cdn-icons-png.flaticon.com/128/2338/2338389.png"></li>
		                 </ul>
		                 <ul> 
		                     <li><a>로그아웃</a></li> 
		                     <li> | </li>
		                     <li><a href="${contextPath}/myPage}">마이페이지</a></li> 
		                     <li> | </li> 
		                     <li><a><img style="width:20px" src="https://cdn-icons-png.flaticon.com/128/5465/5465394.png"></a></li>
		                 </ul> 
		           </div> 
		        </c:otherwise>
			</c:choose>

        </div>
        <div class='h_headerMenu headerMenu_news' hidden>
            <ul class='h_headerMenu_1'>
                <h4>소식</h4>
                <li>행복한 변화와 이야기를 전해드립니다.</li>
            </ul>
            <ul class='h_headerMenu_2' >
                <li><a>나눔후기 게시판</a></li>
                <li><a>자유 게시판</a></li>
                <li><a>공지사항</a></li>
                <li><a>자주 묻는 질문 FAQ</a></li>
            </ul>
            <ul class='h_headerMenu_3'>
                <li>
                    <a>
                        <img src='/images/hyun/희망의조각.png' alt="image" />
                    </a>
                </li>
            </ul>
        </div>
        <div class='h_headerMenu headerMenu_activity' hidden>
            <ul class='h_headerMenu_1'>
                <h4>활동</h4>
                <li>도움이 가장 필요한 곳에 후원자님의 사랑을 전달합니다.</li>
            </ul>
            <ul class='h_headerMenu_2'>
                <li><a>봉사활동 지원하기</a></li>
                <li><a>헌혈 게시판</a></li>
            </ul>
            <ul class='h_headerMenu_3'>
                <li>
                    <a>
                        <img src='/images/hyun/희망의조각.png' alt="image" />
                    </a>
                </li>
            </ul>
        </div>
    </header>

</body>
</html>