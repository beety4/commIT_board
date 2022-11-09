<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tocuser.userDTO"%>
<%@ page import="tocuser.userDAO"%>
<%@ page import="emailauth.mailDAO" %>
<%@ page import="java.io.PrintWriter"%>


<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;


	if((String) session.getAttribute("sID") != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 된 상태입니다.');");
		script.println("location.href='../index.jsp';");
		script.println("window.parent.location.reload();");
		script.println("</script>");
		script.close();
	}
	

	userID = (String) request.getParameter("lid");
	userPassword = (String) request.getParameter("lpassword");

	
	userDAO userDAO = new userDAO();
	mailDAO mailDAO = new mailDAO();
	int result = userDAO.login(userID, userPassword);
	int emailChecked = mailDAO.getemailcheck(userID);
	if (result == 1) {
		if (emailChecked != 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이메일 인증이 완료되지 않은 계정입니다. 메일을 확인해 주십시오.')");
			script.println("location.href='index.jsp';");
			script.println("</script>");
			script.close();
		} else { 
			PrintWriter script = response.getWriter();
			session.setAttribute("sID",userID);
			script.println("<script>");
			//script.print("alert('");
			//script.print(userID);
			//script.println("님 환영합니다!')");
			script.println("location.href='../element/home/index.jsp';");
			script.println("window.parent.location.reload();");
			script.println("</script>");
			script.close();
		}
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력하신 ID 혹은 Password가 일치하지 않습니다.')");
		script.println("location.href='index.jsp';");
		//script.println("document.getElementById('lid').focus();");
		script.println("</script>");
		script.close();
	}
%>

