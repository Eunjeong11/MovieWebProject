<%@ page language="java" contentType="text/html; charset=UTF-8"  %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> 회원가입 | OSB 영화관 </title>
	<link rel="stylesheet" href="../css/style.css">

<style>
	table {
		box-sizing:border-box;
		outline:none;	/*focus했을때 테두리 나오게 */
		font-family:'Noto Sans KR', sans-serif;
		font-size:14px;
		background-color:#f5f6f7;
		line-height:1.5em;
		color:#222;
		margin:0;
	}
	
	.joinform {
		width:400px;
		margin:auto;	/*가운데 정렬*/
		padding:0 20px;
		margin-bottom:20px;
	}
	
	.joinform .field {
		margin:5px 0;
		margin-bottom: 10px;
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: left;
	}
	
	.joinform b {
		display:block;	/*수직 정렬*/
		margin-bottom:5px;
	}
	
	.joinform input[type=button] {
		background-color:DarkRed;
		color:#fff;	
	}
	
	.joinform input:focus {
		border:1px solid DarkRed;
	}

  text1{font-size:13pt;
          }
    
  input[type=text]{padding-left:10px;
                     width:330px;
                     height:37px;}
    
  #btn1, #btn2 {
  	width:100px;
  	height:35px;
 	  padding: 1px 2px;
	  border: 0 none;
	  border-radius: 0.3rem;
	  font-weight: bold;
	  font-size: 14px;
	  cursor: pointer;
	  color: White;
	  background: SandyBrown;
  }

  #btn3 {
   	width:100px;
  	height:35px;
  	border-radius: 0.3rem;
  	padding: 1px 2px;
	  border: 0 none;
	  border-radius: 0.3rem;
	  font-weight: bold;
  }

</style>

<script>
	var mflag = false; //전역변수
	var flagP = false;//비번확인체크여부
	
	function myNullCheck(){
		var mname = document.myform.name.value;
		if(mname==null || mname==""){
			document.getElementById("name_ch").innerHTML="*이름을 입력하세요";
			document.myform.name.focus();
			return;
		}else{
			document.getElementById("name_ch").innerHTML="";
			document.myform.id.focus();
		}
		
		var mid = document.myform.id.value;
		if(mid==null || mid==""){
			document.getElementById("id_ch").innerHTML="*아이디를 입력하세요";
			document.myform.name.focus();
			return;
		}else{
			document.getElementById("id_ch").innerHTML="";
			document.myform.pwd.focus();
		}
		
		var mpwd = document.myform.pwd.value;
		if(mpwd==null || mpwd==""){
			document.getElementById("pwd_ch").innerHTML="*비밀번호를 입력하세요";
			document.myform.pwd.focus();
			return;
		}else{
			document.getElementById("pwd_ch").innerHTML="";
			document.myform.pwd2.focus();
		}
		
		var mpwd2 = document.myform.pwd2.value;
		if(mpwd2==null || mpwd2==""){
			document.getElementById("pwd2_ch").innerHTML="*비밀번호를 재입력하세요";
			document.myform.pwd2.focus();
		}else{
			document.getElementById("pwd2_ch").innerHTML="";
			document.myform.birth.focus();
		}
		
		var mbirth = document.myform.birth.value;
		if(mbirth==null || mbirth==""){
			document.getElementById("birth_ch").innerHTML="*생년월일을 입력하세요";
			document.myform.birth.focus();
			return;
		}else{
			document.getElementById("birth_ch").innerHTML="";
			document.myform.phone.focus();
		}
		
		var mphone = document.myform.phone.value;
		if(mphone==null || mphone==""){
			document.getElementById("phone_ch").innerHTML="*전화번호를 입력하세요";
			document.myform.phone.focus();
			return;
		}
		
		if(mflag==false){
			alert("id 중복 확인하세요")
			document.myform.btn.focus();
			return;
		}else{
			document.myform.submit();
		}
	}//nullCheck end
	
	function myInfo(){
		var mid = document.myform.id.value;
		if(mid==null || mid==""){
			alert("아이디를 입력하세요");
			document.myform.id.focus();
			return;
		}
		mflag = true;
		window.open("idCheck.jsp?idx="+mid, "pwd", "left=500, top=300,width=500,height=200");
	}//info end
	
/* 	비밀번호 :<input type="text" name="pwd" value="1234">
		<span id="pwd_ch"></span> <br>
	비밀번호 확인 :<input type="text" name="pwd2" value="1234"> 
		<input type="button" onclick="checkPwd();" value="비밀번호확인"> 
		<span id="pwd2_ch"></span> <br> */
	
	
	  function checkPwd(){ //pwd2_ch
			var str = document.getElementById("pwd2_ch");
			var a = myform.pwd.value;
			var b = myform.pwd2.value;
		if(a==b){
			str.innerHTML = "<font color='blue'>비밀번호가 일치합니다</font>";
			flagP = true; //비밀번호 일치 플래그
		}else{
			flagP = false;
			str.innerHTML = "<font color='red'>비밀번호가 일치하지 않습니다</font>";
			a="";
			b="";
		}
	}//checkpwd end  
	
	function myfirst(){
		document.myform.name.focus();
	}//first end
</script>

</head>
<body onload="myfirst()">
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
    
    
    
    
	<br><br><br>
	<div align="center">
		<img src="../images/OSB.png">
	</div>
	<br>
	<table>
	  <div class="joinform">
	 	<form name="myform" action="joinSave.jsp">
	  	<div class="field">
	 			<b><text1>이름</text1></b>
	 			<input type="text" name="name" value="red">
	 			<span id="name_ch"></span> <br>
	 		</div>    


	  	<div class="field">
	      <b><text1>아이디 </text1><span style="font-size:12pt;">ID</span></b>
	     	<input type="text" name="id" value="red123">
	      <div class="btn_id">
		 			<input type="button" name="btn" id="btn1" onclick="myInfo();" value="중복확인">
		 			<span id="id_ch" style="color:red"></span>	<br>
				</div>
			</div>
 			
 			
	  	<div class="field">
	 			<b><text1>비밀번호</text1> <span style="font-size:12pt;">PASSWORD</span></b>
	 			<input type="text" name="pwd" value="1234">
	 			<span id="pwd_ch"></span> <br>
	 		</div>
 		
	 		<div class="field">
	 			<b><text1>비밀번호 확인</text1></b>
	 			<input type="text" name="pwd2" value="1234"> 
	      <div class="btn_id">
		 			<input type="button" id="btn2" onclick="checkPwd();" value="비밀번호확인"> 
		 			<span id="pwd2_ch" style="color:red"></span> <br>
	 			</div>
	 		</div>
			 		
	 		<div class="field">
	 			<b><text1>생년월일</text1> <span style="font-size:10pt;">(yy/mm/dd)</span> </b>
	 			<input type="text" name="birth" value="851231">
	 			<span id="birth_ch"></span> <br>
	 		</div>


	 		<div class="field">
	 			<b><text1>전화번호</text1></b>
	 			<input type="text" name="phone" value="0102344567">
	 			<span id="phone_ch"></span> <br>
	 		</div>

  		<br>
  		<div align="center">
  			<input type="button" id="btn3" onclick="myNullCheck();" value="가입하기">
  		</div>
 		</form>
 		

    </div><!-- .joinform END -->
    <br>
  </table>


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