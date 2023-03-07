package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/idCheck.me")
public class AjaxIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checkId = request.getParameter("checkId");
		/*
		 * MemberMgr mMgr = new MemberMgr(); mMgr.checkId(checkId);
		 */
		boolean result = new MemberMgr().checkId(checkId);
		if(result) {	//중복된 아이디값 존재(MemberMgr.java에서 값이있으면 true반환함)
			response.getWriter().print("idN"); // idN이면 사용하지 못한다고 나중에 설정해주기
		} else {
			response.getWriter().print("idY");
		}
	}

}
