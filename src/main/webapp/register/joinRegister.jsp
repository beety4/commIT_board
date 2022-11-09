<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tocuser.userDTO"%>
<%@ page import="tocuser.userDAO"%>
<%@ page import="emailauth.SHA256" %>
<%@ page import="java.io.PrintWriter"%>
    
    
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;
	String Name = null;
	String Email = null;
	

	if((String) session.getAttribute("sID") != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 된 상태입니다.');");
		script.println("location.href='../index.jsp';");
		script.println("window.parent.location.reload();");
		script.println("</script>");
		script.close();
	}


	userID = (String) request.getParameter("rid");
	userPassword = (String) request.getParameter("rpassword");
	Name = (String) request.getParameter("nickname");
	Email = (String) request.getParameter("email");


	
	userDAO userDAO = new userDAO();
	int result = userDAO.join(userID, userPassword, Name, Email, SHA256.getSHA256(Email), '0');
	//int result = userDAO.join(userID, userPassword, Name, Email);
	if (result == 1) {
		PrintWriter script = response.getWriter();
		session.setAttribute("sID",userID);
		script.println("<script>");
		//script.println("alert('회원가입 성공!');");
		script.println("location.href='email/mailSend.jsp';");
		//script.println("location.href='../login/index.html';");
		script.println("</script>");
		script.close();
		return;
	}
	else if (result == -1 || result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디 혹은 메일 입니다.');");
		//script.print("alert('");
		//script.print(userID + userPassword + Name + Email);
		//script.println("');");
		script.println("location.href='index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>

