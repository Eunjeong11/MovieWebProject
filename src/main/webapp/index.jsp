<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="movie/ssi.jsp" %>
<%@ page import="network.movie.common.MovieDAO" %>
<%@ page import="network.movie.common.MovieVO" %>

<% 
String popupMode = "on";

Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie c : cookies) {
        String cookieName = c.getName();
        String cookieValue = c.getValue();
        if (cookieName.equals("PopupClose")) {
            popupMode = cookieValue; 
        }
    }
} 
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> 꿈과 희망이 넘치는, OSB 영화관 </title>
	<link rel="stylesheet" href="./css/style.css">
	<style>
		* {
			box-sizing: border-box;
		}
    #popup{
     	z-index: 10;
      position: absolute; top:300px; left:800px; color:yellow;  
      width:400px; height:300px; 
      background-color:gray;
    }
    #popup > img {
   		position: relative;
    }
    #popup > div{
   		z-index: 11;
      position: absolute; background-color:#ffffff; bottom:-40px;
      border:none; padding:10px; color:black;
      width:400px; height:40px;
    }
    
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script>
		$(function() {
			$("#closeBtn").click(function(){
				$("#popup").hide();
				var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
				if(chkVal==1){
					$.ajax({
						url : './movie/PopupCookie.jsp',
						type : 'get',
						data : {inactiveToday : chkVal},
						dataType : "text",
						success : function(resData) {
							if(resData != '') 
								location.reload();
						}
					});
				}
			});
		});
	</script>
</head>
<body>
	<header>
		<div id="login">
  	<div id="loginlink">
      <ul>
<% 	
	String disp = "";
  disp = (String)session.getAttribute("naver");
  if(disp==null || disp.equals("")){
%>	
        <li><a href="movie/join.jsp">회원가입</a></li>
        <li><a href="movie/login.jsp">로그인</a></li>
<%
  }else{
%>	
        <li><a href="#">My Page</a></li>
    		<li><a href="movie/logout.jsp">로그아웃</a></li>
<%
  }//if end
%>      
      </ul>
    </div>
    </div>

  <div id="headerc">
    <nav>
	    <div id="logo">
	      <a href="index.jsp">
	        <img src="./images/OSB.png" width="120px">
	        <!-- <h1>THEATER</h1> -->
	      </a>
	    </div>
      <ul id="topMenu">
        <li><a href="#" id="aaa" onMouseOver="ArrowA()" onMouseOut='this.innerHTML="영화 ▶"'>영화 ▶</a>
          <ul>
            <li><a href="movie/box_now.jsp" onMouseOver="ArrowA()" onMouseOut='aaa.innerHTML="영화 ▶"'>현재상영작</a></li>
            <li><a href="#" onMouseOver="ArrowA()" onMouseOut='aaa.innerHTML="영화 ▶"'>상영예정작</a></li>
          </ul>
        </li>
        <li><a href="#" id="bbb" onMouseOver="ArrowB()" onMouseOut='this.innerHTML="예매 ▶"'>예매 ▶</a>
          <ul>
		        <% if(disp==null || disp.equals("")){ %>
		        <li><a href="#" onclick="alert('로그인 후에 이용할 수 있습니다.'); location.href='./movie/login.jsp';" onMouseOver="ArrowB()" onMouseOut='bbb.innerHTML="예매 ▶"'>예매하기</a></li>
		     		<% }else{ %>
            <li><a href="./movie/booking.jsp" onMouseOver="ArrowB()" onMouseOut='bbb.innerHTML="예매 ▶"'>예매하기</a></li>
         		<% } %>
		        <% if(disp==null || disp.equals("")){ %>
		        <li><a href="#" onclick="alert('로그인 후에 이용할 수 있습니다.'); location.href='./movie/login.jsp';" onMouseOver="ArrowB()" onMouseOut='bbb.innerHTML="예매 ▶"'>예매내역 조회</a></li>
		     		<% }else{ %>
            <li><a href="./movie/bookingSearch.jsp" onMouseOver="ArrowB()" onMouseOut='bbb.innerHTML="예매 ▶"'>예매내역 조회</a></li>
            <% } %>
          </ul>
        </li>
        <li><a href="#" id="ccc" onMouseOver="ArrowC()" onMouseOut='this.innerHTML="스토어 ▶"'>스토어 ▶</a>
          <ul>
            <li><a href="movie/md_Drink.jsp" onMouseOver="ArrowC()" onMouseOut='bbb.innerHTML="스토어 ▶"'>음료</a></li>
            <li><a href="movie/md_Snack.jsp" onMouseOver="ArrowC()" onMouseOut='bbb.innerHTML="스토어 ▶"'>스낵</a></li>
          </ul>
        </li>
      </ul>
    </nav>
  </div> <!-- #headerc END -->
  </header>
