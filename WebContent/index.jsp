<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
    <link rel="stylesheet" href="resource/css/main1.css">
        <!-- 구글폰트 -->
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    
        <!-- 제이쿼리 -->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
        <script src="resource/js/jQueryUserMain.js"></script>

        <!-- 스와이퍼 -->
        <style>
            .container{
                width: 1250px;    
                margin: 0 auto;
                padding: 0; 
            }
            .body2__box2>ul>li>img{
                width: 150px;
                
            }
            .body2__box2>ul>li{
                display: inline;
            }
            .body2__box2{
                /* overflow: hidden; */
            }
        </style>
        
</head>
<body>
    <div class="container">
	<%@ include file="header.jsp" %>
        <div class="body1__container">
            
            <div class="body__box1">
                <h1>같이 런닝할 크루와 원하는 시간대에 뛰어보세요!</h1>
            </div>

            <div class="body__box2" id="content">
                <section id="imgslide">
                    <div id="img">
                        <img src="resource/img/img1.png" alt="러닝크루1">
                        <img src="resource/img/img2.jpg" alt="러닝크루2">
                        <img src="resource/img/img3.jpg" alt="러닝크루3">
                        <img src="resource/img/img1.png" alt="러닝크루1">
                    </div>
                </section>
            </div>
            
            <div class="body__box3">

            </div>
        </div>
        <div class="body2__container">
            <div class="body2__box1__container">
                <div class="body2__box1">
                    <a href="https://instagram.com">
                        <h1>INSTAGRAM #모여요 런닝의 숲</h1>
                    </a>
                </div>
                <div class="body2__box2">
                    <ul>
                        <li>
                            <img src="resource/img/imgcon1.jpeg" alt="">
                        </li>
                        <li>
                            <img src="resource/img/imgcon2.jpg" alt="">
                        </li>
                        <li>
                            <img src="resource/img/imgcon3.png" alt="">
                        </li>
                    </ul>
                </div>
            </div>
            <div class="body2__box3">
                <a href="runConForm.jsp"><h1>일단 달렷! 런닝대회 참가하기</h1></a>
            </div>
        </div>
    
	<%@ include file="footer.jsp" %>
	</div>
</body>
</html>