<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>  </title>
</head>
<body>
 <%! //전역변수, 전역함수 
    //ssi.jsp문서는 단독실행가능
   Connection CN; //CN필드 DB서버정보, 명령어생성할때 참조
   Statement ST; //ST=CN.createStateme()명령어생성
   PreparedStatement PST; //PST=CN.prePareStatement("쿼리문")    
   ResultSet RS; //RS=ST.executeQuery("select~"); 조회한결과를 RS기억
 	
   //영화관련 전역변수	
   int Mcode; 
   String Mfile; // 영화포스터
   String Mtitle, Mgrade;
   
   //댓글관련 전역변수
   String MRdata;   //영화 댓글
   int MRcode; //영화댓글코드
   int MRrn, MRnum ;   //영화 댓글행번호, 삭제및 수정작업을 위한 num필드
   String MRwriter, MRcontent ;   //영화댓글 글쓴이, 댓글내용
   String MRidx;
   String GRdata;
   int GRrn;
   int GRnum;
   String GRwriter;
   String GRcontent;
   
   //댓글 페이징관련 전역변수
   String pnum="1" ;
   int pageNUM, pagecount ;
   int start, end;  //시작행, 끝행
   int startpage, endpage ; //시작페이지, 끝페이지
   int temp ; //일시적인 보관소 
   
   
   //채은님 booking.jsp 변수
   String Mdate;
  
   
   String msg, msg3; //msg="쿼리문기술"
   int sabun; // 전화번호 
   String name, title, pwd, phone, email, content, addr1, addr2; //이름, 제목, 패스워드, 이메일, 주소
   String url, file, size;
   java.util.Date Gnalja; //날짜
   int Gtotal=27, Stotal=7, Rtotal=0; 
   int Rnum; // 댓글의 num필드기억
   int Rrn; // 댓글의 rownum필드기억
   String Rdata;
   
   //idcheck관련 변수
   int atotal;
   String Mid;
 %>
 
 <%
   try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN=DriverManager.getConnection(url,"system", "1234");
	System.out.println("------ db연결 성공했습니다 ------ ");
   }catch(Exception ex){System.out.println("db에러:"+ex);}
 %>

</body>
</html>


















