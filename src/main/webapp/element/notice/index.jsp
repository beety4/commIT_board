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
	
	String Category = "null";
	if (request.getParameter("Category") != null) {
		Category = (String)request.getParameter("Category");
	}
%>

<br><br><br><br>
<div class="container">
	<div class="row">
		<div>
		
		<sl-button onclick="location.href='index.jsp?pageNumber=1&&Category=null'">모두</sl-button>
		<sl-button onclick="location.href='index.jsp?pageNumber=1&&Category=공지사항'">공지사항</sl-button>
		<sl-button onclick="location.href='index.jsp?pageNumber=1&&Category=업데이트내역'">업데이트내역</sl-button>
		<sl-button onclick="location.href='index.jsp?pageNumber=1&&Category=잡담'">잡담</sl-button>
		<sl-button onclick="location.href='index.jsp?pageNumber=1&&Category=개발자코멘트'">개발자코멘트</sl-button>
		<a href="boardwrite.jsp" class="btn btn-success" style="float: right;">글쓰기</a>
		<br>
		</div>
		
		
		
		<table class="table" style="text-align: center; border: 1px solid #dddddd;">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center; width: 15%;">번호</th>
					<th style="background-color: #eeeeee; text-align: center; width: 40%;">제목</th>
					<th style="background-color: #eeeeee; text-align: center; width: 15%;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center; width: 15%;">카테고리</th>
					<th style="background-color: #eeeeee; text-align: center; width: 15%;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
					noticeDAO noticeDAO = new noticeDAO();
					ArrayList<noticeDTO> list;
					
					if(Category.equals("null")) {
						list = noticeDAO.boardList(pageNumber);
					}
					else {
						list = noticeDAO.categoryList(pageNumber, Category);
					}

					
					for(int i = 0; i < list.size(); i++) {
				%>
				<tr onclick="location.href='boardview.jsp?num=<%=list.get(i).getNum() %>'">
					<td><%= list.get(i).getNum() %></td>
					<td><%= list.get(i).getTitle() %></td>
					<td><%= list.get(i).getUserID() %></td>
					<td><%= list.get(i).getCategory() %></td>
					<td><%= list.get(i).getDate().substring(0,11) %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>

		<%	
			if(!Category.equals("null")) {
				if(noticeDAO.nextPageCategory(pageNumber + 1, Category)) {
		%>
					<a href="index.jsp?pageNumber=<%= pageNumber + 1 %>&&Category=<%=Category %>" class="btn btn-secondary">다음</a>
		<%
				} if(pageNumber != 1) {
		%>
					<a href="index.jsp?pageNumber=<%= pageNumber - 1 %>&&Category=<%=Category %>" class="btn btn-secondary">이전</a><br>
		<%
				}
			} 
			else {
				if(noticeDAO.nextPage(pageNumber +1)) {
		%>
					<a href="index.jsp?pageNumber=<%= pageNumber + 1 %>&&Category=<%=Category %>" class="btn btn-secondary">다음</a>
		<%
				} if(pageNumber != 1) {
		%>
					<a href="index.jsp?pageNumber=<%= pageNumber - 1 %>&&Category=<%=Category %>" class="btn btn-secondary">이전</a><br>
		<% 
				}
			}
		%>
			
	</div>
</div>
<br><br><br>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../../dist/bootstrap/bootstrap.min.js"></script>
    
</body>
</html>