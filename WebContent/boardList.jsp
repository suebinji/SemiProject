<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.*" %>
<jsp:useBean id="Bbean" class="board.BoardBean"/>
<jsp:useBean id="bMgr" class="board.BoardMgr"/>
<%
	request.setCharacterEncoding("UTF-8");
	
	int totalRecord = 0; // 전체 레코드 수(행의 수)
	int numPerPage = 10; // 1페이지당 레코드 수
	int pagePerBlock = 5; // 블록당 페이지 수 [1][2][3][4][5] // next에는 [6][7][8][9][10] 나오도록
	
	int totalPage = 0; // 전체 페이지 수(레코드가 54개면, 페이지 수는 [1][2][3][4][5][6])
	int totalBlock = 0; // 전체 블록 수 = 2개 ([1][2][3][4][5]까지 한블록, [6] 두블록)
	
	int nowPage = 1; // 사용자가 현재 어디 페이지를 보고 있는가(0이 없스무니다!)
	int nowBlock = 1; // 현재 보고있는 블록 (int pagePerBlock = 5에서 5개로 설정했으므로!)
	
	int start = 0;
	int end =0;
	ArrayList<BoardBean> alist = null;
	int listSize = 0;
	// 각 페이지의 시작번호
	//start = nowPage * numPerPage; // 2*10이면, 20 19 18 17 ... 11 
	start = (nowPage * numPerPage) - numPerPage + 1; // 이렇게 써줘야 각 페이지당 시작번호가 됨
	end = nowPage * numPerPage; // 각 페이지당 끝번호
%>
<script type="text/javascript">
	function list() {
		listForm.action="boardList.jsp";
		listForm.submit();
	}
	
	function read(num) {
		readForm.num.value=num;
		readForm.action="boardRead.jsp";
		readForm.submit();
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
	<!-- 구글폰트 -->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
	body{
  		font-family: 'Gowun Dodum', sans-serif;
  		text-align: center;
  	}
  	a{
  		text-decoration: none;
  		color: black;
  	}
  	option, select, .boardList__submit_btn{
  		font-family: 'Gowun Dodum', sans-serif;
  	}
  	.boardList__container{
  		margin: 0 auto;
  		width: 500px;
  	}
  	.boardList__formbox{
  		border-top: 1px solid #ddd;
  		margin: 20px 0px 50px 30px;
  	}
  	.boardList__tablebox{
  		margin-top:30px;
  	}
  	.boardList__submit_btn{
  		width:50px;
  	}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="boardList__container">
		<h1>게시판</h1><p/>
		<div class="boardList__tablebox">
			<table align="center">
				<tr>
					<td colspan="5"></td>
				</tr>
				<tr>
					<td style="padding-right: 30px;">번호</td>
					<td style="padding-left: 27px;">제목</td>
					<td style="padding-left: 30px;">이름</td>
					<td style="padding-left: 71px;">날짜</td>
					<td style="padding-left: 54px;">조회수</td>
				</tr>
				<!-- 게시글 가져오기 -->
	<%
		String keyField = "", keyWord="";
		if(request.getParameter("keyWord") != null) {
			keyWord = request.getParameter("keyWord");
			keyField = request.getParameter("keyField");
		}
		
		
		
		alist = bMgr.getBoardList(keyField, keyWord, start, end);
		listSize = alist.size();
		if(alist.isEmpty()) {
	%>
		<tr><td colspan="5">등록된 게시물이 없습니다</td></tr>
	<%
		} else {
			for(int i = 0; i< end ; i++) {
				if(i == listSize)
					break;
				
				BoardBean bean = alist.get(i);
				int bor_num = bean.getBor_num();
				String bor_subject = bean.getBor_subject();
				String bor_name = bean.getBor_name();
				String bor_regdate = bean.getBor_regdate().substring(0,11);
				int bor_count = bean.getBor_count();
				int bor_depth = bean.getBor_depth();
	%>
	
				<tr>
					<td align="center" style="padding-right: 30px;"><%=bor_num %></td>
					<td align="center"><a href="javascript:read(<%=bor_num%>)"><%=bor_subject %></a></td>
					<td align="center" style="padding-left: 27px;"><%=bor_name %></td>
					<td align="center" style="padding-left: 47px;"><%=bor_regdate %></td>
					<td align="center" style="padding-left: 48px;"><%= bor_count%></td>
				</tr>
	<%		
			}
		}
	%>			
				<!-- 답글 들여쓰기 기능 -->
				
				<!-- 상세페이지 이동 -->
				
				<!-- 페이징 처리 -->
				<tr>
					<td colspan="2" align="center">
					
					</td>
				<!-- 페이징 처리 끝 -->
					
				</tr>
			</table>
		</div> <!-- boardList__tablebox -->
		<div class="boardList__formbox">
			<form action="boardList.jsp" name="searchFrm" method="get">
				<table align="center" width="700">
					<tr>
						<td align="center">
							<select name="keyField">
								<option value="name">이름</option>
								<option value="subject">제목</option>
								<option value="content">내용</option>
							</select>
							<label for="keyWord"><input name="keyWord" id="keyWord"></label>
							<button type="submit" class="boardList__submit_btn" required>찾기</button>
							<label for="nowPage"><input type="hidden" name="nowPage" value="1" id="nowPage"></label>
						</td>
						<td colspan="2" align="right">
							<a href="boardPost.jsp">[글쓰기]</a>
							<a href="index.jsp">[처음으로]</a>
							<a href="index.jsp">[메인으로]</a>
						</td>
					</tr>
				</table>
			</form>
		</div> <!-- boardList__formbox -->
		<div class="boardList__hiddenbox">
			<form name="listFrm" method="post">
				<input type="hidden" name="reload" value="true">
				<input type="hidden" name="nowPage" value="1">
			</form>
		</div>
		
		<div class="boardList__readbox">
			<!--제목을 누르면 상세보기 페이지로 이동 : read.jsp로 가기위한 폼 구성 -->
			<form name="readForm" method="get"> <!-- action안넣으면 나 자신에게로 옴 -->
			<!-- 이 num이 클릭하는 순간 boardRead로 넘어간다 -->
				<input type="hidden" name="num">
				<input type="hidden" name="nowPage" value="<%=nowPage %>">
				<input type="hidden" name="keyField" value="<%=keyField %>">
				<input type="hidden" name="keyWord" value="<%=keyWord %>">
			</form>
		</div>
	</div> <!-- boardList__container -->
<%@ include file="footer.jsp" %>
</body>
</html>