<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<%
	request.setCharacterEncoding("UTF-8");
	String mem_id = request.getParameter("mem_id");
	boolean result = mMgr.checkId(mem_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 검사</title>
</head>
<body>
<%
	if(result) {
%>
	<p><%=mem_id %>는 이미 존재하는 ID입니다.<p/><br>
<%
	} else {
%>
	<p><%=mem_id %>는 사용가능합니다.<p/><br>
<%
	}
%>
	<a href="" onclick="self.close()">닫기</a>
</body>
</html>