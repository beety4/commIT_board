<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.noticeDTO"%>
<%@ page import="notice.noticeDAO"%>
<%@ page import="java.io.PrintWriter"%>
    
    
<%
	request.setCharacterEncoding("UTF-8");

	String Title = (String) request.getParameter("Title");
	String Category = (String) request.getParameter("Category");
	String Content = (String) request.getParameter("Content");


	String userID = null;
	if((String) session.getAttribute("sID") == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요한 서비스입니다.');");
		script.println("location.href='../../login/index.jsp';");
		script.println("</script>");
		script.close();
	} else {
		userID = (String) session.getAttribute("sID");
		
		noticeDAO noticeDAO = new noticeDAO();
		int result = noticeDAO.write(Title, userID, Category, Content);
		if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패하였습니다.');");
			//script.print("alert('");
			//script.print(Title + " - " + Category + " - " + Content);
			//script.println("');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='index.jsp';");
			script.println("</script>");
			script.close();
		}
	}

%>

