<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<!-- <script type="text/javascript" src="/resources/js/joinCheck.js"></script> -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
   margin: 0 auto; /* 상하여백 좌우여백 */
}
table{
   margin: 0 auto;
   border: 2px solid;
   border-collapse: collapse;
}
tr > td:nth-child(1) {
   text-align: center;
}
tr, td{
   border: 2px solid;
}
.redFont{
   color: red;
   font-size: 12px;
   font-style: italic;
}
textarea{
   resize: none;
}
</style>
<script type="text/javascript">
$(function () {

    const idChk = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
    const passChk = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
    const nicChk = /^[가-힣A-Za-z0-9]{2,8}$/;
    const mailChk = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    
    let checkPhone;

      //휴대폰 번호 인증
    	var authNum = "";
        $("#phoneChk").click(function(){
            alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
            var phone = $("#phoneNumber").val();
            console.log(phone);
           $.ajax({
            type:"post",
            url:"/SMS/check/sendSMS",
            cache : false,
            data : {"phoneNumber":phone},
            beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
            success:function(data){
            	if(data == "error"){
            		alert("휴대폰 번호가 올바르지 않습니다.")
    				
            	}else{	        		
            	    alert("휴대폰 전송 성공")
            		authNum = data;
            	}
            }
        });
    });
//         const phoneChk = document.querySelector("#phoneChk");
//         var authNum = "";
//         document.getElementById("phoneChk").addEventListener("click", function() {
//             var phone = document.getElementById("phoneNumber").value;
//             if(!phone){
//         		alert("전화번호를 입력하세요");
//         		return;
//             }
//             alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
//             console.log(phone);
            
//             var xhr = new XMLHttpRequest();
//             xhr.open("POST", "/SMS/check/sendSMS", true);
//             xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
//             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
//             xhr.onreadystatechange = function() {
//                 if (xhr.readyState === XMLHttpRequest.DONE) {
//                     if (xhr.status === 200) {
//                         var data = xhr.responseText;
//                         if (data === "error") {
//                             alert("휴대폰 번호가 올바르지 않습니다.");
//                         } else {
//                             alert("휴대폰 전송 성공");
//                             console.log(data)
//                             authNum = data;
//                         }
//                     }
//                 }
//             };
//             console.log(phone);
//             xhr.send(JSON.stringify({"phoneNumber":phone}));
//         });
        //휴대폰 인증번호 대조
          $("#phoneChk2").click(function(){
              if($("#phone2").val() == authNum){ // 위에서 저장한 값을 비교한다
                   alert('인증성공')
              checkPhone = true;
              }else{
                  alert('인증실패')
              checkPhone = false;
              }
          });
        // 다음 우편번호 검색
    	$("#btnPostNum").on("click" , function () {
    		console.log("우편번호 검색!");
    		new daum.Postcode({
    			//다음 창에서 검색이 완료되었다면
    			oncomplete:function(data){
    				$("#postNum").val(data.zonecode);
    				$("#studAddress").val(data.address);
    				$("#studAddress2").val(data.buildingName);
    			}
    		}).open();
    	});
    	
    	$("#join").on("click" , function(){
    	   console.log("가입버튼 클릭성공");
    	   let memId = $("#memId").val();
    	   let memPass = $("#memPass").val();
    	   let memMail = $("#memMail").val();
    	   let memNm = $("#memNm").val();
    	   let memPhone = $("#memPhone").val();
    	   
    	   if(!checkPhone){
    	       alert("인증번호를 확인하세요");
    	   }
    	   let data = {
    		   "memId":memId,
    		   "memPass":memPass,
    		   "memNm":memNm,
    		   "memPhone":memPhone,
    		   "memMail":memMail,
    	   }
    	   console.log("data : " , data);
    	   $.ajax({
    			url : "/member/joinInsertAjax",
    			contentType:"application/json;charset=utf-8",
    			data:JSON.stringify(data),
    			type:"post",
    			dataType:"text",
    			beforeSend:function(xhr){
    				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    			},
    			success:function(result){
    			console.log("ajax테스트성공");  
    			}
    	   });
    	});
    });
