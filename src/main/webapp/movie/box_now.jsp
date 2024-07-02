<%@ page language="java" contentType="text/html; charset=UTF-8"  %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> 현재상영작 | OSB 영화관 </title>
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
  			padding:5px 0;
        width:151px;
        height:80px;
        display:inline-block;
        border: 0px;
        background-color:cornsilk;
        transition:1s;} 
        
  .m_poster {
  	 object-fit:cover;
  }

   
  text1{font-size:22pt;
        font-weight:bold;
        text-shadow:1px 1px khaki;}
  
  text2{font-size:14pt;
        font-weight:bold;
        color:saddlebrown;
        line-height:1.5;
        text-shadow:1px 1px rosybrown;}
  
  text3{font-size:10pt;
        color:darkslategray;
        text-shadow:1px 1px lightgray;}
   
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
    <table>
    	<div align="center">
    		<text1>현재 상영작</text1>
    	</div>
    </table>
    <br>
    
    <div align="center">
    	<table>
		    <div class="box1"><a href="movieDetail.jsp?idx=8794"><img src="../images/m_someday.jpg" width=160 class="m_poster"></a></div>
		    <div class="box1"><a href="movieDetail.jsp?idx=8799"><img src="../images/m_exhuma.jpg" width=160  class="m_poster"></a></div>
		    <div class="box1"><a href="movieDetail.jsp?idx=8800"><img src="../images/m_dune2.jpg" width=160  class="m_poster"></a></div>
		    <div class="box1"><a href="movieDetail.jsp?idx=8798"><img src="../images/m_suzume.jpg" width=160  class="m_poster"></a></div>
   	 	</table>
   	 	
    	<table>
		    <div class="box2"><text2>상견니</text2><br><text3>평점 7.9</text3><br><text3>2024.01.25 개봉</text3></div>
		    <div class="box2"><text2>파묘</text2><br><text3>평점 5.8</text3><br><text3>2024.02.22 개봉</text3></div>
		    <div class="box2"><text2>듄: 파트2</text2><br><text3>평점 6.6</text3><br><text3>2024.02.28 개봉</text3></div>
		    <div class="box2"><text2>스즈메의 문단속</text2><br><text3>평점 9.3</text3><br><text3>2024.03.03 개봉</text3></div>
    	</table>
    	
    	<br> 
    	<table>
		    <div class="box1"><a href="movieDetail.jsp?idx=8796"><img src="../images/m_lion.png" width=160  class="m_poster"></a></div>
		    <div class="box1"><a href="movieDetail.jsp?idx=8795"><img src="../images/m_newworld.jpg" width=160  class="m_poster"></a></div>
		    <div class="box1"><a href="movieDetail.jsp?idx=8797"><img src="../images/m_apocalypse.jpg" width=160  class="m_poster"></a></div>
    	</table>
    	
    	<table>
		    <div class="box2"><text2>라이온 킹</text2><br><text3>평점 8.3</text3><br><text3>2024.01.01 개봉</text3></div>
		    <div class="box2"><text2>신세계</text2><br><text3>평점 7.8</text3><br><text3>2024.02.22 개봉</text3></div>
		    <div class="box2"><text2>지옥의 묵시록</text2><br><text3>평점 7.6</text3><br><text3>2024.01.31 개봉</text3></div>
    	</table>
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