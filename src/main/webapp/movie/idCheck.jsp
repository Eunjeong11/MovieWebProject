<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> ID 중복체크 | OSB 영화관 </title>

<script type="text/javascript">
	function first(){
		document.subform.btn.focus();
	}//first end
</script>

</head>
<body bgcolor="Moccasin" onload="first();">
	
	<% String id=request.getParameter("idx"); %>
	
	<div align="center">
	<br>
	<h2> 아이디 중복 확인 </h2>
	<p>
		<form name="subform" action="idCheckSave.jsp">
			<b>ID&nbsp;</b> 
			  <input type=text name="userid" value="<%=id%>">
			  <input type=submit value="확인">
		</form>
	</div>
</body>
</html>