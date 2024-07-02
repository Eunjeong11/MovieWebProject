package network.movie.common;

import java.sql.*;
import java.util.ArrayList;


public class MovieDAO {   //Data Access Object
	Connection CN;
	Statement ST;
	PreparedStatement PST;
	ResultSet RS;
	String msg;
	
	public MovieDAO() {
		try { 
			CN=MovieDatabase.getConnection();}
		catch(Exception ex) {
			System.out.println("GuestDAO.java db연결실패:" +ex);
		}
	}//end
	
	public ArrayList<MovieVO> movieSelect(){//전체출력
	 	 ArrayList<MovieVO> list = new ArrayList<MovieVO>();
	  	try {
	  		 msg = "select rownum rn,  m.* from movie ";
	  		 ST = CN.createStatement();
	  		 RS = ST.executeQuery(msg);
	  		 while(RS.next()==true) {
	  			 MovieVO vo = new MovieVO();
	  		 	 vo.setRn(RS.getInt("rn"));
	  		 	 vo.setMcode(RS.getInt("mcode"));
	  		 	 vo.setTitle(RS.getString("title"));
	  		 	 vo.setEtitle(RS.getString("etitle"));
	  		 	 vo.setGenre(RS.getString("genre"));
	  		 	 vo.setMgrade(RS.getString("mgrade"));
	  		 	 vo.setRuntime(RS.getInt("runtime"));
	  		 	 vo.setRls(RS.getDate("rls"));
	  		 	 vo.setPoster(RS.getString("poster"));
	  		 	 list.add(vo); //add()추가, 크기size(), 접근get()
	  		 }
	  	}catch(Exception e){				}
	  	return list;
	 }//end
	
	public MovieVO  movieDetail(int data){//guestDetail.jsp문서
		MovieVO vo = new MovieVO();
	  	try {
	  		 msg = "select  rownum rn, m.* from movie m where mcode = " + data;
	  		 ST = CN.createStatement();
	  		 RS = ST.executeQuery(msg);
	  		 if(RS.next()==true) {
	  			vo.setRn(RS.getInt("rn"));
	  		 	vo.setMcode(RS.getInt("mcode"));
	  		 	vo.setEtitle(RS.getString("etitle"));
	  		 	vo.setTitle(RS.getString("title"));
	  		 	vo.setRls(RS.getDate("rls"));
	  		 	vo.setRuntime(RS.getInt("runtime"));
	  		 	vo.setMgrade(RS.getString("mgrade"));
	  		 	vo.setGenre(RS.getString("genre"));
	  		 	vo.setPoster(RS.getString("poster"));
	  		 }
	  	}catch(Exception e){System.out.println("Error " + e.toString());	}
	  	return vo;
	 }//end 상세처리 guestDetail함수 end
		
}// class MovieDAO end
