<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> OSB 영화관 </title>
</head>
<body>
  <h2> moviereply_UpdateSave.jsp  </h2>
 
<%
 	//단독실행금지 
 	//var msg="moviereply_InsertSave.jsp?writer="+dw+"&content="+dc+"&code="+code;
 
 	MRwriter = request.getParameter("writer");     //ridx=영화코드 
  MRcontent = request.getParameter("content");     //ridx=영화코드 
  MRcode = Integer.parseInt(request.getParameter("code"));     //ridx=영화코드 
  MRnum  = Integer.parseInt(request.getParameter("num"));    //rnum=댓글번호 
  System.out.println("댓글수정 MRwriter =" + MRwriter );
  System.out.println("댓글수정 MRcontent =" + MRcontent );
  System.out.println("댓글수정 MRcode =" + MRcode );
  System.out.println("댓글수정 MRnum =" + MRnum );
 
  //moviereply(num,writer,content,code)구조
  msg = "update moviereply set content=? where num = ?";
  PST = CN.prepareStatement(msg); 
 	 PST.setString(1, MRcontent);
 	 PST.setInt(2, MRnum);
  
	//진짜 댓글 삭제처리
	 int OK = PST.executeUpdate() ; 
	 if(OK>0){System.out.println("PST명령어 moviereply댓글테이블 수정 성공\n ") ; }
	 else{System.out.println("PST명령어 moviereply댓글테이블 수정 실패\n ") ; }
 
//Ridx영화코드에 해당하는 상세페이지로 이동
 response.sendRedirect("movieDetail.jsp?idx="+MRcode);   
%>   

<p>  

</body>
</html>







