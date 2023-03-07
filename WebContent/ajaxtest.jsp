<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		$.ajaxSetup({

	    contentType: "application/json; charset=utf-8",

	    type: "POST",

	    dataType: "json"

	});
		
		$(function () {

		    $("#submitBtn").click(function (e) {

		 

		        var data = {};

		        // data를 생성해서 <String, Object>형식으로 데이터 넣어줌

		        data["name"] = $('#name').val();

		        data["age"] = $('#age').val();

		 

		        $.ajax({

		            /*

		            *  우리가 선언한 var data는 js변수인데, ajax에서는 json 형태로 데이터를 반환하므로

		            *  js 값을 json형태로 파싱해야 한다.

		            *  .stringify는 js값을 json으로 파싱해주는 메소드

		            *  */

		            data: JSON.stringify(data),

		            url: '/test2.do',

		            success: function (response) {

		                alert(response.name + response.age);

		                // alert(response.success);

		            },

		            error: function (e) {

		                alert("통신실패" + e)

		            }

		        });

		    });


		});
	</script>
	   <%--id값으로 test.js에서 가져갈수있음--%>

    이름<input id ="name" type="text" /><p>

    나이<input id = "age" type="text" /><p>

    <input id = "submitBtn" type="button" value="확인" />
</body>
</html>