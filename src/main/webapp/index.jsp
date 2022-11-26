<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="sl-theme-dark">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>commIT</title>

    <!-- shoelace -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/themes/dark.css" />
    <script type="module" src="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/shoelace.js"></script>
    <link rel="stylesheet" type="text/css" href="./index.css">
    <script type="text/javascript" src="./index.js"></script>
</head>
<body>

	<% 
	request.setCharacterEncoding("UTF-8");
	String sID = (String)session.getAttribute("sID");
	%>
	
    <header>
        <nav>
        <a href="#" onClick="top.location='javascript:location.reload()'"><img src="img/commIT.png" id="logo"></a>
        <%
		if(sID!=null) { %>
		<div class="info">
			<div class="loginusergroup">
			<a class="loginuser"><%=sID %> 님</a><br>
			</div>
			<button class="loginbut" onclick="mainpage.location.href='login/useredit/index.jsp'">정보수정</button>
			<button class="loginbut" onclick="location='login/logout.jsp'">로그아웃</button>

			<!-- 
			<sl-button size="small" class="loginbut">내정보</sl-button>
			<sl-button size="small" class="loginbut">로그아웃</sl-button>
			-->
           	<sl-icon name="person-circle" onclick="mainpage.location.href='login/useredit/index.jsp'" style="cursor: pointer;" class="loginIMG"></sl-icon>
        </div>
		<%
		} else { %>
        <div class="info">
           <sl-icon name="person-circle" onclick="mainpage.location.href='login/index.jsp'" style="cursor: pointer;"></sl-icon>
        </div>
        <%
		}
		%>
        
        
        <sl-tab-group class="menubar">
            <sl-tab slot="nav" panel="home" onclick="mainpage.location.href='element/home/index.jsp'">홈</sl-tab>
            <sl-tab slot="nav" panel="notice" onclick="mainpage.location.href='element/notice/index.jsp'">공지사항</sl-tab>
    	    <sl-tab slot="nav" panel="board" onclick="mainpage.location.href='board/index.jsp'">게시판</sl-tab>
            <sl-tab slot="nav" panel="chat" onclick="mainpage.location.href='element/chat/index.jsp'">채팅</sl-tab>
        </sl-tab-group>
        </nav>
        <br><br>
    </header>

    <iframe src="element/home/index.jsp" name="mainpage" id="mainpage" class="headimg" scrolling="no" onload="this.style.height=(this.contentWindow.document.body.scrollHeight+30)+'px';"></iframe>

	<!--
    <footer>
        Made by Minho Kim
    </footer>
	-->

    <br><br><br><br><br>
</body>
</html>