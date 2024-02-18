<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function prod1() {
    	 
    	var themeobj = {
    		/* 	
    	    	bgColor: "#162525", //바탕 배경색
    	   		searchBgColor: "#162525", //검색창 배경색
    	   		contentBgColor: "#162525", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
    	   		pageBgColor: "#162525", //페이지 배경색
    	   		textColor: "#FFFFFF", //기본 글자색
    	   		queryTextColor: "#FFFFFF", //검색창 글자색
    	   		 */
    	   		//postcodeTextColor: "", //우편번호 글자색
    	   		//emphTextColor: "FFFFFF", //강조 글자색
    	   		//outlineColor: "#444444" //테두리
    	   		
    	}
    	
    	//실제 우편번호 API가 시작되는 코드
        new daum.Postcode({
        	
        	// 테마 설정값 호출
        	theme: themeobj, 
        	
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            oncomplete: function(data) {
            	
            	// 요청한 값들을 저장하는 변수
            	// 삭제해도 우편번호API에는 지장X
            	  var resultHTML = [];

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 나눈다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                	/* 
                		data.bname !== '': 이 조건은 data 객체 내의 bname 속성이 비어있지 않은지 확인합니다.
						/[동|로|가]$/g.test(data.bname): - 정규식 패턴을 사용하여 data.bname의 끝 부분이 
														- '동' 또는 '로' 또는 '가'로 끝나는지 확인합니다.	
														- [] 내부의 문자는 해당 위치에 해당 문자 중 하나가 있는지를 확인합니다.
														- $는 문자열의 끝을 나타냅니다.
														- g 플래그는 문자열 내의 모든 패턴을 찾습니다.
							따라서 이 코드는 data.bname이 비어있지 않고, '동', '로', '가' 중 하나로 끝나는 경우에 참(true)을 반환합니다.
                	 */
                	 
                	// key값 = bname 인 값을 extraRoadAddr에 저장
                    extraRoadAddr += data.bname;
                }
                
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   /* 
                   		extraRoadAddr이 비어있지 않으면, 즉 이미 값이 존재하는 경우 --> , 와 data.buildingName을 추가합니다.
						extraRoadAddr이 비어있으면, 즉 값이 없는 경우 --> , data.buildingName만 추가합니다.
                    */
                }
                
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호 검색해서 얻을 수 있는 data('key' , "value")를 <li>에 넣어서
                //	사용시 찾아보기 좋게 정리함(대충 생색 내는중ㅎ)
                for(var item in data) {
                    resultHTML.push('<li><code class="data_key">'+item+'</code>: "'+data[item]+'"</li>');
                }
                
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;	// --> 우편번호 칸
                document.getElementById("roadAddress").value = roadAddr;	// --> 도로명 주소 칸
                document.getElementById("jibunAddress").value = data.jibunAddress;	// --> 참고항목 칸
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
                
                document.getElementById('returnData').innerHTML = resultHTML;
                            
           }
       
        }).open();
      
    }
</script>

</head>
<body>

	<!-- 
	
		CSS없이 원하는 값이 들어오는지 확인을 위함
		id명 , class명 변경 가능(위에 선언한 코드에서도 교체 해줘야 값이 불러와짐)
	
	 -->
	
	<input type="text" id="postcode" class="d_form mini" placeholder="우편번호">
    <input type="button" onclick="prod1()" value="우편번호 찾기" class="d_btn"><br><br>
    <input type="text" id="roadAddress" class="d_form std" placeholder="도로명주소"><br><br>
    <input type="text" id="jibunAddress" class="d_form std" placeholder="지번주소"><br><br>
    <span id="guide" style="color:#999;display:none"></span>
    <input type="text" id="extraAddress" class="d_form" placeholder="참고항목"><br><br>
    <input type="text" id="detailAddress" class="d_form" placeholder="상세주소"><br><br><br><br>
 
 
	<!-- 
	
		PL, TA, DA등 정리한 코드를 사용하는 사람이
		어떤 값이 가져왔는지 확인하기 편하게 key : value 스타일로
		<li>에 담아서 출력되는 <div>
		
	-->        
<div>
            <ul id="returnData"></ul>
</div>
        
</body>
</html>