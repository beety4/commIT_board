<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="major.majorDTO" %>
<%@ page import="major.majorDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board view</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("sID") != null) {
			userID = (String)session.getAttribute("sID");
		}
	
		int num = 0;
		if(request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		
		if(num == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 게시글 입니다.');");
			script.println("location.href='index.jsp';");
			script.println("</script>");
			script.close();
		}
		
		majorDTO majorDAO = new majorDAO().showBoard(num);
		majorDAO test = new majorDAO();
		test.viewadd(num);
	%>
	
	<table border="1" width="1135px;">
		<thead>
			<tr>
				<th colspan="2" style="background-color: #eeeeee; text-align : center;">게시판 글 보기</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="width:300px;">글제목</td>
				<td colspan="2"><%=majorDAO.getTitle().replaceAll(" ","&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;") %>
			</tr>
			<tr>
				<td style="width:300px;">작성자</td>
				<td colspan="2"><%=majorDAO.getUserID() %>
			</tr>
			<tr>
				<td style="width:300px;">카테고리</td>
				<td colspan="2"><%=majorDAO.getCategory() %>
			</tr>
			<tr>
				<td style="width:300px;">작성일자</td>
				<td colspan="2"><%=majorDAO.getDate() %>
			</tr>
			<tr>
				<td style="width:300px;">내용</td>
				<td colspan="2" style="height : 400px;"><%=majorDAO.getContent().replaceAll(" ","&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %>
			</tr>
			<tr>
				<td style="width:300px;">조회수</td>
				<td colspan="2"><%=majorDAO.getView() %>
			</tr>
		</tbody>
	</table>
	<a href="javascript:window.history.back();">목록</a>
	
	<%
		if(userID != null && userID.equals(majorDAO.getUserID())) {
	%>
		<a href="boardmodify.jsp?num=<%=num %>">수정</a>
		<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="startDelete.jsp?num=<%=num %>">삭제</a>
	<%
		}
	%>
	

	
</body>
</html>