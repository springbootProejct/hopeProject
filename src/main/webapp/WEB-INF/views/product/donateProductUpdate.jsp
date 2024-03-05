<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="${contextPath }/resources/style/css/hyun.css/donateProductForm.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
<main>
        <h2 style="text-align: center; margin-top: 70px; font-size: 25px;">물품 기부 신청</h2>
        <div class="donateGoodFormBorder" style="margin-left: auto; margin-right: auto;"></div>
        <form action="${contextPath }/product/productUpdate" class="donateGoodForm" method="POST">
            <div class="donateGoodForm_List">
                <p>문의 유형*</p>
                <p id="h_companyName" name="" hidden>기업명*</p>
                <p id="h_name">이름*</p>
                <p style="height: 85px;">연락처*</p>
                <p>이메일*</p>
                <p style="height: 400px;">기부물품종류*</p>
                <p>기부물품수량*</p>
                <p style="height: 100px;">기부방법*</p>
                <p>기타문의 혹은<br> 요청사항</p>
            </div>
            <div style="border: 1px solid #D8D8D8; margin-right: 50px;"></div>

            <div class="donateGoodForm_List_1">
			    <c:choose>
			        <c:when test="${product.productType eq '개인'}">
			       		<div style="margin: 0px 0px 10px 0px;">
				            <label class="radio-container">
				                <input name="productType" id="personalItems" type="radio" value="개인" checked>
				                <span class="checkmark">개인물품후원</span>
				            </label>
				            <label class="radio-container">
				                <input name="productType" id="businessItems" type="radio" value="기업">
				                <span class="checkmark">기업물품후원</span>
				            </label>
			            </div>
			        </c:when>
			        <c:otherwise>
			        	<div style="margin: 0px 0px 10px 0px;">
				            <label class="radio-container">
				                <input name="productType" id="personalItems" type="radio" value="개인">
				                <span class="checkmark">개인물품후원</span>
				            </label>
				            <label class="radio-container">
				                <input name="productType" id="businessItems" type="radio" value="기업" checked>
				                <span class="checkmark">기업물품후원</span>
				            </label>
			            </div>
			        </c:otherwise>
			    </c:choose>

                <!-- 기업 -->

            	<input type="text" id="h_businessNameInput" name="businessName" class="donateGoodInput" value="${product.businessName}" placeholder="기업명 입력" required>

                <!-- 개인 -->
                <input type="text" id="h_nameInput" name="puserName" class="donateGoodInput" placeholder="이름 입력" value="${product.puserName}" required>



                <!-- 연락처 -->
                <div>
                    <input type="number" style="width: 350px;" name="phone" id="phone" class="donateGoodInput" 
                    value="${product.phone}" placeholder="'-'빼고 숫자만 입력" required>
                    <input type="button" class="donateGoodBtn" id="donateGoodBtn" value="인증요청">
                </div>
                <div>
	                <input type="text" style="width: 350px;" id="certificationNumber" class="donateGoodInput" placeholder="인증번호 4자리 입력" required>
	                <input type="button" style="background-color:#abe138;" id="certificationNumberBtn" class="donateGoodBtn1" value="인증 확인">
                </div>

                <!-- 이메일 -->
                <input type="email" class="donateGoodInput" value="${product.email }" name="email" placeholder="example@hope.co.kr" required>

                <!-- 기부물품종류 -->
                <div class="donateGoodRadio_List">
                    <p>유통기한 1년이상, 새상품만 기부가 가능합니다.</p>
                    <c:forEach var="category" items="${list}">
                    	<c:if test="${category.categoryNo eq product.categoryNo}">
                    		<label><input type="radio" name="categoryNo" value="${category.categoryNo}" required checked><span>${category.categoryName}</span></label>
                    	</c:if>
	                    <label><input type="radio" name="categoryNo" value="${category.categoryNo}" required><span>${category.categoryName}</span></label>
                    </c:forEach>
                </div>

                <!-- 기부물품 수량 -->
                <input type="text" class="donateGoodInput" name="productAmount" placeholder="(예 : 의류 3천벌, 5대봉)" value=${product.productAmount } required>

                <!-- 기부방법 -->
                <p style="font-size: 15px;">희망의 조각은 기부금으로 운영되는 단체로 더 많은 이웃을 돕기 위해 기부자 부담으로 물품을 발송해 주시기 바랍니다.</p>
                <select class="donateGoodSelect" required name="productWay">
                    <option value="택배" ${product.productWay == '택배' ? 'selected' : ''}>택배발송</option>
                    <option value="용달" ${product.productWay == '용달' ? 'selected' : ''}>용달발송</option>
                    <option value="방문" ${product.productWay == '방문' ? 'selected' : ''}>방문기부 (10~17시, 점심시간 12시-13시 제외)</option>
                </select>

                <!-- 기타문의 혹은 요청사항 -->
                <input type="text" name="inquiryContent" style="width: 450px;  height: 150px; margin: 20px 0px 40px 0px;" value="${product.inquiryContent }" >
                <div style="display:flex;">
	                <input type="submit" style="margin-right: 50px; width: 200px; margin-left:0px;" id="modifyBtn" class="productBtn" value="수정하기">
		            <input type="button" style="margin-right: 50px; width: 200px; margin-left:0px;" id="exitBtn" class="productBtn" value="취소">
                </div>
            </div>

        </form>
    </main>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script>
    $(document).ready(function() {
        // ridao 태그 변경 시 이벤트 처리
        $('input[name="productType"]').on('change', function() {
            var selectedValue = $(this).val();

            if (selectedValue === '개인') {
                // 개인물품후원 선택 시
                $('#h_companyName, #h_businessNameInput').hide();
                $('#h_name, #h_nameInput').show();
                $('#h_businessNameInput').prop('required', false);
            } else if (selectedValue === '기업') {
                // 기업물품후원 선택 시
                $('#h_companyName, #h_businessNameInput').show();
                $('#h_businessNameInput').prop('required', true);
            }
        });
        


        // 초기 설정
        $('input[name="productType"]:checked').trigger('change');


        
        // 휴대폰 인증하기

		//휴대폰 번호 인증
		var code2 = "";
		$("#donateGoodBtn").click(function(){
			
		    var phoneNumber = $("#phone").val();
		    
	        // 휴대폰 번호가 입력되지 않은 경우
	        if (phoneNumber === "") {
	            alert("휴대폰 번호를 입력해주세요.");
	            return;
	        }
		    
		    alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
		    $.ajax({
		        type:"POST", // post 형식으로 발송
		        url:"/hope/sendSMS1.do", // controller 위치
		        data: {phone:phoneNumber}, // 전송할 ㅔ이터값
		        cache : false,
		        success:function(data){
		            if(data == "error"){ //실패시 
		                alert("휴대폰 번호가 올바르지 않습니다.")
		            }else{            //성공시        
		                alert("휴대폰 전송이  됨.")
		                code2 = data; // 성공하면 데이터저장
		            }
		        }
		    });
		});		 
		
		//휴대폰 인증번호 대조
		$("#certificationNumberBtn").click(function(){
			
			var certificationNumber = $("#certificationNumber").val().trim();
			
	        // 인증번호가 입력되지 않은 경우
	        if (certificationNumber === "") {
	            alert("인증번호를 입력해주세요.");
	            return;
	        }

			
		    if($("#certificationNumber").val() == code2){ // 위에서 저장한값을 교함
		         alert('인증성공')
		    	
		    }else{
		        alert('인증실패')
		    }
		});
		
	    // 신청하기 버튼 클릭 시
	    $(".productBtn").click(function() {
	        // 입력한 인증번호를 가져옵니다.
	        var certificationNumber = $("#certificationNumber").val();

	        // 입력한 인증번호와 저장된 인증번호를 비교합니다.
	        if (certificationNumber !== code2) {
	            // 인증번호가 일치하지 않는 경우
	            alert("인증번호가 일치하지 않습니다. 다시 확인해주세요.");
	            return false; // 전송을 중지합니다.
	        } else {
	            // 인증번호가 일치하는 경우
	            return true; // 폼을 제출합니다.
	        }
	    });
	    

	    
    });
    </script>
	
</body>
</html>