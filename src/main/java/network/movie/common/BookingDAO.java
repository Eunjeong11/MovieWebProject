package network.movie.common;

import java.sql.*;
import java.util.ArrayList;


public class BookingDAO {   //Data Access Object
	Connection CN;
	Statement ST;
	PreparedStatement PST;
	ResultSet RS;
	String msg;
	
	public BookingDAO() {
		try { 
			CN=MovieDatabase.getConnection();}
		catch(Exception ex) {
			System.out.println("BookingDAO.java db연결실패:" +ex);
		}
	}//end
	
	
	public BookingVO bookingDetail(int data){
		BookingVO vo = new BookingVO();
	  	try {
	  		 msg = "select * from booking where booking_code = " + data;
	  		 ST = CN.createStatement();
	  		 RS = ST.executeQuery(msg);
	  		 if(RS.next()==true) {
	  			vo.setBcode(RS.getInt("booking_code"));
	  		 	vo.setId(RS.getString("id"));
	  		 	vo.setMcode(RS.getInt("mcode"));
	  		 	vo.setMdate(RS.getString("mdate"));
	  		 	vo.setSeatNum(RS.getString("seat_num"));
	  		 	vo.setPrice(RS.getInt("price"));	  		 
	  		 }
	  	}catch(Exception e){System.out.println("Error " + e.toString());	}
	  	return vo;
	 }//end 
	
	
	public BookingVO bookingsearch(String disp){
		BookingVO vo = new BookingVO();
	  	try {
	  		 msg = "select * from booking where id = " + "'"+disp+"' order by mdate desc";
	  		 ST = CN.createStatement();
	  		 RS = ST.executeQuery(msg);
	  		 if(RS.next()==true) {
	  			vo.setBcode(RS.getInt("booking_code"));
	  		 	vo.setId(RS.getString("id"));
	  		 	vo.setMcode(RS.getInt("mcode"));
	  		 	vo.setMdate(RS.getString("mdate"));
	  		 	vo.setSeatNum(RS.getString("seat_num"));
	  		 	vo.setPrice(RS.getInt("price"));	  		 
	  		 }
	  	}catch(Exception e){System.out.println("Error " + e.toString());	}
	  	return vo;
	 }//end 
		
}// class BookingDAO end
