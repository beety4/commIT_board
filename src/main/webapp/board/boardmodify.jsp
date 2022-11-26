<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="major.majorDTO" %>
<%@ page import="major.majorDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Modify Board</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- shoelace -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/themes/dark.css" />
    <script type="module" src="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/shoelace.js"></script>

    <link rel="stylesheet" href="../dist/bootstrap/bootstrap.css" />

    <link rel="stylesheet" type="text/css" href="index.css">
    <script src="validate.js"></script>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("sID") != null) {
			userID = (String)session.getAttribute("sID");
		}
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요한 서비스입ㄴ디ㅏ.');");
			script.println("location.href='index.jsp';");
			script.println("</script>");
			script.close();
		}
		
		
		int num = 0;
		if(request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		if(num == 0){
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
			script.println("alert('수정 권한이 없습니다.');");
			script.println("location.href='index.jsp';");
			script.println("</script>");
			script.close();
		}
	%>


<br><br><br><br>
<div class="container">
	<div class="row">
		<form method="post" action="startModify.jsp?num=<%=num %>" name="modifyform">
		<table class="table" style="text-align: center; border: 1px solid #dddddd;">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 수정하기</th>
				</tr>
			<tbody>
				<tr>
					<td><input type="text" class="su" placeholder="제목" name="Title" id="Title" maxlength="100" style="width:920px;" value="<%= majorDAO.getTitle() %>"></td>
				</tr>
				<tr>
					<td><textarea placeholder="내용" class="su" name="Content" id="Content" maxlength="1024" style="width:920px; height: 350px;"><%= majorDAO.getContent() %></textarea></td>
				</tr>
				<tr>
					<td><input type="file" value="사진" name="Img" style="float:left;" value="<%= majorDAO.getImg() %>"></td>
				</tr>
				<tr>
					<td>
						<select name="Category">
							<option value="개발" selected="selected">개발</option>
							<option value="네트워크">네트워크</option>
							<option value="서버">서버</option>
							<option value="하드웨어">하드웨어</option>
							<option value="보안">보안</option>
							<option value="인공지능">인공지능</option>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		<sl-button onclick="modifycheck();" style="float:right; color : white;">수정</sl-button>
	</form>
</div>
	
	
	
	

</body>
</html>