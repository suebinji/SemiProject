package record;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/recordPost")
public class RecordPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		RecordMgr rMgr = new RecordMgr();
		rMgr.insertRecord(request);
		
		//response.sendRedirect("recordResultCalendar.jsp");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('폼 등록이 완료되었습니다. 기록결과를 확인해보세요!'); location.href='recordResultCalendar.jsp';</script>");
		writer.close();
	}

}
