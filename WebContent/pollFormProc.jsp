<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pMgr" class="poll.PollMgr"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표Proc폼</title>
<%
	request.setCharacterEncoding("UTF-8");
	int val = Integer.parseInt(request.getParameter("poll_parti_btn")); // 버튼:check = 1
	int num = Integer.parseInt(request.getParameter("num"));
	String[] itemnum = request.getParameterValues("itemnum");
	if(val ==1) {
		pMgr.updatePoll(num);
	} else {
		pMgr.downPoll(num);
	}
	response.sendRedirect("pollList.jsp?num=" + num);
%>
</head>
<body>
<script type="text/javascript">
	
	
</script>
</body>
</html>