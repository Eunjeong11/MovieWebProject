<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> guest_replyDeleteSave.jsp </title>
</head>
<body>
  <h2> guestCopy폴더  guest_replyDeleteSave.jsp  </h2>
 
<%
 //단독실행금지 
 
 int Ridx = Integer.parseInt(request.getParameter("ridx"));     //ridx=영화코드 
 int Rnum  = Integer.parseInt(request.getParameter("rnum"));    //rnum=댓글번호 
 System.out.println("댓글삭제 Ridx =" + Ridx );
 System.out.println("댓글삭제 Rnum =" + Rnum );
 
 //moviereply(num, writer, content, code)구조
 msg = "delete from moviereply where code= ? and num = ?";
 PST = CN.prepareStatement(msg); 
  PST.setInt(1,Ridx);
  PST.setInt(2,Rnum);
  
//진짜 댓글 삭제처리
 int OK = PST.executeUpdate() ; 
 if(OK>0){System.out.println("PST명령어 guestreply댓글테이블 삭제 성공\n ") ; }
 else{System.out.println("PST명령어  guestreply댓글테이블 삭제 실패실패\n ") ; }
 
//Ridx영화코드에 해당하는 상세페이지로 이동
 response.sendRedirect("movieDetail.jsp?idx="+Ridx);   
%>   

<p>  

</body>
</html>







