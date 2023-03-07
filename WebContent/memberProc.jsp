<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="member.MemberBean"/>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");
	
	boolean result = mMgr.insertMember(bean);
	String msg = "failed";
	String url = "member2.jsp";
	
	if(result) {
		msg = "success";
		url = "login.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>
</head>
<body>
	
</body>
</html>