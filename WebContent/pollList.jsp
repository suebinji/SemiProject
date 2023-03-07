<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poll.*, java.util.*" %>
<jsp:useBean id="pMgr" class="poll.PollMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 리스트 페이지</title>
<style type="text/css">
	a {
		text-decoration: none;
	}
	.pollList__container{
		margin-bottom: 30px;
	}
	
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="pollList__container">
		<jsp:include page="pollForm.jsp"/>
		<br><!-- <hr width="700px"> -->
	
	<h2 align="center" style="margin: 20px;">장소리스트</h2>
	<table border="1" align="center" cellspacing="0" style="margin: 0 auto; width: 500px; text-align: center;">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
		</tr>
		<%
			Vector<PollListBean> vlist = pMgr.getAllList();
			int count = vlist.size();
			
			for(int i=0; i<vlist.size(); i++){
				PollListBean plBean = vlist.get(i);
				
				int num = plBean.getPoll_num();
				String subject = plBean.getPoll_sub();
				String name = plBean.getPoll_name();
				
		%>
			<tr>
				<td><%=count %></td>
				<td><a href="pollList.jsp?num=<%=num %>&subject=<%= subject %>"><%=subject %> </a></td>
				<td><%=name %></td>
			</tr>
		<%
				count--;
			}
		%>
		<tr>
			<td colspan="3" align="right"><a href="pollInsert.jsp" style="padding:10px;">장소 작성하러 고고</a>
		</tr>
	</table>
	</div>
		<%@ include file="footer.jsp" %>
</body>
</html>