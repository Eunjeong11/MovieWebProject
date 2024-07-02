<%@ page language="java" contentType="text/html; charset=UTF-8"  %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> 오시는 길 | OSB 영화관 </title>
	<link rel="stylesheet" href="../css/style.css">

<style>
  .box1{margin:17px;
        width:151px;
        height:212px;
        overflow:hidden;
        display:inline-block;
        border:0px;
        background-color:mistyrose;
        transition:1s;}

  .box1:hover{transform:scale(1.2);
  						transition-duration:300ms;
              transform-origin:center center;
              translate(20px, 50px);} 

  .box2{margin:0 17px 17px;
        width:151px;
        height:75px;
        display:inline-block;
        border: 0px;
        background-color:cornsilk;
        transition:1s;} 
        
  .m_poster {
  	 object-fit:cover;
  }

   
  text1{font-size:22pt;
        font-weight:bold;
        }
  
  text2{font-size:14pt;
        font-weight:bold;
        color:orangered;
        text-shadow:1px 1px rosybrown;}
  
  text3{font-size:10pt;
        color:darkslategray;
        }
   
</style>
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
        <li><a href="./join.jsp">회원가입</a></li>
        <li><a href="./login.jsp">로그인</a></li>
<%
  }else{
%>	
        <li><a href="#">My Page</a></li>
    		<li><a href="./logout.jsp">로그아웃</a></li>
<%
  }//if end
%>      
      </ul>
    </div>
    </div>

  <div id="headerc">
    <nav>
	    <div id="logo">
	      <a href="../index.jsp">
	        <img src="../images/OSB.png" width="120px">
	      </a>
	    </div>
      <ul id="topMenu">
        <li><a href="#" id="aaa" onMouseOver="ArrowA()" onMouseOut='this.innerHTML="영화 ▶"'>영화 ▶</a>
          <ul>
            <li><a href="./box_now.jsp" onMouseOver="ArrowA()" onMouseOut='aaa.innerHTML="영화 ▶"'>현재상영작</a></li>
            <li><a href="./box_plan.jsp" onMouseOver="ArrowA()" onMouseOut='aaa.innerHTML="영화 ▶"'>상영예정작</a></li>
          </ul>
        </li>
        <li><a href="#" id="bbb" onMouseOver="ArrowB()" onMouseOut='this.innerHTML="예매 ▶"'>예매 ▶</a>
          <ul>
		        <% if(disp==null || disp.equals("")){ %>
		        <li><a href="#" onclick="alert('로그인 후에 이용할 수 있습니다.'); location.href='./login.jsp';" onMouseOver="ArrowB()" onMouseOut='bbb.innerHTML="예매 ▶"'>예매하기</a></li>
		     		<% }else{ %>
            <li><a href="./booking.jsp" onMouseOver="ArrowB()" onMouseOut='bbb.innerHTML="예매 ▶"'>예매하기</a></li>
         		<% } %>
		        <% if(disp==null || disp.equals("")){ %>
		        <li><a href="#" onclick="alert('로그인 후에 이용할 수 있습니다.'); location.href='./login.jsp';" onMouseOver="ArrowB()" onMouseOut='bbb.innerHTML="예매 ▶"'>예매내역 조회</a></li>
		     		<% }else{ %>
            <li><a href="./bookingSearch.jsp" onMouseOver="ArrowB()" onMouseOut='bbb.innerHTML="예매 ▶"'>예매내역 조회</a></li>
            <% } %>
          </ul>
        </li>
        <li><a href="#" id="ccc" onMouseOver="ArrowC()" onMouseOut='this.innerHTML="스토어 ▶"'>스토어 ▶</a>
          <ul>
            <li><a href="./md_Drink.jsp" onMouseOver="ArrowC()" onMouseOut='bbb.innerHTML="스토어 ▶"'>음료</a></li>
            <li><a href="./md_Snack.jsp" onMouseOver="ArrowC()" onMouseOut='bbb.innerHTML="스토어 ▶"'>스낵</a></li>
          </ul>
        </li>
      </ul>
    </nav>
  </div> <!-- #headerc END -->
  </header>
      <!-- 이상 공통부분(삭제x) -->
        
    <br>
    <br>
    <br>
    <br>
    <br>
    <table>
    	<div align="center">
    		<text1>오시는 길</text1>
    	</div>
    	<br>
    	<br>
        <div align="center">
        	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d470.18937378089703!2d126.92032653440059!3d37.5540160224534!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c98db41c60779%3A0x41a5dbb25f4f8caf!2z7ISc7Jq47Yq567OE7IucIOuniO2PrOq1rCDslpHtmZTroZwgMTIy!5e0!3m2!1sko!2skr!4v1713401439512!5m2!1sko!2skr" 
        	width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
        <br>
        <div align="center">
        <text2>도로명 : 서울특별시 마포구 양화로 122 3층, 4층</text2><br>
        <text2>지번 : 서울특별시 마포구 서교동 354-8 3층, 4층</text2><br><br>
        <text3>오시는 방법: 지하철 2호선 홍대입구역 9번 출구 300m 거리</text3><br>
        <text3>요거프레소 본사 건물 LAB7 3층, 4층</text3><br><br>
        <text3>건물 앞 공용주차장 있습니다.</text3><br>
        <text3>유동인구가 많아 교통이 혼잡할 수 있으니</text3><br>
        <text3>불편하시더라도 가급적 대중교통 이용 바랍니다.</text3><br>
        </div>
  
    <br>
    <br>
    <br>
    <br>
    <br>
             <!-- 이하 공통부분(삭제x) -->
  <footer>
  <div id="footerc">
    <div id="bottomMenu">
      <ul>
        <li><a href="#">회사 소개</a></li>
        <li><a href="./map.jsp">오시는 길</a></li>
        <li><a href="#">이용약관</a></li>
        <li><a href="#">개인정보처리방침</a></li>
        <li><a href="#">법적고지
        </a></li>
      </ul>
      <div id="sns">
        <ul>
          <li><a href="#"><img src="../images/sns-1.png"></a></li>
          <li><a href="#"><img src="../images/sns-2.png"></a></li>
          <li><a href="#"><img src="../images/sns-3.png"></a></li>
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
    
  <script src="../js/slideshow.js"></script>
</body>
</html>