package record;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*import org.json.simple.JSONObject;*/
import com.google.gson.*;

import record.RecordBean;
import record.RecordMgr;
@WebServlet("/jqAjax3.do")
public class AjaxGetRecordMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		RecordBean bean = new RecordMgr().getRecord(name);
		
		// 1. 객체의 주소가 넘어감
		//response.getWriter().print(bean);
		
		// 2. JSONObject
		
		/*
		 * JSONObject jobj = new JSONObject(); jobj.put("id", bean.getId());
		 * jobj.put("userName", bean.getName()); jobj.put("gender",bean.getGender());
		 * jobj.put("email", bean.getEmail());
		 * 
		 * response.setContentType("application/json; charset=UTF-8");
		 * response.getWriter().print(jobj);
		 */
		 
		
		// 3. GSON (Google JSON)
		// 더 간단한 방법 : 위의 과정을 알아서 해주는 GSON라이브러리 사용
		
		response.setContentType("application/json; charset=UTF-8");
		
		/*
		 * Gson gson = new Gson(); 
		 * // 객체.toJson(응답할 자바객체, 응답할 스트림) gson.toJson(bean,
		 * response.getWriter());
		 */
		new Gson().toJson(bean, response.getWriter());
		// Gson 이용하여 bean객체 하나만 응답시 BONObject {key:value, key:value, ...}
		// 이때 key값은 bean에 있는 필드명으로 알아서 세팅
		// 
	}

}
