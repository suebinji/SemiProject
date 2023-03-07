<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
	<!-- 구글폰트 -->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
	body{
		font-family: 'Gowun Dodum', sans-serif;
	}
	.boardPost__table>th{
		font-size:18px;
	}

	.btn >button {
		font-family: 'Gowun Dodum', sans-serif;
	}
</style>
</head>
<body>
	<div class="boardPost__container">
		<form action="boardPost" name="boardPostFrm" method="post">
			<table align="center" class="boardPost__table">
				<tr>
					<th colspan="2" style="font-size: 18pt;">글쓰기</th>
				</tr>
				<tr>
					<td>성명</td>
					<td><label for="bor_name"><input name="bor_name" id="bor_name"></label></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><label for="bor_subject"><input name="bor_subject" id="bor_subject"></label></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><label for="bor_content"><textarea name="bor_content" id="bor_content" rows="10" cols="50"></textarea></label></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><label for="bor_pass"><input type="password" name="bor_pass" id="bor_pass"></label></td>
				</tr>
				<tr>
					<td colspan="2"><hr/></td>
				</tr>
				<tr>
					<td colspan="2" align="center" class="btn">
						<button type="submit">등록하기</button>
						<button type="reset">다시쓰기</button>
						<button type="button" onclick="location.href='boardList.jsp'">리스트</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>