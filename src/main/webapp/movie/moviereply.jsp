<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> OSB 영화관 </title>

<style>
	a{
    text-decoration:none;	
    color:blue;
	}
	
	.container {
		width:700px;
	  padding-right: 15px;
	  padding-left: 15px;
	  margin-right: auto;
	  margin-left: auto;
	}
	
	#red_bar {
		padding: 0 0 10px;
	}
	table {
		width:100%;
		border-right:none;
		border-left:none;
	}
	table > tbody > tr > td {
	  padding: 8px 16px;
	  line-height: 1.42857143;
	  vertical-align: top;
	  border-top: 1px solid #ddd;
	}


	#bt_save { 
	  padding: 6px 10px;
	  border: 0 none;
	  border-radius: 0.3rem;
	  font-weight: bold;
	  font-size: 16px;
	  cursor: pointer;
	  box-shadow: 0 3px 5px -1px rgba(0, 0, 0, 0.2);
	  
	  color: DrakGray;
	  background: #eee;
	  margin: 0.5rem 0;
	  transition: box-shadow 0.3s linear;
	}
  
	#bt_save:hover {
    box-shadow: 0 4px 12px -2px rgba(0, 0, 0, 0.3);
	}
	#bt_edit { 
	  padding: 3px 5px;
	  border: 0 none;
	  border-radius: 0.3rem;
	  font-weight: bold;
	  font-size: 14px;
	  cursor: pointer;
	  
	  color: White;
	  background: GoldenRod;
	  transition: box-shadow 0.3s linear;
	}
	
	#bt_delete { 
	  padding: 3px 5px;
	  border: 0 none;
	  border-radius: 0.3rem;
	  font-weight: bold;
	  font-size: 14px;
	  cursor: pointer;
	  
	  color: White;
	  background: Red;
	  transition: box-shadow 0.3s linear;
	}
	
	.table-striped > tbody > tr:nth-of-type(odd)  {
		 background-color: #f9f9f9;
	}

	.pull-right {
  	float: right !important;
	}
</style>

<script>
	var gnum ; //num 전역변수
	
	function re_edit(num, writer, content){
		reply_form.bt_save.value="댓글수정" ;
		reply_form.writer.value= writer ;
		reply_form.content.value= content ;
		gnum = num ;
	}
		
  function mysave(code){
	  var bt = document.reply_form.bt_save.value ;
	  var dw = reply_form.writer.value ;
	  var dc = reply_form.content.value ; 
		
		alert(" code = " + code  + "  11111111111 testtest   4-11-목요일 guest_reply.jsp")
		if(bt=="댓글저장"){
      var msg="moviereply_InsertSave.jsp?writer="+dw+"&content="+dc+"&code="+code;		  
			document.reply_form.action=msg; //<form name=reply_sub action=testWriteSave.jsp
			document.reply_form.method="post";
			document.reply_form.submit();  //<input type=submit> 
	  }else if(bt=="댓글수정"){
			reply_form.bt_save.value="댓글저장";
		  var msg="moviereply_UpdateSave.jsp?num="+gnum+"&writer="+dw+"&content="+dc+"&code="+code;		  
			document.reply_form.action=msg;
			document.reply_form.method="post";
			document.reply_form.submit();  //<input type=submit>  
		}
	}//end
</script>

</head>
<body>
<%
  //단독실행금지
  //movieDetail.jsp에서 가져온 영화코드값 MRdata변수를 기억
  MRdata = request.getParameter("Ridx");
  System.out.println("moviereply.jsp문서로 넘어온 영화코드 MRdata = " + MRdata +"\n");
	
  String show = "";		//로그인 세션 저장, 댓글 writer 정보 저장
  show = (String)session.getAttribute("naver");

  //movieDetail.jsp에서 가져온 페이지번호 pnum변수기억함
  pnum = request.getParameter("MRidx");
  System.out.println("moviereply.jsp문서로 넘어온 페이지번호 pnum = " + pnum +"\n");
  
  if(pnum==null || pnum==""){ pnum="1";}
  pageNUM = Integer.parseInt(pnum);
  
  msg="select count(*) cnt from moviereply where code = "+ MRdata;
  ST=CN.createStatement();
  RS=ST.executeQuery(msg);
  if(RS.next()==true){
  	Gtotal=RS.getInt("cnt");  //전체댓글 갯수
  }
  
  if(Gtotal%5==0){
  	pagecount = Gtotal/5;
  }else{
  	pagecount = (Gtotal/5)+1;
  }
  
  start = (pageNUM-1)*5+1;
  end = pageNUM*5;
  
  temp = (pageNUM-1)%10;
  startpage = pageNUM-temp ;
  endpage = startpage + 9;
  if(endpage>pagecount){ endpage=pagecount;}
  
