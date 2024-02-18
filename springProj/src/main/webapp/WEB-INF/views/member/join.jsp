<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
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
//다음 우편번호 검색
$(function () {
    
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
});
</script>
</head>
<body>
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
            <span class="redFont">*</span>아이디:
         </td>
         <td>
            <input type="text" placeholder="4~12자의 영문 대소문자, 수자만 입력"; style="width: 220px">
            <input type="button" value="아이디 검사">
         </td>
      </tr>
      <tr>
         <td>
            <span class="redFont">*</span>비밀번호:
         </td>
         <td>
            <input type="password">
            4~12자의 영문 대소문자와 숫자로만 입력
         </td>
      </tr>
      <tr>
         <td>
            <span class="redFont">*</span>비밀번호확인:
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
            <input type="text" style="width: 200px">
            <input type="button" value="메일 확인">
            예)id@domain.com
         </td>
      </tr>
      <tr>
         <td>
            <span class="redFont">*</span>이름:
         </td>
         <td>
            <input type="text" style="width: 200px">
         </td>
      </tr>
      <tr>
         <td colspan="2" style="background-color: #cee3f6; font-weight: bold;">
            개인 신상 정보
         </td>
      </tr>
      <tr>
         <td>
            <span class="redFont">*</span>주민등록번호:
         </td>
         <td>
            <input type="text" style="width: 80px">
            -
            <input type="text" style="width: 80px">
            <input type="button" value="확인">
            예)123456-1234567
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
         <td>
            관심분야:
         </td>
         <td>
            <div>
               <input type="checkbox">컴퓨터 
               <input type="checkbox">인터넷 
               <input type="checkbox">여행 
               <input type="checkbox">영화감삼 
               <input type="checkbox">음악감상
            </div> 
         </td>
      </tr>
      <tr>
         <td>
            자기소개:
         </td>
         <td>
            <textarea rows="5" cols="55"></textarea>
         </td>
      </tr>
   </table>
</div>
  <input type="button" value="뒤로가기" onclick="location.href='login01.html'" style="margin: auto">
 
</body>
 
</html>
