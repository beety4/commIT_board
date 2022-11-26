function boardcheck() {
    let Title = document.getElementById("Title");
    let Content = document.getElementById("Content");


    if (Title.value == "") {
        alert("제목을 입력해 주세요.");
        Title.focus();
        return false;
    };

    if (Content.value == "") {
        alert("내용을 입력해 주세요.");
        Content.focus();
        return false;
    };

    document.writeform.submit();
}

function modifycheck() {
    let Title = document.getElementById("Title");
    let Content = document.getElementById("Content");


    if (Title.value == "") {
        alert("제목을 입력해 주세요.");
        Title.focus();
        return false;
    };

    if (Content.value == "") {
        alert("내용을 입력해 주세요.");
        Content.focus();
        return false;
    };

    document.modifyform.submit();
}