%>


	<br>
	
<div class="container">	

	<table id="red_bar" class="table table-striped" style="text-align: center;" cellspacing="0">  	
		<tbody>
			<tr>
				<td align="left" bgcolor="DarkRed" style="color:white">댓글</td>
			</tr>
		</tbody>
	</table>
	
<%
	//member inner join moviereply
	
	String a = "select * from ( ";
	String b = "select rownum rn, m.id, r.num, r.content from member m  inner join moviereply r ";
	String z = " on m.id = r.id and r.code = " + MRdata;
	String c = ") where rn between  " + start + " and " + end;
	System.out.println(msg);
	
	msg = a+b+z+c ;
	ST = CN.createStatement();
	RS = ST.executeQuery(msg);

	while(RS.next()==true){
	 	MRrn = RS.getInt("rn"); //댓글의 순서행번호
	 	MRnum = RS.getInt("num"); //삭제및 수정작업을 위한  num필드
	 	MRwriter = RS.getString("id");   //댓글의 저자 writer
	 	MRcontent = RS.getString("content") ; //댓글의 내용 content
	 	System.out.println("성공성공");
%>
		<table class="table table-striped" style="text-align: center;" cellspacing="0">  	
			<tbody>
				<tr>
			   	<td align="left"><b> <%= MRwriter %> </b></td>
			  	<td align="right" style="color:Gainsboro"> <%= MRrn %>  </td>
			   	
		   	</tr>
		   	<tr>
					<td align="left"><%= MRcontent %>  </td>
			   	<td align="right">
			   	
<%
  if(show==null || show.equals("")){
	  
  }else{
%>		   	
		      <a href="moviereply_DeleteSave.jsp?rnum=<%=MRnum%>&&ridx=<%=MRdata%>"> 
		      <input type="button" id="bt_delete" class="pull-right" name="bt_delete" value="삭제">
		      </a>
		      <input type="button" id="bt_edit" class="pull-right" name="bt_save" onclick="re_edit('<%=MRnum %>','<%=MRwriter %>','<%=MRcontent %>')" value="댓글수정">
<%
  }//if end
%>		   	
			   	</td>
			 	</tr>	
		 	</tbody>
<% 	
	 }//while end
%>  
		 	<tbody>
			 	<tr align="center" style="background-color:transparent"> 
		  		<td colspan="2">
<%
	if(startpage>10){
		out.println("<a href=movieDetail.jsp?MRidx="+(startpage-10)+"&&idx="+MRdata+">[이전]</a>");
	}

	for(int i=startpage; i<=endpage; i++){
		if(i==pageNUM){
			out.println("<font style='color:Crimson;font-size:14pt'>["+ i +"]</font>");
		}else{
			out.println("<a href=movieDetail.jsp?MRidx="+i+"&&idx="+MRdata+">["+i+"]</a>");
		}	
	}

	if(endpage<pagecount){
		out.println("<a href=movieDetail.jsp?MRidx="+(startpage+10)+"&&idx="+MRdata+">[다음]</a>");
	}
%>
					</td>
				</tr>
			</tbody>
		</table> 


<%
  if(show==null || show.equals("")){
	  
  }else{
%>	
	<br>
	<br>
	<form name="reply_form" >
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd" cellspacing=0>
			<tbody>
		 	  <tr>
		 	  	<td align="left"> <%= show %> 
		 	  	<input type="hidden" name="writer" value="<%= show %>" readonly>
		 	  	<input type="hidden" name="code" value="<%= MRdata %>" readonly>
		 	  	</td>
		 	  </tr>
	 	  	<tr>
		 	  	<td> <textarea rows="4" cols="85" class="form-control" name="content" placeholder="댓글 쓰기"></textarea> </td>
		 	  </tr>
	 	  </tbody>
	  </table>
  		<input type="button" id="bt_save" class="pull-right" name="bt_save" onclick="mysave(<%= MRdata %>)" value="댓글저장">
	</form>
<%
  }//if end
%>
	   
</div> <!-- .conatiner END -->
<p style="margin-bottom:150px"></p>
</html>