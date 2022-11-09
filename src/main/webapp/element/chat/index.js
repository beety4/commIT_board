var textarea = document.getElementById("messageWindow");
var webSocket = new WebSocket('ws://localhost:8080/TOC/broadcasting');
var inputMessage = document.getElementById('inputMessage');

webSocket.onerror = function(event) {
	onError(event)
};

webSocket.onopen = function(event) {
	onOpen(event)
};

webSocket.onmessage = function(event) {
	onMessage(event)
};

function onMessage(event) {
	textarea.value += "상대 : " + event.data + "\n";
}

function onOpen(event) {
	textarea.value += "연결 성공\n";
}

function onError(event) {
	alert(event.data);
}

function send() {
	textarea.value += "나 : " + inputMessage.value + "\n";
	webSocket.send(inputMessage.value);
	inputMessage.value = "";
}
