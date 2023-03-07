<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="calendar.*" %> --%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록결과 보여지는 페이지</title>
 <!-- 구글폰트 -->
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/a8328ce5fc.js" crossorigin="anonymous"></script>
<script>
	function read(num) {
		readForm.num.value=num;
		readForm.action="recordRead.jsp";
		readForm.submit();
	}
</script>
<style>
	body{
		font-family: 'Gowun Dodum', sans-serif;
	}
	.recordResultCal__container>table{ 
		width: 700px; margin: auto;
	}
	th{
		border: 1px solid black; 
		background-color: silver; 
		padding: 5px; 
		width: 100px;
	}
	td{
		border: 1px solid black;
		height: 60px;
		font-size: 12pt; 
		vertical-align: top;
		text-align: right;
		padding: 10px;
	}
	a{
		text-decoration: none;
		color: black;
	}
	.red{
		color: red;
	}
	.blue{ 
	color: blue;
	}
	.recordResultCal__container{
		margin-bottom: 50px;
		margin: 0 auto;
		width: 1250px;
	}
	
	
</style>
<%
	Calendar cal = Calendar.getInstance();
	int yy = cal.get(Calendar.YEAR);
	int mm = cal.get(Calendar.MONTH) + 1; // 1~12월
	
	try {
		yy = Integer.parseInt(request.getParameter("yy"));
	} catch(Exception e) {
		yy = cal.get(Calendar.YEAR);
	}
	try {
		mm = Integer.parseInt(request.getParameter("mm"));
	} catch(Exception e) {
		mm = cal.get(Calendar.MONTH) + 1;
	}
	if(mm == 13) {
		yy++;
		mm =1;
	}
	if(mm==0) {
		yy--;
		mm=12;
	}
	// 유효성 검사 : 날짜가 안맞으면 현재 년월 가지도록
	if(yy<=0 || mm <1 || mm >12) {
		yy = cal.get(Calendar.YEAR);
		mm = cal.get(Calendar.MONTH)+1;
	}
	// 1일의 요일과 그 달의 마지막 날짜를 알아내서 날짜를 1일로 바꾼다.
	cal.set(yy, mm-1,1); // cal변수는 1~12월을 0~11로 나타내므로 -1해주기
	// 요일을 1~7로 알려준다. 1: 일요일 7: 토요일
	int w = cal.get(Calendar.DAY_OF_WEEK);
	// 그 달의 마지막 날짜를 알아낸다.
	int lastday =cal.getActualMaximum(Calendar.DATE);
%>
<script>
	function loadFn() {
		alert("데이터 요청");
		$.ajax({
			url:"recordResult.me",
			data:{},
			type:"get",
			success:function(data){
				var json = JSON.
			}
		})
	}
</script>


