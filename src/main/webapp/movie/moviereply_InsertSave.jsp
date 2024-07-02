<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> OSB 영화관 </title>
</head>
<body>
 
<%
	//단독실행금지 
	//자바스크립트 var msg="moviereply_InsertSave.jsp?writer="+dw+"&content="+dc+"&code="+code;	

	MRwriter = request.getParameter("writer");
	MRcontent = request.getParameter("content");
	MRcode = Integer.parseInt(request.getParameter("code"));
 
	System.out.println("댓글넘어온 저자 = " + MRwriter );
	System.out.println("댓글넘어온 내용 = " + MRcontent );
	System.out.println("댓글넘어온 코드 = " + MRcode );

	//moviereply(num,content,code,id)구조
	msg = "insert into moviereply values(moviereply_seq.nextval, ?, ?, ?)";
	PST = CN.prepareStatement(msg); 
		PST.setString(1, MRcontent);
	 	PST.setInt(2, MRcode);
	 	PST.setString(3, MRwriter);
  
	int OK = PST.executeUpdate() ; //댓글저장처리 
	if(OK>0){System.out.println("PST명령어 moviereply댓글테이블 저장 성공\n ") ; }
	else{System.out.println("PST명령어 moviereply댓글테이블 저장 실패\n ") ; }
 
	response.sendRedirect("movieDetail.jsp?idx="+ MRcode);
%>   

</body>
</html>




