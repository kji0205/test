// 메시지 송신

 self.postMessage('foo');

 self.postMessage(100);

 self.postMessage({x:1, y:2});


 // 메시지 수신

 self.onmessage = function(event) {

   // 송신된 데이터를 가져옴

   var receivedMessage = event.data;

   /* 처리 내용 */

 };
