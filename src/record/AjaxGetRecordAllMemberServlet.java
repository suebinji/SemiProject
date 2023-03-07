package record;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*import org.json.simple.JSONArray;
import org.json.simple.JSONObject;*/

import com.google.gson.Gson;

import record.RecordBean;
import record.RecordMgr;


@WebServlet("/jqAjax4.do")
public class AjaxGetRecordAllMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<RecordBean> alist = new RecordMgr().getAllRecord();
		
		
		// 1. JSONArray [{}, {}, {}, ...]
		/*
		JSONArray jArr = new JSONArray();
		for( MemberBean m:alist) {
			JSONObject jobj = new JSONObject();
			jobj.put("id", m.getId());
			jobj.put("name", m.getName());
			jobj.put("gender",m.getGender());
			jobj.put("email", m.getEmail());
			
			jArr.add(jobj);
		}
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jArr);
		*/
		
		// 2. GSON 사용
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(alist, response.getWriter());
		
	}

}
