<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="emailauth.mailDAO"%>
<%@ page import="emailauth.SHA256" %>
<%@ page import="java.io.PrintWriter"%>
    
    
<%
	request.setCharacterEncoding("UTF-8");
	String code = null;
	String sID = null;
	//String mailID = null;
	
	code = (String) request.getParameter("emailhash");
	sID = (String) request.getParameter("userID");

	mailDAO mailDAO = new mailDAO();
	if(sID == null || code == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증 메일 전송 중 오류가 발생하였습니다.');");
		script.println("location.href='../../index.jsp';");
		script.println("</script>");
		script.close();
	}
	
	int emailChecked = mailDAO.getemailcheck(sID);
	if(emailChecked == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 인증이 완료된 회원입니다.');");
		script.println("location.href ='../../index.jsp'"); 
		script.println("</script>");
		script.close();
		return;
	} 
	
	
	// hash 처리한 결과를 비교해 결과 값 반환
	String Email = mailDAO.getemail(sID);
	boolean isRight = (new SHA256().getSHA256(Email).equals(code)) ? true : false;
	if(isRight == true) {
		mailDAO.setemailcheck(sID);
		session.setAttribute("sID",sID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 성공했습니다!');");
		script.println("location.href='../../index.jsp';");
		script.println("</script>");
		script.close();
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 실패하였습니다.');");
		script.println("location.href='../../index.jsp';");
		script.println("</script>");
		script.close();
	}
%>

