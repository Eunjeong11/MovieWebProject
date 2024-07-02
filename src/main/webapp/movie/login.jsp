<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> 로그인 | OSB 영화관 </title>
	<link rel="stylesheet" href="../css/style.css">

<style>
  #main table{
  	border:2px solid darkred;
    border-radius:11px;
    padding:20px;
    padding-left:10px;}

  #main {
  	font-weight:bold;
  }
  	    
  #main a{
  	font-size:12pt;
    text-decoration:none;
  	font-weight:bold;
  	color:darkred;
  }
  	    
  #main a:hover{
    text-decoration:none;
    color:lightpink;
	}
  	          
  #llogin{font-size:20pt;
  	     font-weight:bold;
  	     width:300px;
  	     height:50px;
  	     background:wheat;
	}
  	     
  .sg{font-size:11pt;
      font-weight:bold;
      color:lightgrey;
  }
  
 	#check {
 		margin:10px 5px 20px;
		font-size:10pt;
	}
	
	#btnCell {
		border-top:none;
		border-right:none;
		border-bottom:none;
	}
	
	ion-icon {
  	font-size: 32px;
	}
	
  input[type=text], input[type=password] {
  	font-size:16pt;  
  }
  
  input[type=submit]{
 		border-radius:20px;
    color:DarkRed;
    border:0;
    cursor:pointer;}
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
    
	<div id="main">
    <br>
    <br>
    <br>
    <br>
    <br>
    <br class=sg><p align=center>OSB영화관에 오신것을 환영합니다.
    <br>
    <br>
    <div align="center">
    <table width=500 cellspacing=0 cellpadding=0>
	    <form action="loginList.jsp" method="">
	    	<tr>
		    	<td align="center">
		    	<div>
		    		<ion-icon name="person-outline"></ion-icon>
			      <input type="text" name="userid" value="" size=20 placeholder="아이디">
		      </div>
		    	</td>
	    	</tr>
		    <tr>
		      <td align="center">
		      <div>
		      	<i><ion-icon name="lock-closed-outline"></ion-icon></i>
		      	<input type="password" name="pwd" value="" size=20 placeholder="비밀번호">
		      	</div>
		      </td>
		    </tr>
		    <tr>
		      <td align="center" style="justify-content: stretch">
			      <input type="checkbox" name="check" id="check">아이디 저장
			      <input type="checkbox" name="check" id="check">관리자 접속
		      </td>
		    </tr>
	      <td rowspan="2" id="btnCell" align="center"><input type="submit" value="login" id="llogin"></td>
	    </form>
    </table>
    <a href="#">|아이디 찾기|</a>
    <a href="#">|비밀번호 찾기|</a>
    <a href="join.jsp">|회원가입|</a>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
  </div> <!-- #main END -->
  

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
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>