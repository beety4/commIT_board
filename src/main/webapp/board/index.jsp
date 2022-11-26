<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="major.majorDTO" %>
<%@ page import="major.majorDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en" class="sl-theme-dark">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>major Page</title>

    <!-- shoelace -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/themes/dark.css" />
    <script type="module" src="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/shoelace.js"></script>

    <link rel="stylesheet" href="../dist/bootstrap/bootstrap.css" />

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
		<sl-button onclick="location.href='index.jsp?pageNumber=1&&Category=개발'">개발</sl-button>
		<sl-button onclick="location.href='index.jsp?pageNumber=1&&Category=네트워크'">네트워크</sl-button>
		<sl-button onclick="location.href='index.jsp?pageNumber=1&&Category=서버'">서버</sl-button>
		<sl-button onclick="location.href='index.jsp?pageNumber=1&&Category=하드웨어'">하드웨어</sl-button>
		<sl-button onclick="location.href='index.jsp?pageNumber=1&&Category=보안'">보안</sl-button>
		<sl-button onclick="location.href='index.jsp?pageNumber=1&&Category=인공지능'">인공지능</sl-button>
		<a href="boardwrite.jsp" class="btn btn-success" style="float: right;">글쓰기</a>
		<br>
		</div>
		
		
		
		<table class="table" style="text-align: center; border: 1px solid #dddddd;">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center; width: 15%;">번호</th>
					<th style="background-color: #eeeeee; text-align: center; width: 55%;">제목</th>
					<th style="background-color: #eeeeee; text-align: center; width: 15%;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center; width: 15%;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
					majorDAO majorDAO = new majorDAO();
					ArrayList<majorDTO> list;
					
					if(Category.equals("null")) {
						list = majorDAO.boardList(pageNumber);
					}
					else {
						list = majorDAO.categoryList(pageNumber, Category);
					}

					
					//int numbering = 0;
					//int cnt = majorDAO.count();
					//int Categorycnt = majorDAO.categoryCount(Category);
					
					for(int i = 0; i < list.size(); i++) {
/* 						if(Category.equals("null")){
							if(pageNumber !=1 ) {
								numbering = cnt - (pageNumber-1) * 10 - i;
							}
							else {
								numbering = majorDAO.count() - i;
							}
						} 
						else {
							if(pageNumber !=1 ) {
								numbering = Categorycnt - (pageNumber-1) * 10 - i;
							}
							else {
								numbering = majorDAO.categoryCount(Category) - i;
							}
						} */
				%>
				<tr class="testaa" onclick="location.href='boardview.jsp?num=<%=list.get(i).getNum() %>'">
					<td><%= list.get(i).getNum() %></td>
					<td><a style="float:left;">[ <%= list.get(i).getCategory() %> ] <%= list.get(i).getTitle() %></a></td>
					<td><%= list.get(i).getUserID() %></td>
					<td><%= list.get(i).getDate().substring(0,11) %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>

		<%	
			if(!Category.equals("null")) {
				if(majorDAO.nextPageCategory(pageNumber + 1, Category)) {
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
				if(majorDAO.nextPage(pageNumber +1)) {
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
<br><br>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../../dist/bootstrap/bootstrap.min.js"></script>
    
</body>
</html>