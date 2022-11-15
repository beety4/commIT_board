<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="notice.noticeDTO" %>
<%@ page import="notice.noticeDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Modify Board</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- shoelace -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/themes/dark.css" />
    <script type="module" src="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/shoelace.js"></script>

    <link rel="stylesheet" href="../../dist/bootstrap/bootstrap.css" />

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
		
		noticeDTO noticeDAO = new noticeDAO().showBoard(num);
		if(!userID.equals(noticeDAO.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정 권환이 없습니다.');");
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
					<td><input type="text" class="su" placeholder="제목" name="Title" id="Title" maxlength="100" style="width:920px;" value="<%= noticeDAO.getTitle() %>"></td>
				</tr>
				<tr>
					<td><textarea placeholder="내용" class="su" name="Content" id="Content" maxlength="1024" style="width:920px; height: 350px;"><%= noticeDAO.getContent() %></textarea></td>
				</tr>
				<tr>
					<td><input type="file" value="사진" name="Img" style="float:left;" value="<%= noticeDAO.getImg() %>"></td>
				</tr>
				<tr>
					<td>
						<select name="Category">
							<option value="공지사항" selected="selected">공지사항</option>
							<option value="업데이트내역">업데이트내역</option>
							<option value="잡답">잡담</option>
							<option value="개발자코멘트">개발자코멘트</option>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		<sl-button onclick="modifycheck();" style="float:right;">수정</sl-button>
	</form>
</div>
	
	
	
	

</body>
</html>