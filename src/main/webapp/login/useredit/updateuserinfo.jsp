<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tocuser.userDAO" %>
<%@ page import="tocuser.encrypt" %>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("UTF-8");
String userID = null;
String userPassword = null;



if((String) session.getAttribute("sID") != null) {
	userID = (String)session.getAttribute("sID");
}


userPassword = (String) request.getParameter("rpassword");




userDAO userDAO = new userDAO();
int result = userDAO.changepwd(userID, userPassword);
//int result = userDAO.join(userID, userPassword, Name, Email);
if (result == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호 변경이 완료되었습니다!');");
	script.println("location.href='../../element/home/index.jsp';");
	//script.println("location.href='../login/index.html';");
	script.println("</script>");
	script.close();
	return;
}
else if (result == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호 변경에 실패하였습니다.');");
	//script.print("alert('");
	//script.print(userID + userPassword + Name + Email);
	//script.println("');");
	script.println("location.href='../../element/home/index.jsp';");
	script.println("</script>");
	script.close();
	return;
}






















%>
</body>
</html>