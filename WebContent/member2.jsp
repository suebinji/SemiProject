<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="DB.*" %> --%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="css/member2.css">
  <!-- 구글폰트 -->
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

	<!-- 제이쿼리 스크립트 -->
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<!-- 자바스크립트 -->
	<script src="resource/js/idVal.js"></script>
  <style type="text/css">
    body{
      font-family: 'Gowun Dodum', sans-serif;
      
    } 
    .member__box3__submit_btn{
  	width: 100%;
  	width: 180px;
  	font-family: 'Gowun Dodum', sans-serif;
}
/* .member__form{
	width:600px;
	align-items: center;
 } */
 .member__box3__idcheck_btn{
 	font-family: 'Gowun Dodum', sans-serif;
 	margin-left: 10px;
 }
 .member__container{
 	margin: 0 auto;
    width: 500px;
 }
h2{ 
 	text-align: center;
 }
 #member__form{
 	margin-bottom: 20px;
}
 </style>
 
</head>
<body>
 <%@ include file="header.jsp" %>
<div class="member__container">
  <div class="member__form">
    <form action="memberReg" method="post" class="member__form" id="member__form">
      <table>
        <div class="member__box1">
          <h2>회원가입</h2>
        </div>
          <div class="member__box2">
          <form name="idCheckFrm" action="get" action="idCheck.me">
          <tr>
          	<label for="mem_id">아이디<br>
          	<input type="text" name="mem_id" id="mem_id" minlength="4" maxlength="15"></label>
            <button class="member__box3__idcheck_btn" onclick="idCheck();">ID중복확인</button>
           	<small style="color:red;">&nbsp;4~13자리 이내의 영문과 숫자</small>
           	<br>
	          </tr>
          </form>
<script>
 function idCheck() {
		const $idInput = $("form input[name = mem_id]");
		
		$.ajax({
			url:"idCheck.me",
			data:{checkId:$idInput.val()}, // checkId 이름은 내마음대로 
			success:function(result){
				//console.log(result);
				if(result == 'idN') {
					alert("이미 사용중인 아이디입니다.");
					$idInput.val("");
					// 기존input에 포커스
					$idInput.focus();
				} else {
					if(confirm("사용가능한 아이디입니다.\n사용하시겠습니까?")) {
						$("form :submit").removeAttr("disabled"); // disabled 속성 삭제
						$idInput.attr("readonly", true); // 확정하면 다시 못바꾸도록 설정
					} else {
						$idInput.focus();
					}
				}
			},
			error:function(){
				console.log("ajax통신실패");
			}
		});
	}
 </script>
          <tr>
            <label for="mem_pw">비밀번호<br>
            <input type="password" name="mem_pw" id="mem_pw" required></label><br>
          </tr>
          <tr>
            <label for="mem_rpw">비밀번호 확인<br>
            <input type="password" name="mem_rpw" id="mem_rpw" required></label><br>
          </tr>
          <tr>
            <label for="mem_name">이름<br>
            <input type="text" name="mem_name" id="mem_name"></label><br>
          </tr>
          <tr>
            <label for="mem_birthday">생년월일<br>
            <input type="text" name="mem_birthday" id="mem_birthday" placeholder="191216"></label><br>
          </tr>
          <tr>
            <label for="mem_gender">성별<br>
            <input type="radio" name="mem_gender" value="1" checked>남&emsp;&emsp;
            <input type="radio" name="mem_gender" value="2" >여</label><br>
          </tr>
          <tr>
            <label for="mem_phone">연락처<br>
            <input type="text" name="mem_phone" placeholder="01012341234"></label><br>
          </tr>
        </div>
        <div class="member__box3">
          <tr><br>
            <button type="submit" class="member__box3__submit_btn" onclick="return validate();">가입하기
          </tr>
        </div>
      </table>
    </form>
   </div>
  </div>
       <%@ include file="footer.jsp" %> 
</body>
</html>