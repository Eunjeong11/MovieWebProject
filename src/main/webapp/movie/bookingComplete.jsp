<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="./ssi.jsp" %>
<%@ page import="network.movie.common.MovieDAO" %>
<%@ page import="network.movie.common.MovieVO" %>
<%@ page import="network.movie.common.BookingDAO" %>
<%@ page import="network.movie.common.BookingVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/styleDetail.css">
	
<title> 예매 | OSB 영화관 </title>
<style>

  .basic {
  	
  	color: gray;
  	font-size: 16px;
  	line-height: 1.9em;
  	list-style-type: none;
  }
  
  .basic span {
  	font-weight: bold;
  	float: left;
  }
  
  #bookingDetailContainer {
  	margin:auto;
  	margin-top: 40px;
  	margin-bottom: 10px;
  	text-align: center;
  	width: 400px;
  	height: 500px;
  	<!--overflow: hidden;-->
  }
  
  #bookingComplete {
  	text-align: center;
  	margin-bottom: 10px;
  }
  
  #bookingHeader {
  		box-shadow: 2px 6px 15px 0 rgba(0, 0, 0, 0.65);
    	background-color: #333333;
    	text-align: center;
    	padding: 5px;
    	color: white;
    }
    
    #bookingposter {
    	box-shadow: 2px 6px 15px 0 rgba(0, 0, 0, 0.65);
    	width:100px;   	
    	overflow:hidden;
	}
	
	#bookingDetail {		
		box-shadow: 2px 6px 15px 0 rgba(0, 0, 0, 0.65);  
		height: 200px;
		margin-top: 7px;  
		padding-top: 25px;
    	padding-left: 20px;
    	padding-right: 20px;
    	padding-bottom: 25px;
    	background-color: lightgrey;
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
            <li><a href="./bookingComplete.jsp" onMouseOver="ArrowB()" onMouseOut='bbb.innerHTML="예매 ▶"'>예매내역 조회</a></li>
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


<%
  int data  = Integer.parseInt(request.getParameter("idx")) ;                                          
  BookingDAO dao = new BookingDAO();
  BookingVO vo =  dao.bookingDetail(data); 
  
  int mdata = vo.getMcode();
  String mdate = vo.getMdate();
  String dateOnly = mdate.substring(0, mdate.indexOf(" "));
  
  MovieDAO mdao = new MovieDAO();
  MovieVO mvo = mdao.movieDetail(mdata);
  
  
%>
	<br><br><br><br>
	<div id="bookingDetailContainer">
	<div id="bookingComplete">
		<h2>예매가 완료되었습니다!</h2>
	</div>
	<br>
  	<div id="bookingHeader">
  		예매 내역
  	</div>
	<div id="bookingDetail">
		
		<img src="../images/<%=mvo.getPoster() %>" id="bookingposter" style="float: left; margin-right: 40px;">  

		<!-- 아래에 영화 정보 각각 출력되도록 업데이트 할 것!!! -->
		<ul class="basic">
			<li> <span>예매코드 : </span><%= vo.getBcode() %> </li>
			<li> <span>영&nbsp;&nbsp;화 : </span><%= mvo.getTitle() %> </li>						
			<li> <span>날&nbsp;&nbsp;짜 : </span><%= dateOnly %> </li>
			<li> <span>좌&nbsp;&nbsp;석 : </span><%= vo.getSeatNum() %> </li>
			<li> <span>가&nbsp;&nbsp;격 : </span><%= vo.getPrice() %>원 </li>	
		</ul>
	</div> <!-- wrap END -->
	</div>	<!-- bookingDetailContainer END -->	


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