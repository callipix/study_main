<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
	// 이미지 미리보기 시작//////////////////////////////
	$("#inputImgs").on("change" , handleImg);
	// 파일을 바꾸면 change이벤트 발생
	
	// e : onchange 이벤트 객체
	function handleImg(e) {
		console.log("개똥이");
		//e.target : <input type="file"..
		let files = e.target.files;
		// 이미지 오브젝트 배열
		let fileArr = Array.prototype.slice.call(files);
		//초기화
		$("#tdImage").html("");
		//fileArr : {"개똥이.jpg객체" , "홍길동.jpg객체" , ""}
		// f : 각각의 이미지 파일
		fileArr.forEach(function (f) {
			//f.type : MIME타입
			if(!f.type.match("image.*")){
				alert("이미지 확장자만 가능합니다");
				//함수 종료
				return;
			}
			// 이미지를 읽어보자
			let reader = new FileReader();
			
			//e : reader가 이미지를 읽을 때 해당 이벤트
			reader.onload = function (e) {
				//e.target : 이미지 객체
				let img = "<img src="+e.target.result+" style='width:20%' />";
				$("#tdImage").append(img);	
			}
			reader.readAsDataURL(f);
		});
	}
	// 이미지 미리보기 끝//////////////////////////////
	
	// ajax 파일업로드 시작 //////////////////////////////
	// Ajax(Asynchronous비동기 JavaScript and XML)
	// 응답이 없어도 작업을 수행한다.
	$("#btnAjaxSubmit").on("click" , function () {
		let itemName = $("#itemName").val();
		let price = $("#price").val();
		let description = $("#description").val();
		let inputImgs = $("#inputImgs"); //파일객체
		// 이미지 파일들을 꺼내오자
		let files = inputImgs[0].files;
		console.log(files[0]);
		//가상의 폼을 생성 <form></form>
		let formData = new FormData();
		formData.append("itemName" , itemName);
		formData.append("price" , price);
		formData.append("description" , description);

		// 가상폼인 formData에 각각의 이미지를 넣자
		for(let i = 0 ; i < files.length ; i++){
			formData.append("uploadFile" , files[i])
		}
		/*
		<form>
			<input type="text" name="itemName" value="삼성폰">
			<input type="text" name="price" value="12000">
			<input type="text" name="description" value="괜찮다">
			<input type="file" name="uploadfile"...
			<input type="file" name="uploadfile"...
			//file의 name이 같다 => 배열로 받는다
		</form>		
		*/
		//ajax
		$.ajax({
			url : "/item/registerAjaxPost3",
			processData : false,
			contentType : false,
			data : formData,
			dataType : "text",
			type : "post",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},	// beforeSend => 스프링 시큐리티에서 사용시 반드시 작성
			success : function (result) {
				console.log("result : " , result);
			}
		})
	});
	// ajax 파일업로드 끝 ///////////////////////////////
});
</script>
<h2>REGISTER</h2>
<!-- 
요청 URI : /item/registerPost
요청 파라미터 : {itemName = 삼성태블릿 , price = 120000 , description=쓸만한 , uploadFile= 파일객체}
요청 방식 : post
파일업로드
1) method는 꼭 post!
2) enctype="multipart/form-data"
3) <input type="file" name="uploadFile".. name속성이 꼭 있어야 함!
4) <sec:csrfInput />
*5) action 속성의 uri 뒤에 token 추가
 -->
<form action="/item/registerPost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>상품명</th>
			<td><input type="text" name="itemName" required="required" placeholder="상품명"></td>
		</tr>	
		<tr>
			<th>가격</th>
			<td><input type="text" name="price" required="required" placeholder="가격"></td>
		</tr>	
		<tr>
			<th>상품이미지</th>
			<td><input type="file" name="uploadFile" placeholder="상품이미지"></td>
		</tr>	
		<tr>
			<th>개요</th>
			<td><input type="text" name="description" placeholder="개요"></td>
		</tr>	
	</table>
	<sec:csrfInput/>
	<button type="submit">상품 등록</button>
	<button type="reset">초기화</button>
</form>
<!-- 폼 복사 -->
<hr />
<form action="/item/registerPost2?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>상품명</th>
			<td><input type="text" name="itemName" required="required" placeholder="상품명"></td>
		</tr>	
		<tr>
			<th>가격</th>
			<td><input type="text" name="price" required="required" placeholder="가격"></td>
		</tr>	
		<tr>
			<th>상품이미지</th>
			<td><input type="file" name="uploadFile" placeholder="상품이미지"></td>
		</tr>	
		<tr>
			<th>상품이미지</th>
			<td><input type="file" name="uploadFile2" placeholder="상품이미지2"></td>
		</tr>	
		<tr>
			<th>개요</th>
			<td><input type="text" name="description" placeholder="개요"></td>
		</tr>	
	</table>
	<sec:csrfInput/>
	<button type="submit">상품 등록</button>
	<button type="reset">초기화</button>
</form>
<!-- 폼 복사 -->
<!-- 
요청URI : /item/registerPost3
요청파라미터 : {itemName=삼성태블릿,price=120000,description=쓸만함
         ,uploadFile=파일객체들}
요청방식 : post
-->
<hr />
<form action="/item/registerPost3?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>상품명</th>
			<td><input type="text" name="itemName" required="required" placeholder="상품명"></td>
		</tr>	
		<tr>
			<th>가격</th>
			<td><input type="text" name="price" required="required" placeholder="가격"></td>
		</tr>	
		<tr>
			<th>다중 상품이미지</th>
			<td><input type="file" name="uploadFile" id="uploadFile" placeholder="상품이미지" multiple="multiple"></td>
		</tr>	
		<tr>
			<th>개요</th>
			<td><input type="text" name="description" placeholder="개요"></td>
		</tr>	
	</table>
	<sec:csrfInput/>
	<button type="submit">상품 등록</button>
	<button type="reset">초기화</button>
</form>
<!-- 
요청URI : /item/registerPost3
요청파라미터 : {itemName=삼성태블릿,price=120000,description=쓸만함
         ,uploadFile=파일객체들}
요청방식 : post
-->
<hr />
<form action="/item/registerPost3?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>상품명</th>
			<td><input type="text" name="itemName" id="itemName" required="required" placeholder="상품명"></td>
		</tr>	
		<tr>
			<th>가격</th>
			<td><input type="text" name="price" id="price" required="required" placeholder="가격"></td>
		</tr>	
		<tr>
			<th>다중 상품이미지</th>
			<td><input type="file" id="inputImgs" name="uploadFile" placeholder="상품이미지" multiple="multiple" ></td>
		</tr>
		<tr>
			<td colspan="2" id="tdImage"></td>
		</tr>	
		<tr>
			<th>개요</th>
			<td><input type="text" name="description" id="description" placeholder="개요"></td>
		</tr>	
	</table>
	<sec:csrfInput/>
	<button type="button" id="btnAjaxSubmit" >상품 등록</button>
	<button type="reset">초기화</button>
</form>