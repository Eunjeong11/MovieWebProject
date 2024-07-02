<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="network.movie.common.MovieDAO" %>
<%@ page import="network.movie.common.MovieVO" %>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
</head>
<body>
	<h2> bookingseat_check </h2>
	
<% 
 	
	String disp = "";
	disp = (String)session.getAttribute("naver");		

	String[] seats = request.getParameterValues("seat");
	String[] date = request.getParameterValues("date");
	String[] mcode = request.getParameterValues("mcode");
	String[] bcnt = request.getParameterValues("cnt");//
	
	Mcode = Integer.parseInt(mcode[0]);
	Mdate = date[0];
	String bookedSeats = String.join(",", seats);
	//int seatcnt = seats.length;
	int ticketPrice = Integer.parseInt(bcnt[0]);
	
	
	
	
	String seqQuery = "SELECT booking_seq.nextval FROM dual";
	PreparedStatement seqPST = CN.prepareStatement(seqQuery);
	ResultSet seqRS = seqPST.executeQuery();

	int bookingId = 0; // booking_seq.nextval 값을 저장할 변수

	if (seqRS.next()) {
    	bookingId = seqRS.getInt(1); // 첫 번째 컬럼의 값을 가져옴
	}
	
	
	
	List<String> list = new ArrayList<>();
	boolean check = true;
	
	for(int i = 0; i < date.length; i++){
		System.out.println(date[i]);
	}
	
	System.out.println(mcode[0]);
	
	if(application.getAttribute("seats") != null){
		list = (List<String>)application.getAttribute("seats");
	}
	
	for(String s : seats){
		if(list.contains(s)){
			check = false;
			break;
		}
	}
	
	if(check){
		for(int i = 0; i < seats.length; i++){
			list.add(seats[i]);
			System.out.println(seats[i]);
		}
		application.setAttribute("seats", list);
		response.sendRedirect("bookingComplete.jsp?idx="+bookingId);
	}
	
	
	msg = "insert into booking values(?, ?, ?, ?, ?, ?)";
	PST = CN.prepareStatement(msg); 
		PST.setInt(1, bookingId);
		PST.setString(2, disp);
	 	PST.setInt(3, Mcode);
	 	PST.setString(4, Mdate);
	 	PST.setString(5, bookedSeats);
	 	PST.setInt(6,ticketPrice);
	
	int OK = PST.executeUpdate() ; //저장처리 
	if(OK>0){System.out.println("PST명령어 booking 저장 성공\n ") ; }
	else{System.out.println("PST명령어 booking 저장 실패실패\n ") ; }

	

	
%>
</body>
</html>