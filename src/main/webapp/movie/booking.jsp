<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ page import="network.movie.common.MovieDAO" %>
<%@ page import="network.movie.common.MovieVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.*"%>
<%@ include file="./ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
 <title> 예매 | OSB 영화관 </title>
 
 <link rel="stylesheet" href="../css/style.css">
 <link rel="stylesheet" href="../css/bookingDetail.css">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
 <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

 <script  type="text/javascript">
 $.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  minDate: 0,
	  maxDate: '+3d',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	});

	$(function() {
	    $("#inputDate").datepicker({
	        onSelect: function(dateText, inst) {
	            $("#selectedDate").text(dateText);
	        }
	    });
	});
	
	document.addEventListener('DOMContentLoaded', function() {
	     const movieItems = document.querySelectorAll('.movieList li');

	     movieItems.forEach(item => {
	       item.addEventListener('click', function() {
	         const mcode = this.getAttribute('data-mcode');
	         setMcode(mcode);
	         highlightMovie(this);
	       });

	       item.addEventListener('mouseenter', function() {
	         this.style.backgroundColor = 'beige';
	       });

	       item.addEventListener('mouseleave', function() {
	         if (!this.classList.contains('selectedMovie')) {
	           this.style.backgroundColor = '';
	         }
	       });
	     });
	   });
	
	function highlightMovie(element) {
	     const selectedElements = document.querySelectorAll('.selectedMovie');
	     selectedElements.forEach(selectedElement => {
	       selectedElement.classList.remove('selectedMovie');
	       selectedElement.style.backgroundColor = '';
	     });

	     element.classList.add('selectedMovie');
	   }
	
	//좌석 표시
	document.addEventListener('DOMContentLoaded', function() {
	  const seatMap = document.getElementById('seat-map');
	  const rows = 6;
	  const seatsPerRow = 8;
	  const totalSeats = rows * seatsPerRow;
	  const row = ["A", "B", "C", "D", "E", "F"];
	  var bookedSeats = []; // 미리 예약된 좌석	
	
	  	 /*  alert(row); */ 
	  for (let i = 0; i < rows; i++) {  //1~5 행
	    const rowElement = document.createElement('div');   //html <div>역할
	    rowElement.className = 'seat-row';
	    for (let seatNum = 1; seatNum <= seatsPerRow; seatNum++) {  //1~10 열
	      const seatId = row[i] + seatNum;  //seatNum이 1~10번  seatsPerRow가 10  seatID가 특정한 자리
	      const seatElement = document.createElement('div');
	      seatElement.className = 'seat';
	      seatElement.textContent = seatId;
	       bookedSeats = '<%=(List<String>)application.getAttribute("seats")%>'; 
	      if (bookedSeats.includes(seatId)) {  // 이미 예약된 자리확인?
	        seatElement.classList.add('booked');
	      } else {
	        seatElement.addEventListener('click', () => toggleSeat(seatId));
	      }
	      rowElement.appendChild(seatElement);
	    }
	    seatMap.appendChild(rowElement);
	  }
	});
	
	// 좌석 선택 기능
	document.addEventListener('DOMContentLoaded', function() {
	  const seats = document.querySelectorAll('.seat');

	  seats.forEach(seat => {
	    seat.addEventListener('click', () => {
	    
	    if(seat.classList.contains('booked')) {
	    	return;
	    }	
	    	
	      seat.classList.toggle('selected');
	      const selectedSeats = document.querySelectorAll('.seat.selected');
          const selectedSeatNumbers = Array.from(selectedSeats).map(seat => seat.textContent);
          document.getElementById('selectedSeat').innerHTML = selectedSeatNumbers.join(', ');
          
          const selectedSeatCount = selectedSeats.length * 10000;
          document.getElementById('ticketPrice').innerHTML = selectedSeatCount;
          
	    });
	  });

	  document.getElementById('booking').addEventListener('click', () => {
	    const selectedSeats = document.querySelectorAll('.seat.selected');
	    const selectedSeatNumbers = Array.from(selectedSeats).map(seat => seat.textContent);
	    const selectedDate = document.getElementById('selectedDate').textContent;
	    const cnt = document.getElementById('ticketPrice').textContent;
	    
	    if(!mcode) {
	    	alert('영화를 선택해주세요');
	    } else if(!selectedDate) {
	    	alert('날짜를 선택해주세요');
	    } else if(selectedSeats.length === 0) {
	    	alert('좌석을 선택해주세요');
	    } else {
	    	reserveSeats(selectedSeatNumbers, selectedDate, mcode, cnt);
	    }
	    
	  });
	  
	  // 선택된 좌석 예약 함수
	  function reserveSeats(selectedSeatNumbers, selectedDate, mcode, cnt) {
	  var message = "";
		  if (selectedSeatNumbers.length > 0) {
		    message += "예매가 완료되었습니다.\n선택된 좌석: " + selectedSeatNumbers.join(', ') + "\n";
		    message += "총 좌석 수: " + selectedSeatNumbers.length + "\n";
		    message += "예매 날짜: " + selectedDate + "\n";
		    //check.jsp로 값넘김
		    var msg="bookingseat_check.jsp?seat="+selectedSeatNumbers+ "&date=" + selectedDate + "&mcode=" + mcode + "&cnt=" + cnt; //check에서 seat로 값넘김
		    document.dyform.action=msg;
		    document.dyform.method="post";
		    document.dyform.submit();
		  } else {
		    message += "선택된 좌석이 없습니다.\n";
		  }
		  alert(message);
		  }
	});
	
	/*function setMcode(item){
	      item.classList.toggle('selectedMovie');
	   }*/
 </script>

 <style>
 	.seat {
	    width: 30px;
	    height: 30px;
	    margin: 3px;
	    border: 1px solid #666;
	    background-color: #e0e0e0;
	    display: inline-block;
	    text-align: center;
	    line-height: 20px;
	    cursor: pointer;
	}
	
	.selected {
	  background-color: #8d192b;
	}
	
	.booked {
	  background-color: #5c5c5c;
	}
	
	.screen{
		   background-color: #ccc;
		   margin: 35px;
		   padding: 5px;
		   width: 200px;
		   height: 50px;
		   color: #fff;
		   font-size: 20px;
		   font-weight: bold;
	
   
    
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
      
    <%
    String data = request.getParameter("idx");
    %>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
         setMcode(<%=data%>);
    });
    </script>
        
    <div id="bookingContainer">
    
    <div id="movieSelect">
        <div class="movieHeader">
        	현재 상영작
        </div>
        <div class="movieList">
          <ul>
        	<li data-mcode="8794">
        	  <a href="#" onclick="setMcode(8794)" title="movie1">
        	    <img src = "../images/15.png" class="ageIcon">
        	    <span class="movieTitle">상견니</span>
        	  </a>
        	</li>
        	<li data-mcode="8795">
        	  <a href="#" onclick="setMcode(8795)" title="movie1">
        	    <img src = "../images/18.png" class="ageIcon">
        	    <span class="movieTitle">신세계</span>
        	  </a>
        	</li>
        	<li data-mcode="8796">
        	  <a href="#" onclick="setMcode(8796)" title="movie1">
        	    <img src = "../images/all.png" class="ageIcon">
        	    <span class="movieTitle">라이온 킹</span>
        	  </a>
        	</li>
        	<li data-mcode="8797">
        	  <a href="#" onclick="setMcode(8797)" title="movie1">
        	    <img src = "../images/18.png" class="ageIcon">
        	    <span class="movieTitle">지옥의 묵시록</span>
        	  </a>
        	</li>
        	<li data-mcode="8798">
        	  <a href="#" onclick="setMcode(8798)" title="movie1">
        	    <img src = "../images/12.png" class="ageIcon">
        	    <span class="movieTitle">스즈메 문단속</span>
        	  </a>
        	</li>
        	<li data-mcode="8799">
        	  <a href="#" onclick="setMcode(8799)" title="movie1">
        	    <img src = "../images/15.png" class="ageIcon">
        	    <span class="movieTitle">파묘</span>
        	  </a> 
        	</li>
        	<li data-mcode="8800">
        	  <a href="#" onclick="setMcode(8800)" title="movie1">
        	    <img src = "../images/12.png" class="ageIcon">
        	    <span class="movieTitle">듄: 파트2</span>
        	  </a>
        	</li>        
          </ul>
        </div>  <!-- movieList -->                 
    </div> <!-- movieSelect -->
 
    <div id="dateSelect">
    	<input type=button  id="seatStatus" value="좌석 조회" class="buttonBooking">
    	<form id="formDate" method="post" action="booking.jsp">
          <input type="text" id="inputDate" name="inputDate" placeholder="날짜 선택">
        </form>       
    </div> <!-- dateSelect -->
   

    <div id="seatSelect" align="center" style='height:400px'>
        <div class="screen" title="SCREEN" >
			<span class="text" >SCREEN</span>
		</div>
        <div id="seat-map" class="seat-map"></div>
    </div> <!-- seatSelect -->        	
    </div> <!-- bookingContainer -->
    
    
    
    
    
    <div id="bookingDetailContainer">
      <!-- <div id="bookingDetail1">
        <img src = "../images/blank.png" class="posterDetail">
      </div>-->
      <div id="bookingDetail2">
        <div class="infoDetail">영화</div>
        <div class="infoDetail">관람등급</div>
        <div class="infoDetail">OSB 홍대점</div>
      </div>
      <div id="bookingDetail3">
        <div class="infoDetail">일시 : </div>
        <div class="infoDetail">좌석 : </div>
        <div class="infoDetail">가격 : </div>
      </div>
      <div id="bookingDetail4">
        <div id="selectedDate" class="infoDetail"></div>
        <div id="selectedSeat" class="infoDetail"></div>
        <div id="ticketPrice" class="infoDetail"></div>
      </div>
    
      <div id="buttonContainer" align="center" >
      <form name="dyform">
    	<a href="#"><input type=button value="예매하기" id="booking" class="buttonBooking"></a>
    	</form>
      </div>
    </div> <!-- bookingDetail -->
    
    
    <script type="text/javascript">
    	var mcode = "";
    	var mdate = "";
    	
    	//function setMcode(data) {   		
    	//	document.getElementById("hiddenInputId").value = data;
    	//}
    
    	function setMcode(data) {      	    	
    	if (!data) {  return;  }
    		
    		// AJAX 요청 생성
    	var xhr = new XMLHttpRequest();
    	xhr.open('POST', 'bookingMovieSelect.jsp', true);
    	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	xhr.onreadystatechange = function() {
        	if (xhr.readyState === XMLHttpRequest.DONE) {
            	if (xhr.status === 200) {               	
                	var movieDetail = xhr.responseText;                	
                	document.getElementById('bookingDetail2').innerHTML = movieDetail;                          	
            	} else {
                	// 서버 응답이 실패했을 때 실행할 코드
                	console.error('서버 요청 실패');
            	}
       	 	}
   	 	};
    	// 서버에 전송할 데이터 생성
    	var params = 'mcode=' + encodeURIComponent(data);
    	// 요청 전송
    	xhr.send(params);
    	
    	mcode = data;
		}
    	    		
    </script>
     

     	
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