<!-- 이상 공통부분(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x) -->
    

<% 
	if (popupMode.equals("on")) {
%>
	<div id="popup">
		<img src="images/surface_type.jpg" width=400px height=300px>
		<div align="right">
			<form name="popFrm">
				<input type="checkbox" id="inactiveToday" value="1">
				하루 동안 열지 않음
				<input type="button" id="closeBtn" value="닫기">
			</form>
		</div>
	</div>
<%	
	}
%>
     
     
     
  <div id="middle">
  <div id="slideShow">
    <div id="slides">
      <img src="./images/slide_dune2_type.png">
      <img src="./images/slide_newworld_type.png">
      <img src="./images/slide_popcorn_type.jpg">
      <button id="prev">&lang;</button>
      <button id="next">&rang;</button>
    </div>
  </div>
    
  <br>  
  <br>  
  <div id="contents">
    <div id="links">
      <ul>
        <li>
          <a href="movie/movieDetail.jsp?idx=8794">
            <span id="quick-icon1"></span>
            <p>상견니</p>
          </a>
        </li>
        <li>
          <a href="movie/movieDetail.jsp?idx=8799">
            <span id="quick-icon2"></span>
            <p>파묘</p>
          </a>
        </li>
        <li>
          <a href="movie/movieDetail.jsp?idx=8800">
            <span id="quick-icon3"></span>
            <p>듄: 파트2</p>
          </a>
        </li>
        <li>
          <a href="movie/movieDetail.jsp?idx=8798">
            <span id="quick-icon4"></span>
            <p>스즈메 문단속</p>
          </a>
        </li>
        <li>
          <a href="movie/movieDetail.jsp?idx=8796">
            <span id="quick-icon5"></span>
            <p>라이온 킹</p>
          </a>
        </li>
      </ul>
    </div> <!-- #links END -->
    
    <br>
    <div id="tabMenu">
      <input type="radio" id="tab1" name="tabs" checked>
      <label for="tab1">공지사항</label>
      <input type="radio" id="tab2" name="tabs">
      <label for="tab2">이벤트</label>

      <div id="tab1" class="tabContent">
        <h2>공지사항 내용</h2>
        <ul>
          <li>영화관 4월 휴무일 안내</li>
          <li>범죄도시4 개봉주 무대인사 관련 공지</li>
          <li>주차요금 변경사항 안내</li>
          <li>2024년 4월 시스템 공지</li>
          <li>무대인사 예매취소 정책 변경 안내</li>
        </ul>
      </div>
      <div id="tab2" class="tabContent">
        <h2>이벤트 내용</h2>
        <ul>
          <li>3월 이벤트 당첨자 발표</li>
          <li>스즈메 문단속 특전 배포 안내</li>
          <li>범죄도시4 선행상영회 응모 안내</li>
          <li>[1주차 한정] 듄:파트2 예매시 팝콘 1+1</li>
          <li>갤럭시 s24 콜라보 이벤트</li>
        </ul>
      </div>
    </div> <!-- #tabMenu END -->
    <div align="right">
    	<ul>
    		<li id="cf">	
    			<img src="./images/ticket_bonus.jpg" width="400" height="250">
    		</li>
    	</ul>
    </div>
 
  </div> <!-- #contents END -->
	</div> <!-- #middle END -->
		    
    
<!-- 이하 공통부분(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x) -->
  <footer>
  <div id="footerc">
    <div id="bottomMenu">
      <ul>
        <li><a href="#">회사 소개</a></li>
        <li><a href="./movie/map.jsp">오시는 길</a></li>
        <li><a href="#">이용약관</a></li>
        <li><a href="#">개인정보처리방침</a></li>
        <li><a href="#">법적고지
        </a></li>
      </ul>
      <div id="sns">
        <ul>
          <li><a href="#"><img src="./images/sns-1.png"></a></li>
          <li><a href="#"><img src="./images/sns-2.png"></a></li>
          <li><a href="#"><img src="./images/sns-3.png"></a></li>
        </ul>
      </div>
    </div> <!-- bottomMenu END -->
    <div id="company">
     <p>(04000)서울특별시 ***동 ***로 *** (대표전화) 123-456-7890</p>
     <p>대표이사 : ooo · 사업자등록번호 : 000-00-00000 · 통신판매업신고번호 : 2024-서울xx-0000 <u>사업자정보확인</u> </p>
     <p>호스팅사업자 : ooo · 개인정보보호 책임자 : xxx · 대표이메일 : movie@fake.com </p>
     <p>© xx ooo. All Rights Reserved </p>
    </div> <!-- company END -->
  </div> <!-- #footerc END -->
  </footer>
    
  <script src="./js/slideshow.js"></script>
</body>
</html>