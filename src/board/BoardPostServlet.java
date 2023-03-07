package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/boardPost")
public class BoardPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		BoardMgr bMgr = new BoardMgr();
		bMgr.insertBoard(request);
		
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('게시글 등록이 완료되었습니다.'); location.href='boardList.jsp';</script>");
		writer.close();
		//response.sendRedirect("boardList.jsp");
	}

}
