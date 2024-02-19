<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="../resources/style/css/hyun.css/donateProductForm.css">
    
    
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
   
    <main>
        <h2 style="text-align: center; margin-top: 70px; font-size: 25px;">물품 기부 신청</h2>
        <div class="donateGoodFormBorder" style="margin-left: auto; margin-right: auto;"></div>
        <form action="/insertProduct.bo" class="donateGoodForm" method="POST">
            <div class="donateGoodForm_List">
                <p>문의 유형*</p>
                <p id="h_companyName" name="" hidden>기업명*</p>
                <p id="h_name">이름*</p>
                <p style="height: 85px;">연락처*</p>
                <p>이메일*</p>
                <p style="height: 400px;">기부물품종류*</p>
                <p>기부물품수량*</p>
                <p style="height: 100px;">기부방법*</p>
                <p style="height: 90px;">기부금영수증<br> 발급 여부*</p>
                <p id="h_businessNumber" hidden>사업자번호*</p>
                <p id="h_residentNumer" hidden>주민등록번호*</p>
                <p>기타문의 혹은<br> 요청사항</p>
            </div>
            
            <div style="border: 1px solid #D8D8D8; margin-right: 50px;"></div>

            <div class="donateGoodForm_List_1">
			    <c:choose>
			        <c:when test="${donateType eq '개인'}">
			       		<div style="margin: 0px 0px 10px 0px;">
				            <label class="radio-container">
				                <input name="productType" id="personalItems" type="radio" value="G" checked>
				                <span class="checkmark">개인물품후원</span>
				            </label>
				            <label class="radio-container">
				                <input name="productType" id="businessItems" type="radio" value="B">
				                <span class="checkmark">기업물품후원</span>
				            </label>
			            </div>
			        </c:when>
			        <c:otherwise>
			        	<div style="margin: 0px 0px 10px 0px;">
				            <label class="radio-container">
				                <input name="productType" id="personalItems" type="radio" value="G">
				                <span class="checkmark">개인물품후원</span>
				            </label>
				            <label class="radio-container">
				                <input name="productType" id="businessItems" type="radio" value="B" checked>
				                <span class="checkmark">기업물품후원</span>
				            </label>
			            </div>
			        </c:otherwise>
			    </c:choose>

                <!-- 기업 -->
                <input type="text" id="h_businessNameInput" name="businessName" class="donateGoodInput" placeholder="기업명 입력" hidden>

                <!-- 개인 -->
                <input type="text" id="h_nameInput" name="puserName" class="donateGoodInput" placeholder="이름 입력" >



                <!-- 연락처 -->
                <div>
                    <input type="text" style="width: 350px;" name="phone" class="donateGoodInput" placeholder="'-'빼고 숫자만 입력" required>
                    <input type="button" class="donateGoodBtn" value="인증요청">
                </div>
                <div>
	                <input type="text" style="width: 350px;" id="certificationNumber" class="donateGoodInput" placeholder="인증번호 6자리 입력" required>
	                <input type="button" style="background-color:#abe138;" id="certificationNumberBtn" class="donateGoodBtn1" value="인증 확인">
                </div>

                <!-- 이메일 -->
                <input type="email" class="donateGoodInput" name="email" placeholder="example@hope.co.kr" required>

                <!-- 기부물품종류 -->
                <div class="donateGoodRadio_List">
                    <p>유통기한 1년이상, 새상품만 기부가 가능합니다.</p>
                    <label><input type="radio" name="categoryNo" value="1" required><span>생리대</span></label>
                    <label><input type="radio" name="categoryNo" value="2" required><span>의류/잡화</span></label>
                    <label><input type="radio" name="categoryNo" value="3" required><span>화장품</span></label>
                    <label><input type="radio" name="categoryNo" value="4" required><span>생활용품</span></label>
                    <label><input type="radio" name="categoryNo" value="5" required><span>가전제품 (제조일 기준 10년이하 새상품)</span></label>
                    <label><input type="radio" name="categoryNo" value="6" required><span>유아용품</span></label>
                    <label><input type="radio" name="categoryNo" value="7" required><span>건강기능식품 (식약처 인증)</span></label>
                    <label><input type="radio" name="categoryNo" value="8" required><span>위생용품</span></label>
                    <label><input type="radio" name="categoryNo" value="9" required><span>학용품</span></label>
                    <label><input type="radio" name="categoryNo" value="10" required><span>도서 (중고도서 불가)</span></label>
                </div>

                <!-- 기부물품 수량 -->
                <input type="text" class="donateGoodInput" name="productAmount" placeholder="(예 : 의류 3천벌, 5대봉)" required>

                <!-- 기부방법 -->
                <p style="font-size: 15px;">희망의 조각은 기부금으로 운영되는 단체로 더 많은 이웃을 돕기 위해 기부자 부담으로 물품을 발송해 주시기 바랍니다.</p>
                <select class="donateGoodSelect" required name="productWay">
                    <option value="P" selected>택배발송</option>
                    <option value="B">용달발송</option>
                    <option value="V">방문기부 (10~17시, 점심시간 12시-13시 제외)</option>
                </select>

                <!-- 기부금영수증 발급 여부 -->
                <div class="donateGoodRadio_List">
                    <p style="font-size: 15px; margin-top: 30px;">후원물품 도착 기준 3주 소요되며, 기타 상황에 따라 변동될 수 있습니다</p>
                    <label><input type="radio" id="h_receiptY" name="receipt" value="Y" required><span>예</span></label>
                    <label><input type="radio" id="h_receiptN" name="receipt" value="N" required><span>아니요</span></label>
                </div>

                <!-- 사업자 번호 -->
                <input type="text" id="h_businessNumberInput" name="businessNum" class="donateGoodInput" placeholder="사업자번호 입력" hidden>

                <!-- 주민등록번호 -->
                <input type="text" id="h_residentNumerInput" name="residentNum" class="donateGoodInput" placeholder="주민등록번호 입력" hidden>

                <!-- 기타문의 혹은 요청사항 -->
                <input type="text" name="inquiryContent" style="width: 450px;  height: 150px; margin: 20px 0px 40px 0px;" >
                <input type="submit" class="productBtn" value="신청하기">
            </div>
        </form>
    </main>
    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script>
    $(document).ready(function() {
        // ridao 태그 변경 시 이벤트 처리
        $('input[name="productType"]').on('change', function() {
            var selectedValue = $(this).val();

            if (selectedValue === 'G') {
                // 개인물품후원 선택 시
                $('#h_companyName, #h_businessNumberInput, #h_businessNameInput').hide();
                $('#h_name, #h_nameInput').show();
            } else if (selectedValue === 'B') {
                // 기업물품후원 선택 시
                $('#h_residentNumerInput, #h_residentNumer').hide();
                $('#h_companyName, #h_businessNameInput').show();
            }
        });

        // 초기 설정
        $('input[name="productType"]:checked').trigger('change');

        // 기부금영수증 발급 여부 변경 시 이벤트 처리
        $('input[name="receipt"]').change(function() {
            var isReceiptY = $(this).val() === 'Y';
            var isReceiptN = $(this).val() === 'N';
            var isPersonal = $('input[name="productType"]:checked').val() === 'G';
            var isCompany = $('input[name="productType"]:checked').val() === 'B';

            if (isReceiptY && isPersonal) {
                $('#h_residentNumer, #h_residentNumerInput').show();
                $('#h_businessNumberInput, #h_businessNumber').hide();
            } else if (isReceiptY && isCompany) {
                $('#h_residentNumer, #h_residentNumerInput, #h_businessNumberInput, #h_businessNumber').show();
            } else if (isReceiptN && isPersonal) {
                $('#h_residentNumer, #h_residentNumerInput, #h_businessNumberInput, #h_businessNumber').hide();
            } else if (isReceiptN && isCompany) {
                $('#h_residentNumer, #h_residentNumerInput, #h_businessNumberInput, #h_businessNumber').hide();
            }
        });

        // 개인, 기업 버튼이 변경될 때 실행되는 함수 모든 필드 값 초기화
        $('input[name="productType"]').change(function() {
            // 선택한 옵션을 초기화
            $('input[name="categoryNo"]').prop('checked', false);
            $('.donateGoodInput').val(''); // 모든 input 태그의 값을 초기화
            $('.donateGoodSelect').val(''); // 셀렉트 박스의 선택 값을 초기화
            $('input[name="receipt"]').prop('checked', false); // 기부금영수증 발급 여부 초기화
            $('input[name="inquiryContent"]').val(''); // 기타문의내용 값 초기화
        });
    });
    </script>


</body>
</html>