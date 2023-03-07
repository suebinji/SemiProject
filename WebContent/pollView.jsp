<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poll.*, java.util.*" %>
<jsp:useBean id="pMgr" class="poll.PollMgr"/>
<jsp:useBean id="piMgr" class="poll.PollItemMgr"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	int num = 0; // 클릭하지 않으면 0
	if(!(request.getParameter("num") == null || request.getParameter("num").equals(""))) {
		num = Integer.parseInt(request.getParameter("num"));
	}
	//int sum = pMgr.sumCount(num);
	Vector<PollItemBean> vlist = pMgr.getView(num);
	PollListBean plBean = pMgr.getList(num);
	
	String subject = plBean.getPoll_sub();
	String stime = plBean.getPoll_stime();
	String etime = plBean.getPoll_etime();
	String name = plBean.getPoll_name();
	
	
	PollItemBean piBean = piMgr.getParti(name);
	String partici = piBean.getPartici();
	//Random r = new Random();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>투표 결과페이지</title>
  
  <style>
    .pollView__container>fieldset>ul>li{
      list-style: none;
      text-decoration: none;
    }
    .pollView__container>fieldset{
      text-align: center;
      width: 500px;
    }
    .pollView__closebtn>a {
    	text-align : center; 
    	text-decoration: none; 
    	color: black;
    	list-style: none;
    }
    
  </style>
</head>
<body>
  <div class="pollView__container">
	<fieldset>
		<legend>런닝으로 오늘 하루의 스트레스를 날려보세요!</legend>
		 <ul>
       <li>
         장소 : <%=subject %><br><br>
         
         시간 : <%=stime %>~<%=etime %><br><br>
         
         모집자 : <%=name %><br><br>
         
         참여자 : <%=partici %><br><br>
       </li>
      </ul>
	</fieldset>
    <br>
      <h2>오늘의 장소는?</h2>
    <br>
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.9016723127534!2d126.89478971497894!3d37.53381507980404!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9ec3afcd675b%3A0x1d3b8e50a735e00a!2z7J2066CI67mM65Sp!5e0!3m2!1sko!2skr!4v1671448299016!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
	</div>
	<div class="pollView__closebtn">
		<a href="javascript:window.close()">닫기</a>
	</div>
</body>
</html>