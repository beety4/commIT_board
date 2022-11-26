<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="major.majorDTO" %>
<%@ page import="major.majorDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("sID") != null) {
			userID = (String) session.getAttribute("sID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요한 서비스입니다.');");
			script.println("location.href='../login/index.jsp';");
			script.println("</script>");
			script.close();
		}
	
		int num = 0;
		if(request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		if(num == 0 ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 게시글 입니다.');");
			script.println("location.href='index.jsp';");
			script.println("</script>");
			script.close();
		}
	
		majorDTO majorDAO = new majorDAO().showBoard(num);
		if(!userID.equals(majorDAO.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권환이 없습니다.');");
			script.println("location.href='index.jsp';");
			script.println("</script>");
			script.close();
		}
		else{
			String Title = request.getParameter("Title");
			String Category = request.getParameter("Category");
			String Content = request.getParameter("Content");
			String Img = request.getParameter("Img");
			
			majorDAO major = new majorDAO();
			int result = major.modify(num, Title, Category, Content, Img);
			if(result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 수정에 실패하였습니다.');");
				script.println("location.href='index.jsp';");
				script.println("</script>");
				script.close();
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 수정에 성공하였습니다!');");
				script.println("location.href='index.jsp';");
				script.println("</script>");
				script.close();
			}
		}

	%>
</body>
</html>