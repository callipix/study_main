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