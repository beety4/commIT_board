<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Template a</title>

    <!--  <link rel="stylesheet" href="style.css">  -->
    <!-- shoelace -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/themes/dark.css" />
    <script type="module" src="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/shoelace.js"></script>
   
    
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../dist/signform/fonts/icomoon/style.css">
    <link rel="stylesheet" href="../dist/signform/css/owl.carousel.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../dist/signform/css/bootstrap.min.css">
    <!-- Style -->
    <link rel="stylesheet" href="../dist/signform/css/style.css">
    
        <link rel="stylesheet" type="text/css" href="index.css">
    
    
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	if(session.getAttribute("sID") != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인된 상태입니다.');");
		script.println("window.parent.location.reload();");
		script.println("location.href='../../index.html';");
		script.println("</script>");
		script.close();
	}
	%>

	<br><br>
	<div class="content">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <img src="../dist/signform/images/undraw_remotely_2j6y.svg" alt="Image" class="sideIMG">
        </div>
        <div class="col-md-6 contents">
          <div class="row justify-content-center">

<div class="contents order-2 order-md-1">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-14">
            <h3>Login to <strong>commIT</strong></h3>
            <p class="mb-4">Sign in by entering the information below</p>
            
            
            <form action="startLogin.jsp" method="post">
              <div class="form-group first">
                <label for="username" class="acmsg">ID</label>
                <input type="text" class="form-control" placeholder="Your ID" id="lid" name="lid">
              </div>
              <div class="form-group last mb-3">
                <label for="password" class="acmsg">Password</label>
                <input type="password" class="form-control" placeholder="Your Password" id="lpassword" name="lpassword">
              </div>
              
              <div class="d-flex mb-5 align-items-center">
                <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                  <input type="checkbox" checked="checked"/>
                  <div class="control__indicator"></div>
                </label>
              </div>
              <input type="submit" value="Log In" class="btn btn-block btn-primary">
            </form>
            
            <br>
            <div class="helpuserdiv">
            <a href="#" class="helpuser">Forgot Password?</a><br>
            <a href="../register/index.jsp" class="helpuser">Don't have an account?</a>
            </div>
            
          </div>
        </div>
      </div>

            </div>
          </div>
          
        </div>
        
      </div>
    </div>
  </div>

  
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