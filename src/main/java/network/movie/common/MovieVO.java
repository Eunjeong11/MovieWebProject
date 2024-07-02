package network.movie.common;

public class MovieVO {   //임시로 만든 변수와 getter setter
 int mcode ; 
 String title, etitle, genre, mgrade, poster ;
 java.util.Date rls ; 
 int runtime ;
 int rn;
 
		public int getMcode() {	return mcode;}
		public void setMcode(int mcode) {	this.mcode = mcode;}
		public String getTitle() {	return title;}
		public void setTitle(String title) {	this.title = title;}
		public String getEtitle() {	return etitle;}
		public void setEtitle(String etitle) {	this.etitle = etitle;}
		public String getGenre() {	return genre;}
		public void setGenre(String genre) {	this.genre = genre;}
		public String getMgrade() {	return mgrade;}
		public void setMgrade(String mgrade) {	this.mgrade = mgrade;}
		public java.util.Date getRls() {	return rls;}
		public void setRls(java.util.Date rls) {	this.rls = rls;}
		public int getRuntime() {	return runtime;}
		public void setRuntime(int runtime) {	this.runtime = runtime;}
		public int getRn() {	return rn;}
		public void setRn(int rn) {	this.rn = rn;} 
		public String getPoster() {	return poster;}
		public void setPoster(String poster) {	this.poster = poster;} 
	
}//MovieVO class end
