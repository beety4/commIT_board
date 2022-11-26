<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties"%>
<%@ page import="emailauth.mailDAO" %>
<%@ page import="emailauth.SHA256"%>
<%@ page import="emailauth.Gmailconn"%>
<%@ page import="java.io.PrintWriter"%>


<%
	request.setCharacterEncoding("UTF-8");

	mailDAO mailDAO = new mailDAO();
	String sID = null;
	if(session.getAttribute("sID") != null){
		sID = (String) session.getAttribute("sID");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증 처리 중 에러가 발생했습니다. 관리자에게 문의하십시오.');");
		script.println("location.href ='../../element/home/index.jsp'");
		script.println("window.parent.location.reload();");
		script.println("</script>");
		script.close();
		return;
	}

	
	int emailChecked = mailDAO.getemailcheck(sID);
	if(emailChecked == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 인증이 완료된 회원입니다.');");
		script.println("location.href ='../../element/home/index.jsp'"); 
		script.println("window.parent.location.reload();");
		script.println("</script>");
		script.close();
		return;
	} 
	
	// 사용자 인증 이메일 발송 내용
	String host = "http://localhost:8080/TOC/register/email/";
	String from = "202244016@itc.ac.kr";
	String to = mailDAO.getemail(sID);
	String subject = "[commIT] 이메일 인증을 완료해주세요!";
	String content = 
		"To <div id='forusernamecheck' style='display:inline'>" + sID + "</div><br><br>" +
		"commIT을 이용하기 위해 이메일 인증을 완료 해 주세요!<br>" +
		//"<a href=\"" + host + "mailCheck.jsp?code='" + new SHA256().getSHA256(to) + "'&mailID='" + sID + "'\">이메일 인증</a>";
		"<form action='" + host + "mailCheck.jsp' method='post'>"+
		"<input type='text' style='display:none;' name='emailhash' value='" + new SHA256().getSHA256(to) + "'>" +
		"<input type='text' style='display:none;' name='userID' value='" + sID + "'>" +
		">>> <button type='submit'>인증</button> <<<";
		
		
	
	session.invalidate();
	
	
	// 이메일 전송 : SMTP 이용을 위함
	Properties p = new Properties();
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com"); // google SMTP 주소
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	p.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 추가된 코드
	p.put("mail.smtp.ssl.enable", "true");  // 추가된 코드

	try{
		Authenticator auth = new Gmailconn();
	    Session ses = Session.getInstance(p, auth);
	    ses.setDebug(true);
	    MimeMessage msg = new MimeMessage(ses); 
	    msg.setSubject(subject);		// 메일 제목
	    Address fromAddr = new InternetAddress(from); 	// 보내는 사람 정보
	    msg.setFrom(fromAddr);
	    Address toAddr = new InternetAddress(to);		// 받는 사람 정보
	    msg.addRecipient(Message.RecipientType.TO, toAddr);
	    msg.setContent(content, "text/html;charset=UTF-8");
	    Transport.send(msg); // 메세지 전송
	}catch(Exception e){
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('메일 전송 중 오류가 발생했습니다.');");
		script.println("history.back();"); 
		script.println("</script>");
		script.close();
	}
%>
<!DOCTYPE html>
<html class="sl-theme-dark">
<head>
	<meta charset="UTF-8">
	<title>Send Mail</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/themes/dark.css" />
    <script type="module" src="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.83/dist/shoelace.js"></script>
    <style>
		body {
			background-color : #313131;
		}
		h4 {
			color : white;
			text-align : center;
		}
		.mailsu {
			width : 60%;
    		position : relative;
    		left : 20%;
		}
	</style>
</head>
<body>
	<br><br><br><br><br><br><br>
    <div class="mailsu">
    	<sl-alert variant="success" open>
  		<sl-icon slot="icon" name="check2-circle"></sl-icon>
  			<br>
  			<strong>회원 가입 성공!</strong><br>
  			인증 메일이 전송되었습니다. 메일을 확인해 주세요!
  			<br><br>
	</sl-alert>
	</div>
</body>