<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//String mem_id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
	<!-- 구글폰트 -->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	
	<!-- 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<!-- 자바스크립트 -->
	<script src="resource/js/idCheck.js?ver=2"></script>
<style type="text/css">
      /* 폰트 */
      body{
        font-family: 'Gowun Dodum', sans-serif;
        font-size: 18px;
      	text-align: center;
        }
       .loginFrm{
       	margin: 0 auto;
       	/* width: 1250px; */
       }
       .header__btnbox{
       	font-family: 'Gowun Dodum', sans-serif;
       }
       .loginFrm__container{
       	margin: 0 auto;
       	width: 350px;
       	margin-bottom: 120px;
       }
       .header__btnbox{
       	font-size: 17px;
       	margin-top: 10px;
       }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
  <div class="loginFrm__container">
  <%
  	if(mem_id!= null) {
  %>
  	<h3><%=mem_id %>님 환영합니다.</h3>
  	<h3>로그인 되었습니다. 즐거운 하루 되세요.</h3>
  	<a href="logout.jsp">로그아웃</a>	
  <%
  	} else {
  %>
  
    <form action="loginProc.jsp" method="post" name="loginFrm" class="loginFrm">
      <table align="center">
        <tr>
          <td align="center" colspan="2"><h1>로그인</h1></td>
        </tr>
        <tr>
          <td>아 이 디</td>
          <td><input name="mem_id" id="mem_id" required></td>
        </tr>
        <tr>
          <td>비밀번호</td>
          <td><input type="password" name="mem_pw" id="mem_pw" required></td>
        </tr>
        <tr>
          <td colspan="2" align="center">
            <button value="로그인" class="header__btnbox">로그인</button>
            <button value="회원가입" class="header__btnbox" onclick="location.href='member2.jsp'">회원가입</button>
            <button type="button" class="header__btnbox" value="홈으로" onclick="location.href='index.jsp'">홈으로</button>
          </td>
        </tr>
        
      </table>
    </form>
    <%
  		}
  	%>
  </div>
   		<%@ include file="footer.jsp" %> 
</body>
</html>