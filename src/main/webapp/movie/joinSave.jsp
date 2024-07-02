<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> OSB 영화관 </title>
</head>
<body>
	<h2>  </h2>
	<%!

	
	String Mname;
	int Mpwd, Mbirth, Mphone;
	int Mtotal;//전체데이터개수
	%>
	
	<%
	//자바코드기술 단독실행금지
	Mname = request.getParameter("name");
	Mid = request.getParameter("id");
	Mpwd = Integer.parseInt(request.getParameter("pwd"));
	Mbirth = Integer.parseInt(request.getParameter("birth"));
	Mphone = Integer.parseInt(request.getParameter("phone"));
	
	System.out.println("name= "+Mname);
	System.out.println("id= "+Mid);
	System.out.println("pwd= "+Mpwd);
	System.out.println("birth= "+Mbirth);
	System.out.println("phone= "+Mphone);
	
	String msg = "select count(*) cnt from member where id = '"+Mid+"'";

	ST = CN.createStatement();	
 	System.out.println(msg);
	RS = ST.executeQuery(msg);
	if(RS.next()==true){Mtotal=RS.getInt("cnt");}
	if(Mtotal>0){
		System.out.println(Mid+"아이디가 중복입니다");
	%>
	 <script type="text/javascript">
    	alert("code데이터 중복입니다");
    	location.href="join.jsp";
  	</script>
	<%
	}else{
		msg = "insert into member values(?,?,?,?,?)";
		PST = CN.prepareStatement(msg);
		 PST.setString(1, Mname);
		 PST.setString(2, Mid);
		 PST.setInt(3, Mpwd);
		 PST.setInt(4, Mbirth);
		 PST.setInt(5, Mphone);
		 
		int OK = PST.executeUpdate(); 
		if(OK>0){
			System.out.println("회원가입 성공");
			response.sendRedirect("joinComplete.jsp");
		}
		else{System.out.println("회원가입 실패");}
	}
	%>
	
	
</body>
</html>