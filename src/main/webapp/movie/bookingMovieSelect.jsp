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
</head>
<body>
	<%
	// 클라이언트에서 전송된 영화 코드를 받음
	Mcode = Integer.parseInt(request.getParameter("mcode"));

	// 영화 정보를 조회
	MovieDAO dao = new MovieDAO();
	MovieVO vo = dao.movieDetail(Mcode);
	Mtitle = vo.getTitle();
	Mgrade = vo.getMgrade();
	Mfile = vo.getPoster();
	//System.out.println(Mfile);

	
	out.println("<div class=\"infoDetail\">" + Mtitle + "</div>");
	out.println("<div class=\"infoDetail\">" + Mgrade + "</div>");
	out.println("<div class=\"infoDetail\"> OSB 홍대점 </div>");
  
	%>	
	
</body>
</html>