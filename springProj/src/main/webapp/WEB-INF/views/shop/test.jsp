<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; 
        IMP.init("imp67011510");	// 테스트용 가맹점ID(변경 X)
      
        /* 
       	주문번호 = 같은 값은 사용 불가(결제 할 때마다 새로운 값 필요)
		주문번호 만들 때 "코드" + 현재 시간 등으로 만들기 위한 makemerchantUid
		*/
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;

        function requestPay() {
            IMP.request_pay({
                pg : 'kakaopay', 						// kcp: 미리 등록한 카드로 결제, kakaopay
                pay_method : 'card',
                merchant_uid: "주문번호 안 겹치게"+makeMerchantUid,  // 주문번호
                name : '상품명',							// 상품명
                amount : 1004,							// 가격(결제 금액)
                buyer_email : '판매자 이메일',
                buyer_name : '판매자명',
                buyer_tel : '판매자 전화번호',
                buyer_addr : '판매 주소',
                buyer_postcode : '판매자 우편번호(예)123-456)',
                custom_data : {
                	"추가 데이터 키" : "추가 데이터 값"
                }
            }, function (rsp) {
                if (rsp.success) {
                      // 서버 결제 API 성공시 로직
                      console.log(rsp);
                } else {
                	alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
                }
            });
        }
    </script>
    <meta charset="UTF-8">
    <title>Sample Payment</title>
</head>
<body>
    <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
</body>
</html>