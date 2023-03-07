<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.*" %>
<jsp:useBean id="bMgr" class="board.BoardMgr"/>
<%
	request.setCharacterEncoding("UTF-8");
	
	int bor_num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
/* 	int fileSize =Integer.parseInt(request.getParameter("filesize"));  */
	
	bMgr.upCount(bor_num);
	
	BoardBean bean = bMgr.getBoard(bor_num);
	
	session.setAttribute("bean", bean); // session에 bean을 통째로 넣음
%>
<script type="text/javascript">
	function list() {
		listForm.submit();
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<!-- 구글폰트 -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
	body{
  		font-family: 'Gowun Dodum', sans-serif;
  		text-align: center;
  	}
  	*{
  		text-decoration: none;
  		list-style: none;
  		color: black;
  	}
</style>
</head>
<body>
	<table align="center" width="700" border="1" cellspacing="0">
		<tr>
			&emsp;&emsp;<th colspan="4" >글읽기</td>
		</tr>
		<tr align="center"> 
			<td bgcolor="#999999">이름</td>
			<td><%=bean.getBor_name()%></td>
			<td bgcolor="#999999">등록날짜</td>
			<td><%=bean.getBor_regdate()%></td>
		</tr>
		<tr>
			<td bgcolor="#999999"  align="center">제목</td>
			<td colspan="3"><%=bean.getBor_subject() %></td>
		</tr>
		<tr >
			<td bgcolor="#999999" align="center" >첨부파일</td>
			<td colspan="3">
			<%-- <%
				String filename = bean.getFilename();
				if(filename != null && !filename.equals("")) {
			%> --%>
				<%-- <a href="javascript:down('<%=filename %>')"><font color="blue"><%=filename %></a>
				<font color="blue">(<%=bean.getFilesize() %> KByte)</font>
			<%		
				}else {
					out.print("등록된 파일이 없습니다");
				}
			%> --%>
			</td>
		</tr>
		<tr>
			<td colspan="4"><br/><pre><%=bean.getBor_content() %></pre><br/></td>
		</tr>
		<tr>
			<%-- <td colspan="4" align="right"><%=bean.getBor_ip() %>로부터 글을 남기셨습니다 / 조회수 <%=bean.getCount() %></td> --%>
		</tr>
		<tr align="center">
			<td colspan="4">
				[ 	
					<a href="javascript:list();">리스트</a> |
					<!-- nowPage,num을 update.jsp로 넘겨주기 -->
					<a href="update.jsp?nowPage=<%=nowPage%>&num=<%=bor_num%>">수 정</a> |
					<a href="reply.jsp?nowPage=<%=nowPage%>">답 변</a> |
					<a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=bor_num%>">삭 제</a>
				]
			</td>
		</tr>
	</table>
	
	<form name="listForm" method="post" action="boardList.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<%
			if(!(keyWord==null || keyWord.equals(""))) {
			%>
				<input type="hidden" name="keyField" value="<%=keyField %>">
				<input type="hidden" name="keyWord" value="<%=keyWord %>">
			<%
			}
		%>
	</form>
</body>
</html>