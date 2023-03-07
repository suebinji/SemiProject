<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poll.*, java.util.*" %>
<jsp:useBean id="pMgr" class="poll.PollMgr"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>참여 모집 폼</title>
  <!-- 구글폰트 -->
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
  <style type="text/css">
    *{
      list-style: none;
      color: black;
    }
    .poll__container{
    	margin: 0 auto;
    	width: 600px;
    }
    body>poll__container{
      font-family: 'Gowun Dodum', sans-serif;
      margin: 0 auto;
      width: 600px;
      height: 800px;
    }
    .poll__container{
      display: flex;
      align-items: center;
      margin-top: 50px;
    }
    .poll__box3 button{
    	font-family: 'Gowun Dodum', sans-serif;
    	padding: 5px;
    	width: 100px;
    }
    .poll_submit_btn{
    	margin-top: 20px;
    	margin: 0px 100px;
    	
    }
    .main_btn{ 
    	margin: 0px 12px;
    }
    .poll__box3{
    	margin-top: 30px;
    }
    .poll__box2__h4{
    	margin: 10px;
    }
</style>

</head>
</head>
<body>
<%@ include file="header.jsp" %>
  <div class="poll__container">
    <form action="pollInsertProc.jsp" name="pollForm">
    	<fieldset style="padding:16px;">
  			<legend style="text-align: center;">참여 모집 폼</legend>
    			<ul>
			      <div class="poll__box1">
			        <h4 class="poll__box2__h4">오늘의 장소 : <input name="poll_sub"></h4>
			      </div>
			      <div class="poll__box2">
			        	<li>
			        		<h4 class="poll__box2__h4">시간 : <input type="text"  name="poll_stime" placeholder="오전 07:00"> ~ 
			        				<input type="text" name="poll_etime" placeholder="오전 08:00"/>
			        		</h4>

			        	</li>
			          <li>
			        		<h4 class="poll__box2__h4">모집인원 : <input name="poll_party"></h4>
			          </li>
			          <li>
			        		<h4 class="poll__box2__h4">연락처 : <input name="poll_phone" placeholder="-제외하고 입력"></h4>
			          </li>
			          <li>
			        		<h4 class="poll__box2__h4">이름 : <input name="poll_name"></h4>
			          </li>
			        </ul>
			      <div class="poll__box3">
			      	<span class="poll_submit_btn">
			      		<button name="poll_submit_btn" type="submit">작성하기</button>
			      	</span>
			      	<span class="main_btn">
			      		<button name="main_btn" type="submit">메인으로</button>
			      	</span>
			      	</div>
			      </div><br>
	    	</fieldset>
	    </form>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>