</script>
</head>
<body>
<form action="">
<div class="container">
   <table>
      <colgroup>
         <col width="25%">
         <col width="*">
      </colgroup>
      <tr>
         <td colspan="2" style="background-color: #cee3f6; font-weight: bold;">
            <span class="redFont">(*필수입력)</span>
            회원기본정보         
         </td>
      </tr>
      <tr>
         <td>
            <span class="memId">*</span>아이디:
         </td>
         <td>
            <input type="text" id="memId" placeholder="4~12자의 영문 대소문자, 숫자만 입력" style="width: 220px">
            <input type="button" id="idChk" value="아이디 검사">
         </td>
      </tr>
      <tr>
         <td>
            <span class="memPass">*</span>비밀번호:
         </td>
         <td>
            <input type="password" id="memPass">
            4~12자의 영문 대소문자와 숫자로만 입력
         </td>
      </tr>
      <tr>
         <td>
            <span class="memPass2">*</span>비밀번호확인:
         </td>
         <td>
            <input type="password">
            <input type="button" value="비밀번호 확인">
         </td>
      </tr>
      <tr>
         <td>
            <span class="redFont">*</span>메일주소:
         </td>
         <td>
            <input type="text" id="memMail" style="width: 200px">
            <input type="button" value="메일 확인">
            예)id@domain.com
         </td>
      </tr>
      <tr>
         <td>
            <span class="redFont">*</span>이름:
         </td>
         <td>
            <input type="text" id="memNm" style="width: 200px">
         </td>
      </tr>
      <tr>
         <td>
            <span class="redFont">*</span>전화번호:
         </td>
<!--          <td> -->
<!--             <input type="text" id="memPhone" style="width: 200px"> -->
<!--          </td> -->
         <td>
      <div class="input_text">
           <input  class="signin_pass" id="phoneNumber" type="text" name="phoneNumber" title="전화번호 입력" placeholder="전화번호를 입력해주세요">
           <input  class="signin_pass" type="button" value="인증하기" id="phoneChk">
           <br/>
           <input  class="signin_pass" id="phone2" type="text" name="phone" title="전화번호 입력" placeholder="인증번호를 입력해주세요">
           <input  class="signin_pass" type="button" value="인증확인" id="phoneChk2">
      </div>
         </td>
      </tr>
<!-- 		<p> -->
<!-- 			<input id="phone" type="text" name="phone" title="전화번호 입력" required/> -->
<!-- 			<span id="phoneChk" class="doubleChk">인증번호 보내기</span><br/> -->
<!-- 			<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required/> -->
<!-- 			<span id="phoneChk2" class="doubleChk">본인인증</span> -->
<!-- 			<span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span> -->
<!-- 			<input type="hidden" id="phoneDoubleChk"/> -->
<!-- 		</p> -->
<!-- 		<p class="tip"> -->
<!-- 			최초 가입 시에만 사용하고 있습니다. 따로 저장되지 않습니다.(번호만 입력해주세요.) -->
<!-- 		</p> -->
      <tr>
         <td colspan="2" style="background-color: #cee3f6; font-weight: bold;">
            개인 신상 정보
         </td>
      </tr>
      <tr>
         <td>
            생일:
         </td>
         <td>
            <div>
               <input type="text" style="width: 80px">년
               <input type="text" style="width: 50px">월
               <input type="text" style="width: 50px">일
            </div>
         </td>
      </tr>
      <tr>
         <td>
            주소:
         </td>
         <td>
<!--             <div> -->
<!--                <input type="text" id="postcode" size="5" readonly> -->
<!--                <input type="button" value="우편번호 찾기" onclick="checkPost()"> -->
<!--             </div> -->
<!--             <div> -->
<!--                <input type="text" id="address" size="23" placeholder="주소" readonly> -->
<!--                <input type="text" id="detailAddress" size="23" placeholder="상세주소"> -->
<!--             </div> -->
            
            <div class="form-group">
				<label for="postNum">우편번호</label>
				<input type="text" name="postNum" class="form-control" id="postNum"
					placeholder="우편번호" readonly required />
				<button type="button" id="btnPostNum" class="btn btn-default btn-sm">우편번호 검색</button>
			</div>
			
			<div class="form-group">
				<label for="studAddress">주소</label> 
				<input type="text" name="studAddress" class="form-control" id="studAddress"
					placeholder="주소" required />
			</div>
			
			<div class="form-group">
				<label for="studAddress2">상세주소</label> 
				<input type="text" name="studAddress2" class="form-control" id="studAddress2"
					placeholder="상세주소" />
			</div>
            
         </td>
      </tr>
      <tr>
         <td>성별 </td>
         <td>
            <div>
               <input type="checkbox">남성 
               <input type="checkbox">여성 
            </div> 
         </td>
      </tr>
      <tr>
      <td colspan="2">
	  <input type="button" value="뒤로가기" onclick="location.href='login01.html'" style="margin: auto">
	  <button type="button" id="join" value="가입하기2">가입하기</button>
      </td>
      </tr>
   </table>
</div>
 </form>
<script>
       
</script>

 
</body>
 
</html>
