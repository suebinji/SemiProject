<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<%
	request.setCharacterEncoding("UTF-8");
	String mem_id = request.getParameter("mem_id");
	String mem_pw = request.getParameter("mem_pw");
	String msg = "회원가입을 완료하거나, 아이디가 맞는지 확인해주세요";
	String url = "login.jsp";
	
	boolean result = mMgr.loginMember(mem_id, mem_pw);
	if(result) {
		session.setAttribute("idKey", mem_id);
		
		msg = "로그인 하였습니다.";
		url = "index.jsp";
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인Proc</title>
</head>
<body>
<script type="text/javascript">
	alert("<%=msg %>");
	location.href = "<%=url %>";
</script>
</body>
</html>