</head>
<body>
<%@ include file="header.jsp" %>
	<div class="recordResultCal__container" style="margin-bottom: 50px;">
		<table>
	 		<tr>
	 			<td colspan="7" align="center" style="border: none; text-align: center"><h2>오늘의 기록</h2></td>
	 		</tr>
			<tr>
				<td colspan="2" align="center" style="border: none; text-align: right; height: 40px;">
					<a href="?yy=<%=yy-1 %>&mm=<%=mm %>">◀</a>
					<a href="?yy=<%=yy%>&mm=<%=mm-1 %>">◁</a>
				</td>
				<td colspan="3" align="center" style="border: none; text-align: center; height: 40px; font-size: 18pt;">
					<%=String.format("%04d년 %02d월", yy, mm) %>
				</td>
				<td colspan="2" align="center" style="border: none; text-align: left; height: 40px;">
					<a href="?yy=<%=yy %>&mm=<%=mm+1 %>">▷</a>
					<a href="?yy=<%=yy+1%>&mm=<%=mm %>">▶</a>
				</td>
				<p class="">
					기록작성시 이름 : <input name="name" id="input3">
					<button onclick="test3();">기록조회</button><br>
					<div id="output3" class="output3" style="margin-top: 6px; margin-left: 68px;"></div>
				</p>
			</tr>
			<tr>
				<th>S</th><th>M</th><th>T</th><th>W</th><th>T</th><th>F</th><th>S</th>
			</tr>
			<tr>
	<script type="text/javascript">
		function test4() {
			$.ajax({
				url: "jqAjax4.do",
				success:function (result) {
					console.log(result);
					
					let value ="";
					for(let i=0; i<result.length;i++) {
						value += "<p>"
								+ result[i].rec_name + "님 기록</p>"
								+"<ul>"
								/* +"<li>" + result[i].rec_name + "</li>" */
								+"<li>" + result[i].rec_date + "일</li>"
								+"<li>" + result[i].rec_dis + "km</li>"
								+"<li>" + result[i].rec_time + "</li>"
								+"<p>정말 멋지십니다!</p>"
								+"</ul>";
					}
					$("#id1").html(value);
					
				},
				error:function(){
					console.log("ajax통신실패");
				}
			});
		}
		//팝업창 띄우기
		function test5() {
			var w = window.open("about:blank","content","width=300, height=300");
			$.ajax({
				url: "jqAjax4.do",
				success:function (result) {
					console.log(result);
					w.location.href = "index.jsp";
					let value ="";
					for(let i=0; i<result.length;i++) {
						value += "<p>"
								+ result[i].rec_name + "님 기록</p>"
								+"<ul>"
								+"<li>" + result[i].rec_name + "</li>" 
								+"<li>" + result[i].rec_date + "일</li>"
								+"<li>" + result[i].rec_dis + "km</li>"
								+"<li>" + result[i].rec_time + "</li>"
								+"<p>정말 멋지십니다!</p>"
								+"</ul>";
					}
					//$("#id1").html(value);
				},
				error:function(){
					console.log("ajax통신실패");
				}
			});
		}
		// alert창 띄우기
		function test6() {
			var data = {};
			data["name"] = $('#name').val();
			data["age"] = $('#age').val();
			//var w = window.open("about:blank","content","width=300, height=300");
			$.ajax({
				url: "jqAjax4.do",
				contentType: "application/json; charset=utf-8",
				type: "POST",
				dataType: "json",
				data:JSON.stringify(data),
				success:function (response) {
					console.log(result);
					//w.location.href = "index.jsp";
					alert(response.name + response.age);
					
					let value ="";
					for(let i=0; i<result.length;i++) {
						value += "<p>"
								+ result[i].rec_name + "님 기록</p>"
								+"<ul>"
								+"<li>" + result[i].rec_name + "</li>" 
								+"<li>" + result[i].rec_date + "일</li>"
								+"<li>" + result[i].rec_dis + "km</li>"
								+"<li>" + result[i].rec_time + "</li>"
								+"<p>정말 멋지십니다!</p>"
								+"</ul>";
					}
					//$("#id1").html(value);
				},
				error:function(){
					console.log("ajax통신실패");
				}
			});
		}
	</script>
		
	<script type="text/javascript">
		function test3() {
			$.ajax({
				url:"jqAjax3.do",
				data:{name:$("#input3").val()},
				success: function(result) {
					 console.log(result);
					
					const value = "<p>"
								+ result.rec_name + "님 기록</p>"
								+"<ul>"
								/* +"<li>" + result[i].rec_name + "</li>" */
								+"<li>" + result.rec_date + "일</li>"
								+"<li>" + result.rec_dis + "km</li>"
								+"<li>" + result.rec_time + "</li>"
								+"<p>정말 멋지십니다!</p>"
								+"</ul>";
								
					$("#output3").html(value);
				},
				error:function(){
					console.log("ajax통신실패");
				}
			});
		}
	</script>
				<%
					// 1일의 요일을 맞추기 위해 공백 출력
					for(int i =1; i<w; i++) out.println("<td>&nbsp;</td>");
					// 1일부터 마지막 날짜까지 날짜 출력, 출력한날이 토요일이면 줄바꿈
					for(int i =1; i<=lastday;i++) {
						//출력한 날의 요일을 구한다.
						cal.set(yy,mm-1,i);
						w = cal.get(Calendar.DAY_OF_WEEK);
						
						if(w==1)
							out.println("<td id='id1'><a href=javascript:void(0); onclick=test4(); class='red'>" + i + "</a></td>");
						else if (w==7)
							out.println("<td id='output3'><a href=javascript:void(0); onclick=test3(); class='blue'>" + i + "</a></td>");
						else
							out.println("<td><a href=javascript:void(0); onclick=test4();>" + i + "</a></td>");
						if(w==7) {
							out.println("</tr>");
							if(i<lastday) out.println("<tr>");
						}
					}
					// 마지막 날짜인 순간부터 칸을 채운다
					if(w!=7) {
						for(int i =w; i<7;i++) out.println("<td>&nbsp;</td>");
						out.println("</tr>");
					}
				%>
			</tr>
		</table>
			<ul>
				<li id="id2"></li>
			</ul>
		<div id="id3"></div>
	</div>
	<%
		request.setCharacterEncoding("UTF-8");
		int nowPage = 1;
		String keyField = "";
		String keyWord = "";
		if(request.getParameter("keyWord") != null) {
			keyWord = request.getParameter("keyWord");
			keyField = request.getParameter("keyField");
		}
		
	%>
	<form action="readForm" method="get">
		<input type="hidden" name="num">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	</form>
<%@ include file="footer.jsp" %>
</body>
</html>