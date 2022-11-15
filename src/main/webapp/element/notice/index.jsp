<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="notice.noticeDTO" %>
<%@ page import="notice.noticeDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en" class="sl-theme-dark">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notice Page</title>

    <!-- shoelace -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/themes/dark.css" />
    <script type="module" src="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/shoelace.js"></script>

    <link rel="stylesheet" href="../../dist/bootstrap/bootstrap.css" />

    <link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
<%
	String userID = null;
	if (session.getAttribute("sID") != null) {
		userID = (String) session.getAttribute("sID");
	}
	
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	String Category = null;
	if (request.getParameter("Category") != null) {
		Category = (String)request.getParameter("Category");
	}
%>

<br><br><br><br>
<div class="container">
	<div class="row">
		<div>
			<form method="post" action="index.jsp?category=<%=Category %>">
			<select name="Category">
				<option value="공지사항">공지사항</option>
				<option value="업데이트내역">업데이트내역</option>
				<option value="잡답">잡담</option>
				<option value="개발자코멘트">개발자코멘트</option>
			</select>
			<input type="submit" value="검색">
			</form>
		</div>
		<table class="table" style="text-align: center; border: 1px solid #dddddd;">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">카테고리</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
					noticeDAO noticeDAO = new noticeDAO();
					ArrayList<noticeDTO> list = noticeDAO.boardList(pageNumber);
					
					if( Category == "공지사항") {
						list = noticeDAO.categoryList(pageNumber, Category);
					}
					else if(Category == "업데이트내역") {
						list = noticeDAO.categoryList(pageNumber, Category);
					}
					else if(Category == "잡담") {
						list = noticeDAO.categoryList(pageNumber, Category);
					}
					else if(Category == "개발자코멘트") {
						list = noticeDAO.categoryList(pageNumber, Category);
					}
					
					for(int i = 0; i < list.size(); i++) {
				%>
				<tr onclick="location.href='boardview.jsp?num=<%=list.get(i).getNum() %>'">
					<td><%= list.get(i).getNum() %></td>
					<td><%= list.get(i).getCategory() %></td>
					<td><%= list.get(i).getTitle() %></td>
					<td><%= list.get(i).getUserID() %></td>
					<td><%= list.get(i).getDate().substring(0,11) %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
			if(pageNumber != 1) {
		%>
			<a href="index.jsp?pageNumber=<%= pageNumber - 1 %>" class="btn btn-success">이전</a>
		<%
			} if(noticeDAO.nextPage(pageNumber + 1)) {
		%>
			<a href="index.jsp?pageNumber=<%= pageNumber + 1 %>" class="btn btn-success">다음</a>
		<%
			}
		%>
	</div>
	<sl-button onclick="location.href='boardwrite.jsp'">글쓰기</sl-button>
</div>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../../dist/bootstrap/bootstrap.min.js"></script>
    
</body>
</html>