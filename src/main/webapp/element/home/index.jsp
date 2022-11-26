<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="mainpage.mainDTO" %>
<%@ page import="mainpage.mainDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en" class="sl-theme-dark">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <!-- shoelace -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/themes/dark.css" />
    <script type="module" src="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/shoelace.js"></script>
    <link rel="stylesheet" type="text/css" href="index.css">
    <script type="text/javascript" src="./index.js"></script>
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
	<!-- 
	<div id="slideShow">
    <ul class="slides">
      <li><img src="../../img/slide-1.jpg" alt=""></li>
      <li><img src="../../img/slide-2.jpg" alt=""></li>
      <li><img src="../../img/slide-3.jpg" alt=""></li>
    </ul>
    <p class="controller">
      <!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표
      <span class="prev">&lang;</span> 
      <span class="next">&rang;</span>
    </p>
  </div>
	-->
	
	<div class="container">
	<div class="row">
	
			<table class="table" style="text-align: center; border: 1px solid #dddddd;">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center; width: 15%;color:black;">번호</th>
					<th style="background-color: #eeeeee; text-align: center; width: 55%;color:black;">제목</th>
					<th style="background-color: #eeeeee; text-align: center; width: 15%;color:black;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center; width: 15%;color:black;">작성일</th>
				</tr>
			</thead>
			<tbody>
			
			
				<%
					mainDAO mainDAO = new mainDAO();
					ArrayList<mainDTO> list = mainDAO.boardList();

					for(int i = 0; i < list.size(); i++) {

				%>
				<tr onclick="location.href='boardview.jsp?num=<%=list.get(i).getNum() %>'">
					<td><%= i+1 %></td>
					<td><a style="float:left;">[ <%= list.get(i).getCategory() %> ] <%= list.get(i).getTitle() %></a></td>
					<td><%= list.get(i).getUserID() %></td>
					<td><%= list.get(i).getDate().substring(0,11) %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	
	</div>
	</div>









</body>
</html>