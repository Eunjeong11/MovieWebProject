<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="./ssi.jsp" %>
<%@ page import="network.movie.common.MovieDAO" %>
<%@ page import="network.movie.common.MovieVO" %>
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
	
<title> 영화 상세 | OSB 영화관 </title>
<style>
	#a {
		position: absolute;
    top: 56px;
    left: 65px; 
    box-shadow: 2px 6px 15px 0 rgba(0, 0, 0, 0.65);
    width:170px;
    height:239px;
    overflow:hidden;
	}
	
	#entitle {
		font-size: 10px;
	}
	
	.wrap {
		width: 800px;
    margin: 0 auto;
    padding: 56px 30px 0px 270px;
    background-color: #fff;
    position: relative;
  }
    
  .wrap h3 {
  	margin: 0 31px 0 31px;
  	border-bottom: 2px solid #7d7d7d;
  }
  .basic {
  	margin: 16px 0 0 31px;
  	color: gray;
  	font-size: 16px;
  	line-height: 1.9em;
  	list-style-type: none;
  }
  
  .basic span {
  	font-weight: bold;
  }
  
  .story {
  	width:720px;
  	margin:0 auto;
    margin-top: 35px;
  	border-top: 1px solid  #d8d8d8;
  	border-bottom: 1px solid  #d8d8d8;
 		line-height: 2.0em;
    color: #666;
    padding: 21px 0 21px 30px;
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
<!-- 이상 공통부분(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x) -->
       
	

<%! 
	String msga; 
	String msgb; 
	String msgc; 
	
	String mdir, mstar;
%>  
<%
	//index.jsp문서 그리고 moviereply.jsp 영화포스터 클릭하면 넘어오는 가짜변수
  int data  = Integer.parseInt(request.getParameter("idx")) ;
	String memberid = request.getParameter("mber");
  // data는 영화코드                                             
  MovieDAO dao = new MovieDAO();
  //dao.movieHit(data); //조회수처리
  MovieVO vo =  dao.movieDetail(data); //한건상세처리 
  Mcode = vo.getMcode();
  
  System.out.println(Mcode + vo.getMcode()+ "mcode부터 성공");
  
  //moviereply.jsp로부터 페이징 번호 받음
  MRidx = request.getParameter("MRidx");
  if(MRidx==null || MRidx==""){ MRidx="1";}

  //감독 이름 출력을 위한 데이터 준비
  msga = "select listagg(name, ', ') ";
  msgb = "within group (order by name) as DIRECTOR ";
  msgc = "from (select * from casting where role = 'director' and mcode="+data+")";
  msg = msga + msgb + msgc;
  
	System.out.println(msg);
	ST = CN.createStatement();
	RS = ST.executeQuery(msg);
	if(RS.next()==true) {
		mdir = RS.getString("DIRECTOR");
		System.out.println("감독 : " + mdir);
	}
	
  //배우 이름 출력을 위한 데이터 준비
  msga = "select listagg(name, ', ') ";
  msgb = "within group (order by name) as ACTOR ";
  msgc = "from (select * from casting where role = 'actor' and mcode="+data+")";
  msg = msga + msgb + msgc;
	
	System.out.println(msg);
	ST = CN.createStatement();
	RS = ST.executeQuery(msg);
	if(RS.next()==true) {
		mstar = RS.getString("ACTOR");
		System.out.println("배우 : " + mstar);
	}
%>
  
	<div class="wrap">
		<h3>
			<%= vo.getTitle() %>&nbsp;&nbsp;<span id=entitle> <%= vo.getEtitle() %> </span> 
		</h3>
		<img src="../images/<%=vo.getPoster() %>" id="a" style="float: left; margin-right: 40px;">  

		<ul class="basic">
			<li> <span>장&nbsp;&nbsp;르</span> : <%= vo.getGenre() %> </li>
			<li> <span>감&nbsp;&nbsp;독</span> : <%=mdir %> </li>
			<li> <span>출&nbsp;&nbsp;연</span> : <%=mstar %> </li>
			<li> <span>등&nbsp;&nbsp;급</span> : <%= vo.getMgrade() %> </li>
			<li> <span>개봉일</span> : <%= vo.getRls() %> </li>
			<% if(disp==null || disp.equals("")){ %>
			<input type="button" class="btn" value="예매하기" onclick="alert('로그인 후에 이용할 수 있습니다.'); location.href='login.jsp';">
			<% }else{ %>
			<input type="button" class="btn" value="예매하기" onclick="location.href='booking.jsp?idx=<%=vo.getMcode()%>';">
			<% } %>
		</ul>
	</div> <!-- wrap END -->
	
		<div class="story">
		<b>	
	<%
			BufferedReader reader = null;
			try {
				String filePath = application.getRealPath("/WEB-INF/synopsis/"+data+".txt");
				reader = new BufferedReader(new FileReader(filePath));
				while (true) {
					String str = reader.readLine();
					if (str == null)
						break;
					out.println(str + "<br>");
				}
			} catch (FileNotFoundException fnfe) {
				out.println("파일이 존재하지 않습니다.");
			} catch (IOException ioe) {
				out.println("줄거리를 읽을 수 없습니다.");
			} finally {
				try {
					reader.close();
				} catch (Exception e) { }
			}
	%>
			</b>
		</div> <!-- .story END -->
		
		<jsp:include page="moviereply.jsp">
			<jsp:param value="<%= Mcode %>" name="Ridx"/>
			<jsp:param value="<%= MRidx %>" name="MRidx"/>
		</jsp:include>




<!-- 이하 공통부분(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x)(삭제x) -->
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