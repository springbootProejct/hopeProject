<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="./resources/style/css/hyun.css/donateProduct.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="./resources/js/hyun.js/donateProduct.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <section>
        <article class="h_boardTitle">
            <h1>물품기부</h1>
            <p>물품기부를 통해 자원을 재순환 시킵니다.</p>
        </article>
    </section>

    <main style="text-align: center;">
        <h1 class="h_donationGood_division">물품기부 신청자 구분</h1>
        <span>원활한 신청 정보 관리를 위해 해당사항을 선택해주세요!</span>
        <div class="radio_div" style="margin-top: 80px; text-align: center;">
            <!-- 첫 번째 라디오 버튼 -->
            <label class="radio-container">
                <input name="donateGood" type="radio" value="개인" checked>
                <span class="checkmark">개인</span>
            </label>
            <!-- 두 번째 라디오 버튼 -->
            <label class="radio-container">
                <input name="donateGood" type="radio" value="기업">
                <span class="checkmark">기업</span>
            </label>
        </div>

        <!-- 개인 -->
        <div>
            <p class="donate_p" id="donateGood_individual">
                물품기부를 통해 아동청소년, 미혼모, 독거노인, 위기가정, 기타취약계층을 지원하며<br>
                지파운데이션 나눔가게를 통해 자원이 재순환 되고 일자리가 창출되며 환경을 보호할 수 있습니다.
            </p>
        </div>

        <!-- 기업 -->
        <div>
            <p class="donate_p" id="donateGood_enterprise" style="display: none;">
                기업의 판매, 재고물품 기부를 통해<br>
                아동청소년, 미혼모, 독거노인, 위기가정, 기타취약계층을 지원하며<br>
                희망의 조각 나눔가게를 통해 기업의 물품이 자원재순환 되고<br>
                일자리가 창출되며 환경을 보호할 수 있습니다.
            </p>
        </div>

        <div style="border:1px solid black; width: 1100px; margin: 0 auto;"></div>

        <!-- 기부 가능 물품 알아보기 -->
        <div style="text-align: center; margin-top: 50px; margin-bottom: 20px;">
            <h2><img class="donateGoodNumber" src="https://cdn-icons-png.flaticon.com/128/3097/3097244.png">기부가능 물품 알아보기</h2>
            <span>물품 기부는 새상품만 기부 가능합니다.</span>
        </div>
        <section class="donateGoodList" style="text-align: center;">
            <div class="donateGoods">
                <img class="donateGood_images" src="./resources/style/img/product/생리대.png">
                <img class="donateGood_images" src="./resources/style/img/product/의류_잡화.png">
                <img class="donateGood_images" src="./resources/style/img/product/화장품.png">
                <img class="donateGood_images" src="./resources/style/img/product/생활용품.png">
                <img class="donateGood_images" src="./resources/style/img/product/가전제품.png">
                <img class="donateGood_images" src="./resources/style/img/product/유아용품.png">
                <img class="donateGood_images" src="./resources/style/img/product/건강기능식품.png">
                <img class="donateGood_images" src="./resources/style/img/product/위생용품.png">
                <img class="donateGood_images" src="./resources/style/img/product/기타.png">
            </div>
            <div class="donateGoodSelect">
                <ul style="margin:0%;">
                    <li onclick="showImage(0)" class="clicked">생리대</li>
                    <li onclick="showImage(1)">의류/잡화</li>
                    <li onclick="showImage(2)">화장품</li>
                    <li onclick="showImage(3)">생활용품</li>
                    <li onclick="showImage(4)">가전제품</li>
                    <li onclick="showImage(5)">유아용품</li>
                    <li onclick="showImage(6)">건강기능식품</li>
                    <li onclick="showImage(7)">위생용품</li>
                    <li onclick="showImage(8)">기타</li>
                </ul>
            </div>
        </section>

        <!-- 기부 절차 -->
        <section  style="margin-top: 50px; margin-bottom: 50px;">
            <h2><img class="donateGoodNumber" src="https://cdn-icons-png.flaticon.com/128/3097/3097266.png">기부절차</h2>
            <div class="donateGoodHow">
                <div class="donateGoodHowList">
                    <h3><span>01.</span> 후원문의</h3>
                    <p>품목, 수량 등 기부물품의 정보 작성 및 신청</p>
                    <img src="https://cdn-icons-png.flaticon.com/128/7773/7773012.png">
                </div>
                <img class="donateGoodHowList_img" src="https://cdn-icons-png.flaticon.com/128/137/137624.png">
                <div class="donateGoodHowList">
                    <h3><span>02.</span> 접수 및 협의</h3>
                    <p>문의주신 내용을 토대로 기부가능여부 협의</p>
                    <img src="https://cdn-icons-png.flaticon.com/128/5560/5560312.png">
                </div>
                <img class="donateGoodHowList_img" src="https://cdn-icons-png.flaticon.com/128/137/137624.png">
                <div class="donateGoodHowList">
                    <h3><span>03.</span> 물품 기부</h3>
                    <p>후원물품 발송 및 입고</p>
                    <img src="https://cdn-icons-png.flaticon.com/128/12259/12259341.png">
                </div>
                <div class="donateGoodHowList">
                    <h3><span>04.</span> 기부금 영수증 발행</h3>
                    <p>검수 이후 기부금 영수증 발행</p>
                    <img src="https://cdn-icons-png.flaticon.com/128/3734/3734681.png">
                </div>
                <img class="donateGoodHowList_img"src="https://cdn-icons-png.flaticon.com/128/137/137624.png">
                <div class="donateGoodHowList">
                    <h3><span>05.</span> 지원 및 판매</h3>
                    <p>취약계층 직접 지원 및 나눔가게 판매</p>
                    <img src="https://cdn-icons-png.flaticon.com/128/9009/9009879.png">
                </div>
            </div>

        </section>
        
        <!-- 기부 방법 -->
        <section>
            <h1 ><img class="donateGoodNumber" src="https://cdn-icons-png.flaticon.com/128/3097/3097290.png">기부 방법</h1>
            <div class="h_donationGood_articleList">
                <article class="h_donationGood_article">
                    <h3 style="text-align: center; background-color: rgb(201, 200, 200); margin: 0px; padding:20px;">택배발송</h3>
                    <div style="padding: 20px;">
                        <p><img class="donateGoodHow_img" src="https://cdn-icons-png.flaticon.com/128/7949/7949317.png">희망의 조각은 기부금으로 운영되는 단체로, 더많은 이웃을 돕기위해 선불택배로 기부물품을 발송해주시기 바랍니다.</p>
                        <p>박스무게 : 15kg 이하</p>
                        <p>박스크기 : 우체국 5호 박스 사이즈 (가로+세로+높이≤ 120cm 이하)</p>
                        <p><img class="donateGoodHow_img" src="https://cdn-icons-png.flaticon.com/128/7949/7949317.png">후원물품은 물품기부 신청 후 아래의 주소로 발송 부탁드립니다.</p>
                        <p>주소 : 경기도 성남시 분당구 판교로 256번길 7</p>
                    </div>
                </article>
    
                <article class="h_donationGood_article1">
                    <h3 style="text-align: center; background-color: rgb(201, 200, 200); margin: 0px; padding:20px;">직접기증</h3>
                    <div style="padding: 20px;">
                        <p><img class="donateGoodHow_img" src="https://cdn-icons-png.flaticon.com/128/7949/7949317.png">물류창고와 가까운 경우 직접 방문하여 기증하실 수 있습니다.</p>
                        <p><img class="donateGoodHow_img" src="https://cdn-icons-png.flaticon.com/128/7949/7949317.png">방문 전 방문일정 전달 부탁드립니다.</p>
                        <p>문의 : 1588-7701</p>
                    </div>
                </article>
            </div>
        </section>

        <button class="h_donationGood_article_btn" >물품 기부 신청하기</button>
    </main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
		$(document).ready(function() {
		    $(".h_donationGood_article_btn").click(function() {
		        // 선택된 라디오 버튼의 값을 가져오기
		        var donateType = $("input[name='donateGood']:checked").val();
	
		        // donateProductForm.jsp로 값 전달
		        $.ajax({
		            type: "POST",
		            url: "product.bo", // donateProductForm.jsp의 경로에 맞게 수정하세요.
		            data: { donateType: donateType }, // 전달할 데이터
		            success: function(response) {
		                // 성공적으로 값을 전달한 후의 처리
		                console.log("데이터 전달 성공");
		                
		             	// 페이지 이동
		                window.location.href = "product/donateProductForm";
		            },
		            error: function() {
		                // 오류 발생 시 처리
		                console.log("데이터 전달 실패");
		            }
		        });
		    });
		});
	</script>
    
</body>
</html>