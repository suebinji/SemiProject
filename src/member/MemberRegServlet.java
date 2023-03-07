package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/memberReg")
public class MemberRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		MemberMgr mMgr = new MemberMgr();
		mMgr.insertMember(request);
		PrintWriter writer = response.getWriter();
		//response.sendRedirect("index.jsp");
		writer.println("<script>alert('회원가입이 완료되었습니다.'); location.href='index.jsp';</script>");
		writer.close();
	}

}
