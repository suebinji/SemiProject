<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poll.*, java.util.*" %>
<jsp:useBean id="pMgr" class="poll.PollMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 하는 폼</title>
<!-- 구글폰트 -->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
	* {
      list-style: none;
      color: black;
    }
   body	{
      font-family: 'Gowun Dodum', sans-serif;
     
    }
    .submit__button, .cancel__btn, .result__btn{
    	font-family: 'Gowun Dodum', sans-serif;
    	font-size: 18px;
    }
    .pollForm__btn{
    	text-align: center;
    	margin-top: 30px;
    }
</style>
	<!-- 변수선언 -->
	<%
		int num = 0;
		if(!(request.getParameter("num") == null || request.getParameter("num").equals(""))) { //num값이 있을경우
			num = Integer.parseInt(request.getParameter("num")); //num값을 받아와서 변수 num에 대입
		}
		//변수로 바꿔주기
		//num = 21;
		// num = 0 이면 아래에 값이 실행안되도록 제약 걸어줄수도 있음
		PollListBean plBean = pMgr.getList(num);
		
		String subject = plBean.getPoll_sub();
		String stime = plBean.getPoll_stime();
		String etime = plBean.getPoll_etime();
		int party = plBean.getPoll_party();
		String name = plBean.getPoll_name();
		
		int count = plBean.getCount();
	
	%>
</head>
<body>
<script type="text/javascript">
	function check() {
		if(<%=count%> == <%=party%>) {
			alert('모집인원이 마감되었습니다.');
		}else{
			pollForm.submit();
		}
	}
	
	function participate() {
		$.ajax({
			url:"jqAjaxParti.do",
			data:{participant:$("#partici").val()},
			success: function(result) {
				 console.log(result);
				
				const value = "<p>"
							+ result.partici + "님 참여</p>"
							/* +"<ul>"
							/* +"<li>" + result[i].rec_name + "</li>"
							+"<li>" + result.rec_date + "일</li>"
							+"<li>" + result.rec_dis + "km</li>"
							+"<li>" + result.rec_time + "</li>"
							+"<p>정말 멋지십니다!</p>"
							+"</ul>" */;
							
				$("#particioutput").html(value);
			},
			error:function(){
				console.log("ajax통신실패");
			}
		});
	}
	
	function submit() {
		/* 클릭하면 폼의 히든값의 value= 들어오는 input의 val */
		submitForm.submit();
	}
</script>
<div class="pollForm__container">
	<form name="pollForm" action="pollFormProc.jsp" method="post">
		<fieldset style="margin: 0 auto; width: 420px; padding: 40px; text-align: center;">
			<legend align="center">투표하는 폼</legend>
			<ul>
	          <li>
	            <h3>오늘의 장소   :   <%=subject %></h3>
	          </li>
	          <li>
	            <h3>달릴 시간    :    <%=stime %> ~ <%=etime %></h3>
	          </li>
	          <li>
	            <h3>모집 인원    :    (  <%=count %>   /  <%=party %>)</h3>
	           
	          </li>	
	          <li>
	            <h3>모집자    :    <%=name %></h3>
	          </li>
	          <li>
	            <h3>참여자    :   <input name="partici" id="partici" onclick="submit();">
	            				<button onclick="participate();">참여자보기</button>
	            				
	            				<!-- <div id="particioutput">
	            					
	            				</div> -->
	            				</h3>
	          </li>
	          
	          <li>
	            <input type="radio" name="poll_parti_btn" value="1" style="margin-top: 20px;"> 참여
	            <input type="radio" name="poll_parti_btn" value="0" checked> 미참여
	          </li>	
			</ul>
			<div class="pollForm__btn">
				<%
					if(count==party ) {
					
				%>
				
					<button onclick="check();" class="submit__button" disabled>투표하기</button>
				<%		
					} else if (count < party){
				%>
					<button onclick="check();" class="submit__button" >투표하기</button>
				<%
					}
				%>
				<!-- <button onclick="" class="cancel__btn">취소하기</button> -->
				<button class="result__btn" onclick="javascript:window.open('pollView.jsp?num=<%=num %>' ,'PollView'
				, 'width=500, height=350')">결과보기</button>

			</div>
			<input type="hidden" name="num" value="<%=num %>">
		</fieldset>
	</form>
	<form action="jqAjaxParti.do">
		<input type="hidden">
	</form>
</div>
</body>
</html>