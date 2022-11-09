function private() {
	window.open('private.html','window_name','width=1200,height=700, location=no, status=no, scrollbars=yes');
}

function registercheck() {
    var id = document.getElementById("rid");
    var pwd = document.getElementById("rpassword");
    var pwdcheck = document.getElementById("rpasswordc");
    var name = document.getElementById("nickname");
    var email = document.getElementById("email");

    if (id.value == "") {
        alert("아이디를 입력하세요");
        id.focus();
        return false;
    };

    if (pwd.value == "") {
        alert("비밀번호를 입력하세요");
        pwd.focus();
        return false;
    };

    var pwdform = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,15}$/;
    if (!pwdform.test(pwd.value)) {
        alert("영문자+숫자 조합으로 6~15자리 사용해야 합니다");
        pwd.focus();
        return false;
    };

    if (pwdcheck.value !== pwd.value) {
        alert("비밀번호를 일치하지 않습니다!");
        pwdcheck.focus();
        return false;
    };

    if (name.value == "") {
        alert("이름을 입력하세요");
        name.focus();
        return false;
    };

	if (email.value == "") {
		alert("이메일을 입력하세요");
		email.focus();
		return false;
	}

	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    if (!exptext.test(email.value)) {
        alert("올바른 형식의 이메일이 아닙니다");
        email.focus();
        return false;
    };

    if (!agree.checked) {
        alert("약관 동의를 체크하세요");
        agree.focus();
        return false;
    };
    document.registerform.submit();
}