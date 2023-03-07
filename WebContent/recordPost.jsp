<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록 작성하는 페이지</title>
	<!-- 구글폰트 -->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
	body{
		font-family: 'Gowun Dodum', sans-serif;
	}
	.recordPostFrm{
		width: 700px;
	} 
	.recordPostFrm>fieldset>ul>li{
		list-style: none;
	 }
	.recordPost__container{
		margin: 0 auto;
		width: 700px;
		text-align: center;
		margin-bottom: 50px;
	}
	.recordPostFrm{
		margin: 0 auto;
		width: 300px;
	}
	.recordPost__submit__btn{
		font-family: 'Gowun Dodum', sans-serif;
		margin-bottom: 10px;
		width: 173px;
	}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="recordPost__container">
		<form action="recordPost" class="recordPostFrm" method="post">
			<fieldset>
				<legend>기록 작성 폼</legend>
					<ul>
						<li>이름*</li>
						<li><input name="rec_name"></li>
						<li>날짜*</li>
						<li><input name="rec_date" placeholder="2022-12-17"></li>
						<li>달린 거리(km)*</li>
						<li><input name="rec_dis" placeholder="숫자만입력하세요"></li>
						<li>시간(hh:mm:ss)*</li>
						<li><input name="rec_time"></li>
						<li>느낀점</li>
						<li><textarea rows="7" cols="22" name="rec_diary"></textarea></li>
					<button type="submit" class="recordPost__submit__btn">작성하기</button>
					</ul>
			</fieldset>
		</form>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>