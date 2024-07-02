<%@ page language="java" contentType="text/html; charset=UTF-8"  %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> 음료 | OSB 영화관 </title>
	<link rel="stylesheet" href="../css/style.css">

<style>
	.serv_list{
		padding-top:70px;
		padding-bottom:70px;
	}
	.serv_list .container {
		max-width:1200px;
		margin:auto;
		
	}
	
	.serv_list .container .title ul{
		padding-left:0;
		list-style:none;
	}
	.serv_list .container .title ul li{
		display: inline;
		margin-right:30px;
	}
	.serv_list .container .title ul li a{
		text-decoration:none;
		color:#444;
	}
	
	.title {
		padding:0 30px 50px;
	}
	
	.serv_list .container .item_list {
		display: flex;
		flex-wrap : wrap; /*상위 요소의 너비보다 하위 요소 너비가 더 큰 경우 자동 줄 바꿈.*/
		justify-content: space-between;
		
		float:left;
		margin:0 15pt 20pt;
	}
	
	.serv_list .container .item_list .card {
		border: 1px solid #eee;
		border-radius: 5px;
		box-sizing: border-box;
		height:350px;
		width:250px;
		overflow:hidden;
		
		padding: 0;
		margin-bottom:10px;
	}
	
	.serv_list .container .item_list .card img{
		height:250px;
		width:250px;
	}
	.card_title {
		padding:10px 15px 15px;
	}
	.serv_list .container .item_list .card .text p{
		font-size:16px;
		font-weight:bold;
		color:DarkSlateBlue;
		opacity:0.9;
		padding: 0px 15px;
	}

  .m_poster {
  	 object-fit:cover;
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
  <section class="serv_list">
  	<div class="container">
			<div class="title">
				<span style="font-size:23pt; font-weight:bolder; color:indigo">음료</span> | <a href="./md_Snack.jsp">스낵</a>
			</div>
			<div class="item_list">
				<div class="card">
					<div class="img">
						<img src="../images/md_drink_americano.jpg">
					</div>
					<div class="text">
						<h3 class="card_title">아메리카노</h3>
						<p>4,500원</p>
					</div>
				</div>
			</div>  	<!-- .item_list END -->
						<div class="item_list">
				<div class="card">
					<div class="img">
						<img src="../images/md_drink_decaf.jpg">
					</div>
					<div class="text">
						<h3 class="card_title">디카페인 콜드브루</h3>
						<p>5,000원</p>
					</div>
				</div>
			</div>  	<!-- .item_list END -->
						<div class="item_list">
				<div class="card">
					<div class="img">
						<img src="../images/md_drink_cola.jpg">
					</div>
					<div class="text">
						<h3 class="card_title">탄산음료 <span style="font-size:10pt"> (코카콜라/칠성/환타)</span></h3>
						<p>3,500원</p>
					</div>
				</div>
			</div>  	<!-- .item_list END -->
						<div class="item_list">
				<div class="card">
					<div class="img">
						<img src="../images/md_drink_ade.jpg">
					</div>
					<div class="text">
						<h3 class="card_title">에이드<span style="font-size:10pt"> (오렌지/자몽)</span></h3>
						<p>5,500원</p>
					</div>
				</div>
			</div>  	<!-- .item_list END -->
									<div class="item_list">
				<div class="card">
					<div class="img">
						<img src="../images/md_drink_pink.jpg">
					</div>
					<div class="text">
						<h3 class="card_title">핑크레몬에이드</h3>
						<p>5,500원</p>
					</div>
				</div>
			</div>  	<!-- .item_list END -->
  	</div>	<!-- .container END -->
  
  </section>
  <div style="clear:left;"></div>
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