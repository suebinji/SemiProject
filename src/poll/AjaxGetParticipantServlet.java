package poll;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import record.RecordBean;
import record.RecordMgr;


@WebServlet("/jqAjaxParti.do")
public class AjaxGetParticipantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String participant = request.getParameter("participant");
		PollItemBean bean = new PollItemMgr().getParti(participant);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(bean, response.getWriter());
	}

}
