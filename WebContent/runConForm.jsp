<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>대회참여 작성 폼</title>
   <!-- 구글폰트 -->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>

  	.runConForm__container{
  		margin: 0 auto;
  		width: 500px;
  		text-align: center;
  		margin-bottom: 30px;
  	}
  	.runConForm__btn{
        font-family: 'Gowun Dodum', sans-serif;
        margin-bottom: 20px;
        width: 178px;
      }
</style>
<script type="text/javascript">
	function done() {
		alert('참가작성이 완료되었습니다');
		runConForm.submit();
	}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
  <div class="runConForm__container">
    <fieldset>
      <legend>대회참여 작성 폼</legend>
      <form action="index.jsp" name="runConForm">
        <ul>
          <li>
            레이스명*
          </li>
          <li>
            <input type="text">
          </li>
          <li>
            담당자명*
          </li>
          <li>
            <input type="text">
          </li>
          <li>
            참가안내(일시, 장소, 종목, 거리)
          </li>
          <li>
            <textarea name="" id="" cols="22" rows="5"></textarea>
          </li>
          <li>
            <button type="submit" class="runConForm__btn" onclick="done();">작성</button>
          </li>
        </ul>
      </form>
    </fieldset>
  </div>
<%@ include file="footer.jsp" %>
</body>
</html>