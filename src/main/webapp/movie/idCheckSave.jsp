<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> OSB 영화관 </title>
</head>
<body>
	<h2> idCheckSave.jsp </h2>

	
	<%
	Mid = request.getParameter("userid");
	msg = "select count(*) cnt from member where id = '"+ Mid+"'";
	ST = CN.createStatement();
	RS = ST.executeQuery(msg);
	 if(RS.next()==true){atotal=RS.getInt("cnt");}
	 if(atotal>0){
		 System.out.println(Mid+"아이디가 중복입니다");
	 
	 %>
	  <script type="text/javascript">
	    alert("이미 사용중인 아이디입니다");
	    location.href="join.jsp";
	    opener.myform.id.value = "";
	    opener.myform.id.focus();
	    window.close();
	  </script>
	 <%
	 }else{
	%>
	  <script type="text/javascript">
	    alert("사용 가능한 아이디입니다");
	    opener.myform.pwd.focus();
	    window.close();
	  </script>
	 <%
	 }
	
	 %> 

</body>
</html>