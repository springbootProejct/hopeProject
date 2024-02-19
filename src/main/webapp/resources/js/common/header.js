$(document).ready(function () {
    $('.h_headerMenu').hide();

    // 소식 hover 이벤트
    $('.hoverToShowMenu_news').hover(function () {
        $('.headerMenu_news').toggle();
    });

    $('.headerMenu_news').hover(function () {
        $('.headerMenu_news').toggle();
        $('.hoverToShowMenu_news').css('color', '#7fa924');
        $('.hoverToShowMenu_news').css('border-bottom', '2px solid #ABC138');
    },function(){
        $('.headerMenu_news').toggle();
        $('.hoverToShowMenu_news').css('color', '');
        $('.hoverToShowMenu_news').css('border-bottom', '');
    });


    // 활동 hover 이벤트
    $('.hoverToShowMenu_activity').hover(function () {
        $('.headerMenu_activity').toggle();
        
    });

    $('.headerMenu_activity').hover(function () {
        $('.headerMenu_activity').toggle();
        $('.hoverToShowMenu_activity').css('color', '#7fa924');
        $('.hoverToShowMenu_activity').css('border-bottom', '2px solid #ABC138');
    },function(){
        $('.headerMenu_activity').toggle();
        $('.hoverToShowMenu_activity').css('color', '');
        $('.hoverToShowMenu_activity').css('border-bottom', '');
    });



    // 후원모집 클릭하면 아래 하단 유지
    // $('#h_support').click(function(){
    //     $(this).css('border-bottom', '2px solid #ABC138');
    //     $('#h_home').css('border-bottom', 'none');
    // });
    
    

});