function registercheck() {
    var id = document.getElementById("rid");
    var pwd = document.getElementById("rpassword");
    var pwdcheck = document.getElementById("rpasswordc");
    var name = document.getElementById("nickname");
    var email = document.getElementById("email");


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



    document.registerform.submit();
}