package test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.slf4j.internal.Logger;
//import org.slf4j.internal.LoggerFactory;


@WebServlet("/test2.do")
public class Test2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   //Logger logger = LoggerFactory.getLogger(getClass());

	   

	    //@RequestMapping(value = "/test2.do")
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
