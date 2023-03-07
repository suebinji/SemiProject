<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="NowDate" class="java.util.Date"/>
<fmt:formatDate value="${NowDate}" pattern="yyyyMMddhhmm" var="nowDate"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div>
                    <%@ page import="java.text.SimpleDateFormat" %>
                    <%@ page import="java.util.*" %>
                    <%@ page import="java.text.ParseException" %>

                    <%

                        String sCurTime1 = null;
                        String sMinTime1 = "202102061000";
                        String sMaxTime1 = "202102081800";
                        String sTime1 = "";

                        sCurTime1 = new java.text.SimpleDateFormat("yyyyMMddHHmmss", java.util.Locale.KOREA).format(new java.util.Date());

                        if (sCurTime1.compareTo(sMinTime1) >= 0 && sCurTime1.compareTo(sMaxTime1) < 0) {
                    %>


                    </div><a href="javascript:void(alert('내용'));
				            javascript:void(window.open('https://www.naver.com')) "    <%-- 링크 --%>
                             title="새창에서 열림">
                             내용 내용 내용<br>
                    		</a>
                    <%
                        }

                    %>
                </div>
                
</body>
</html>