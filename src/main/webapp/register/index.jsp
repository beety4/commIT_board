<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Register Template</title>
    <link rel="stylesheet" type="text/css" href="index.css">
    <!--  <link rel="stylesheet" href="style.css">  -->
    <!-- shoelace -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/themes/dark.css" />
    <script type="module" src="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/shoelace.js"></script>
    
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="../dist/signform/fonts/icomoon/style.css">

    <link rel="stylesheet" href="../dist/signform/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../dist/signform/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="../dist/signform/css/style.css">
    
    <script src="validate.js"></script>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	
	if(session.getAttribute("sID") != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인된 상태입니다.');");
		script.println("window.parent.location.reload();");
		script.println("location.href='../index.jsp';");
		script.println("</script>");
		script.close();
	}
	%>
	
	<!--
	<h2>회원가입re</h2>
	<form action="joinRegister.jsp" method="post" onsubmit="return registercheck();">
		<input type="text" name="rid" id="rid" placeholder="id"><br>
		<input type="password" name="rpassword" id="rpassword" placeholder="password"><br>
		<input type="password" name="rpasswordc" id="rpasswordc" placeholder="password"><br>
		<input type="text" name="nickname" id="nickname" placeholder="name"><br>
		<input type="text" name="email" id="email" placeholder="email"><br>
		<input type="submit" value="회원가입">
	</form>
	-->

	<br><br><br><br>
    <div class="contents order-2 order-md-1">
      <div class="container">
        <div class="row align-items-center justify-content-center backcolorbg">
          <div class="col-md-7">
            <h3 class="h3align"><strong>SIGN UP</strong></h3>
            <p class="mb-4" style="text-align:center;">Register to join community!</p>
            <br>
            <form action="joinRegister.jsp" method="post" name="registerform">
              <div class="form-group first">
                <label for="username" class="acmsg">ID</label>
                <input type="text" class="form-control" placeholder="Your ID" id="rid" name="rid" maxlength=15>
                <!--
                <input type="text" class="form-control" placeholder="Your ID" id="rid" name="rid" maxlength=15 style="width:400px;">
                <button type="button" onclick="dbIDcheck();" name="dbIDcheck" class="dupchk">중복 확인</button>
                <input type="hidden" name="idDuplication" value="idUncheck"/>
                -->
              </div>
              <div class="form-group last mb-3">
                <label for="password" class="acmsg">Email</label>
                <input type="text" class="form-control" placeholder="Your-email@email.com" id="email" name="email" maxlength=40>
              </div>
              <div class="form-group last mb-3">
                <label for="password" class="acmsg">NickName</label>
                <input type="text" class="form-control" placeholder="Your Name" id="nickname" name="nickname" maxlength=10>
              </div>
              <div class="form-group last mb-3">
                <label for="password" class="acmsg">Password</label>
                <input type="password" class="form-control" placeholder="Your Password" id="rpassword" name="rpassword">
              </div>
              <div class="form-group last mb-3">
                <label for="password" class="acmsg">Password Check</label>
                <input type="password" class="form-control" placeholder="Password Check" id="rpasswordc">
              </div>


              
              <div class="d-flex mb-5 align-items-center">
                <label class="control control--checkbox mb-0"><span class="caption">
                	<a href="javascript:void(0)" onclick="private();">개인정보이용내역 동의</a></span>
                  <input type="checkbox" id="agree" checked="checked"/>
                  <div class="control__indicator"></div>
                </label>
              </div>

              <input type="button" value="Sign UP" class="btn btn-block btn-primary" onclick="registercheck();">

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









	<!-- 
	<div class="loginform">
    <section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap py-5 backgroundcustom">
		      	<div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/bg.jpg);"></div>
		      	<h3 class="text-center mb-0">Welcome</h3>
		      	<p class="text-center">Sign in by entering the information below</p>
						<form action="#" class="login-form">
		      		<div class="form-group">
		      			<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-user"></span></div>
		      			<input type="text" class="form-control" placeholder="Username" required>
		      		</div>
	            <div class="form-group">
	            	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-lock"></span></div>
	              <input type="password" class="form-control" placeholder="Password" required>
	            </div>
	            <div class="form-group d-md-flex">
								<div class="w-100 text-md-right">
									<a href="#">Forgot Password</a>
								</div>
	            </div>
	            <div class="form-group">
	            	<button type="submit" class="btn form-control btn-primary rounded submit px-3">Login</button>
	            </div>
	          </form>
	          <div class="w-100 text-center mt-4 text">
	          	<p class="mb-0">Don't have an account?</p>
		          <a href="#">Sign Up</a>
	          </div>
	        </div>
				</div>
			</div>
		</div>
	</section>
    </div>
-->
</body>
</html>