<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
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
    <script src="validate.js"></script>
</head>
<body>
<%
String userID = null;
if((String) session.getAttribute("sID") == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인이 필요한 서비스입니다.');");
	script.println("window.parent.location.reload();");
	script.println("location.href='../../login/index.jsp';");
	script.println("</script>");
	script.close();
}
%>


<br><br><br><br>
<div class="container">
	<div class="row">
		<form method="post" action="startWrite.jsp" name="writeform">
		<table class="table" style="text-align: center; border: 1px solid #dddddd;">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기</th>
				</tr>
			<tbody>
				<tr>
					<td><input type="text" class="su" placeholder="제목" name="Title" id="Title" maxlength="100" style="width:920px;"></td>
				</tr>
				<tr>
					<td><textarea placeholder="내용" class="su" name="Content" id="Content" maxlength="1024" style="width:920px; height: 350px;"></textarea></td>
				</tr>
				<tr>
					<td><input type="file" value="사진" name="Img" style="float:left;"></td>
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
		<sl-button onclick="boardcheck();" style="float:right;">글쓰기</sl-button>
	</form>
</div>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../../dist/bootstrap/bootstrap.min.js"></script>
    
</body>
</html>