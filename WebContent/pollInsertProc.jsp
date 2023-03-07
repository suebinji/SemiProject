<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="pMgr" class="poll.PollMgr"/>
<jsp:useBean id="plBean" class="poll.PollListBean"/>
<jsp:setProperty property="*" name="plBean"/>
<%-- <jsp:useBean id="piBean" class="poll.PollItemBean"/>
<jsp:setProperty property="*" name="piBean"/> --%>
<%
	int result = pMgr.insertPoll(plBean);
	String msg = "메인으로!";
	String url = "pollInsert.jsp";
	
	if(result==1) {
		msg = "투표 폼 등록 완료! 재밌게 달리세요!";
		url = "pollList.jsp";
	} else {
		msg ="메인으로!";
		url = "index.jsp";
	}
	/* 
	String item = request.getParameter("poll_stime") + "~"
					+ request.getParameter("poll_etime");
	plBean.set */

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("<%=msg %>");
	location.href="<%=url%>";
</script>
</head>
<body>

</body>
</html>