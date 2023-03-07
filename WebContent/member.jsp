<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <script src="js/member.js"></script>
    <link rel="stylesheet" href="css/member.css" type="text/css">
    <!-- 구글폰트 -->
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
  
  	
      <style type="text/css">
        /* 폰트 */
        body{
          font-family: 'Gowun Dodum', sans-serif;
          font-size: 18px;
          margin: 0 auto;
          width: 500px;
          }
          
          
      </style>
      <!-- 주소 API -->
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
	function findAddr() {
	    new daum.Postcode({
	        oncomplete: function(data) {
				document.getElementById('postcode').value = data.zonecode;
				/* document.getElementById('addr').value = data.roadAddress; */
				/* document.getElementById('addr').value = data.jibunAddress; */
				/* document.getElementById('addr').value = roadAddr; 로도 쓸 수 있음 (변수 roadAddr 설정)  */
				roadAddr = data.roadAddress;
				jibunAddr = data.jibunAddress;
				extraAddr = '';
				
				if(roadAddr != ''){
					if(data.bname != '') { // bname =동이름
						extraAddr += data.bname;
					}
					if(data.buildingName != '') {
						extraAddr += (extraAddr != '') ? ', ' +	data.buildingName : data.buildingName;
					}
					
					roadAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';
					document.getElementById('addr').value = roadAddr;
				} else if(jibunAddr != '') {
					document.getElementById('addr').value = jibunAddr;
				}
				regFrm.detailaddress.focus();
	        }
	    }).open();
	}
</script>
  
  </head>
</head>
<body>
    <h1 align="center">회원가입</h1>
    <div id="box">
    <form action="login.html" method="get" name = "frm">
        
            <label for="userId">*아이디 : &emsp;&emsp;&emsp;</label>
            <input type="text" id="userId"><br><br>
            
            <p>
                &emsp;첫글자는 반드시 영문자하고 영문자, 숫자 포함 총 4~12자로 입력하시오.
            </p><br>
            <label for="userPassword">* 비밀번호 : &emsp;&emsp;</label>
            <input type="password" id="userPw" ><br><br>
            <p>
                &emsp;영문자, 숫자, 특수문자로 총 8~15자로 입력하시오.<br><br>
            </p>

            <label for="userPassword">* 비밀번호 확인 : </label>
            <input type="password" id="checkPw" ><br><br>
            <p>
                &emsp;위의 비밀번호와 일치하게 입력하시오.<br><br>
            </p>

            <label for="userName">* 이름 :  &emsp;&emsp;&emsp;&emsp;</label>
            <input type="text" id="userName" ><br><br>
            <p>
                &emsp;한글로만 이루어져 있어야 되며 2글자 이상으로 입력하시오.<br><br>
            </p>

            <label for="userEmail">&ensp;이메일 :  &emsp;&emsp;&emsp;</label>
            <input type="text" id="userEmail"><br><br>
            <p>
                &emsp;이메일 형식에 맞춰 입력하시오.<br><br>
            </p>

            <label for="userHobby">&ensp;성별 :  &emsp;&emsp;&emsp;&emsp;</label>
            <input type="radio" value="1">남 &emsp;&emsp; &emsp;
            <input type="radio" value="2">여
            <br><br>
            
            <label for="">&ensp;우편번호 : &emsp;&emsp;</label>
            <!-- readonly: 직접 쓰지 못하고 우편번호로 찾을 수 있게끔. -->
					  <input name = "zipcode" id="postcode" readonly>&emsp;
					  <input type= "button" value ="우편번호찾기" onClick="findAddr();"><br><br>
            <label for="userAddress">&ensp;주소 :  &ensp;&emsp;&emsp;&emsp;</label>
            <input type="address" placeholder="주소" size="60">&ensp;&ensp;
            <input type="detailaddress">
            <br><br>
            <hr>
            <br>
            <div id = "submitAndReset" >
                <!-- <input class = "submit" type="submit" value="회원가입" onclick="return validate1();">&emsp;&emsp; -->
                <input class = "submit" type="button" value="회원가입" onclick="validate();">&emsp;&emsp;
            </div>
        </fieldset>
    </form>
    </div>
</body>
</html>