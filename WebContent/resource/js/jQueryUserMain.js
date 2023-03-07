$(function(){
  
  // 이미지 왼쪽으로 슬라이드
  // setInterval : 일정시간이 지나고 슬라이드하시오
  setInterval(function() {
      // 맨마지막 사진 처리해줘야돼서 if문을 넣어주면서 공백을 매꿔줌
      if( $('#img').position().left == -2500){
          $('#img').animate({left:'-=1250px'}, function() {
              $('#img').css('left',0)
          })
      } else {
          $('#img').animate({left:'-=1250px'});
      }
  },2000)
})