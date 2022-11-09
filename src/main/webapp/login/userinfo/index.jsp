<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>User Info</title>
	<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	if(session.getAttribute("sID") != null){
		String sID = (String) session.getAttribute("sID");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요한 서비스입니다.');");
		script.println("window.parent.location.reload();");
		script.println("location.href='../../index.html';");
		script.println("</script>");
		script.close();
	}
	%>





	<h3>User INFO</h3>
	<h3>show</h3>
</body>
</html>