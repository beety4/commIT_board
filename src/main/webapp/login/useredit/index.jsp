<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tocuser.userDTO"%>
<%@ page import="tocuser.userDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My info</title>
    <link rel="stylesheet" type="text/css" href="index.css">
    <!--  <link rel="stylesheet" href="style.css">  -->
    <!-- shoelace -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/themes/dark.css" />
    <script type="module" src="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/shoelace.js"></script>
    
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="../../dist/signform/fonts/icomoon/style.css">

    <link rel="stylesheet" href="../../dist/signform/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../../dist/signform/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="../../dist/signform/css/style.css">
    <script src="validate.js"></script>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	if(session.getAttribute("sID") != null){
		String sID = (String) session.getAttribute("sID");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요한 서비스입니다.');");
		script.println("window.parent.location.reload();");
		script.println("location.href='../../index.jsp';");
		script.println("</script>");
		script.close();
	}
	%>

	<br><br><br>
	<div class="contents order-2 order-md-1">
      <div class="container">
        <div class="row align-items-center justify-content-center backcolorbg">
          <div class="col-md-7">
            <h3 class="h3align"><strong>Edit user Password</strong></h3>
            <p class="mb-4" style="text-align:center;"></p>
            <br>
            <form action="updateuserinfo.jsp" method="post" name="updateuserinfo">

              <div class="form-group last mb-3">
                <label for="password" class="acmsg">Password</label>
                <input type="password" class="form-control" placeholder="Your Password" id="rpassword" name="rpassword">
              </div>
              <div class="form-group last mb-3">
                <label for="password" class="acmsg">Password Check</label>
                <input type="password" class="form-control" placeholder="Password Check" id="rpasswordc">
              </div>
			  <br><br>
              <input type="button" value="Update" class="btn btn-block btn-primary" onclick="inputcheck();">

            </form>
          </div>
        </div>
      </div>
    </div>
    <br><br><br><br>

    



    <script src="../dist/signform/js/jquery-3.3.1.min.js"></script>
    <script src="../dist/signform/js/popper.min.js"></script>
    <script src="../dist/signform/js/bootstrap.min.js"></script>
    <script src="../dist/signform/js/main.js"></script>
	
	
	
	
</body>
</html>