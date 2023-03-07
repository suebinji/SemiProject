$(function(){

    // 각각 목록 내려오기
    $('.nav>li').mouseover(function(){
        $(this).children('.submenu').stop().slideDown();
    });
    $('.nav>li').mouseout(function(){
        $(this).children('.submenu').stop().slideUp();
    });

    // 목록이 한꺼번에 내려오는것
    // $('.nav>li').mouseover(function(){
    //     $('.submenu').stop().slideDown();
    // });
    // $('.nav>li').mouseout(function(){
    //     $('.submenu').stop().slideUp();
    // });
    // hover(참이면실행,거짓이면실행)도 사용가능함

    // 이미지 왼쪽으로 슬라이드
    // setInterval : 일정시간이 지나고 슬라이드하시오
   /* setInterval(function() {
        // 맨마지막 사진 처리해줘야돼서 if문을 넣어주면서 공백을 매꿔줌
        if( $('#img').position().left == -2500){
            $('#img').animate({left:'-=1250px'}, function() {
                $('#img').css('left',0)
            })
        } else {
            $('#img').animate({left:'-=1250px'});
        }
    },2000)*/
})