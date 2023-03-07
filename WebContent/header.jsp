<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String mem_id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <link rel="stylesheet" href="resource/css/header.css">
    <!-- 구글폰트 -->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="resource/js/jQueryUser.js"></script>
</head>
<body>
    <header>
    <div class="header__twoboxcon">
      <div class="header__container">
        <div class="logo">
          <a href="index.jsp">
            <img src="resource/img/logo.png" alt="로고" id="logo">
            <h2>모여요 런닝의 숲</h2>
          </a>
        </div>
        <div class="header__first">
          <ul class="nav">
            <li><a href="">오 운 런</a>
              <ul class="submenu">
                <li><a href="pollInsert.jsp">투표등록</a></li>
                <li><a href="pollList.jsp">투표참여</a></li>
                <li><a href="runConForm.jsp">대회참여</a></li>
              </ul>
            </li>
            <li><a href="">오 운 완</a>
              <ul class="submenu">
                <li><a href="recordPost.jsp">기록하기</a></li>
                <li><a href="recordResultCalendar.jsp">기록보기</a></li>
                <li><a href="boardList.jsp">일단달렷</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
      <nav class="header__second">
        <ul class="navbar__login">
        	<% 
        		if(mem_id == null) {
        	%>
            <li><a href="login.jsp">로그인</a></li>
        	<%
        		} else {
        	%>
            <li><a href="logout.jsp">로그아웃</a></li>
        	<%
        		}
        	%>
        	<li><a href="member2.jsp">회원가입</a></li>
            <li><a href="#">마이페이지</a></li>
        </ul>
      </nav>
      </div>
      <div class="header__third">
      	<%
      		if(mem_id != null) {
      	%>
      		<p>[<b><%=mem_id %></b>님 로그인 상태입니다.]</p>
      	<%
      		}
      	%>
      </div>
    </header>
</body>
</html>