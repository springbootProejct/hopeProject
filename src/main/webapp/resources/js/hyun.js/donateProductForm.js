    $(document).ready(function() {
        // ridao 태그 변경 시 이벤트 처리
        $('input[name="donateGood"]').on('change', function() {
            var selectedValue = $(this).val();

            if (selectedValue === '개인물품후원') {
                // 개인물품후원 선택 시
                $('#h_companyName, #h_manager, #h_businessNumberInput, #h_businessNameInput, #h_managerInput').hide();
                $('#h_name, #h_nameInput').show();
            } else if (selectedValue === '기업물품후원') {
                // 기업물품후원 선택 시
                $('#h_name, #h_residentNumerInput, #h_nameInput, #h_residentNumer').hide();
                $('#h_companyName, #h_manager, #h_businessNameInput, #h_managerInput').show();
            }
        });

        // 초기 설정
        $('input[name="donateGood"]:checked').trigger('change');

        // 기부금영수증 발급 여부 변경 시 이벤트 처리
        $('input[name="donateGoodsreceipt"]').change(function() {
            var isReceiptY = $(this).val() === 'Y';
            var isReceiptN = $(this).val() === 'N';
            var isPersonal = $('input[name="donateGood"]:checked').val() === '개인물품후원';
            var isCompany = $('input[name="donateGood"]:checked').val() === '기업물품후원';

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
        $('input[name="donateGood"]').change(function() {
            // 선택한 옵션을 초기화
            $('input[name="donateGoodType"]').prop('checked', false);
            $('.donateGoodInput').val(''); // 모든 input 태그의 값을 초기화
            $('.donateGoodSelect').val(''); // 셀렉트 박스의 선택 값을 초기화
            $('input[name="donateGoodsreceipt"]').prop('checked', false); // 기부금영수증 발급 여부 초기화
        });
    });