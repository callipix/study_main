<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#uploadFile").on("change" , handleImg);

	function handleImg(e) {
			console.log("확인테스트");
			
			let files= e.target.files;
			
			let fileArr = Array.prototype.slice.call(files);
			
			$("#image").html("");
			
			fileArr.forEach(function (f) {
				
				if(!f.type.match("image.*")){
					alert("이미지만 가능!");
				return
				};
			let reader = new FileReader();
			
			reader.onload = function (e) {
				let img = "<img src="+e.target.result+" style='width:30%' />";
				$("#image").append(img);
			}
			reader.readAsDataURL(f);
			});
		}
	
	$("#btnAjaxSubmit").on("click" , function () {
		console.log("개똥이");
		let emailAdres = $("#emailAdres").val();
		let password = $("#password").val();
		//<input type="file"..
		let inputFile = $("#uploadFile");
		// 1.jpg , 2.jpg , 3.jpg
		let files = inputFile[0].files;
		
		let formData = new FormData();
		formData.append("emailAdres" , emailAdres);
		formData.append("password" , password);
		
		for(let i = 0 ; i < files.length; i++){
			formData.append("uploadFile" , files[i]);
		}
		
		$.ajax({
			url : "/quick/createAjaxPost",
			processData:false,
			contentType:false,
			data:formData,
			dataType : "text",
			type:"post",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},	// beforeSend => 스프링 시큐리티에서 사용시 반드시 작성
			success: function (result) {
				console.log("result : " , result);
				}
		});
	});
});
</script>

<div class="card card-primary">
	<div class="card-header">
		<h3 class="card-title">Quick Example</h3>
	</div>
<!-- 
요청 URI : /quick/createPost
요청파라미터 : {emailAdres=test@test.com,password=java,uploadFile=파일객체}
요청방식 : post
 -->
	<form action="/quick/createPost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<div class="card-body">
			<div class="form-group">
				<label for="exampleInputEmail1">Email address</label> 
				<input type="email" class="form-control"
					name="emailAdres" id="emailAdres" value="${quickVO.emailAdres}"
					placeholder="이메일" required="required" />
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Password</label> <input
					type="password" class="form-control" 
					name="password" id="password"
					placeholder="비밀번호" required="required" />
			</div>
			<div class="form-group">
				<label for="exampleInputFile">File input</label>
				<div class="input-group">
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="uploadFile" multiple="multiple" name="uploadFile">
						<label class="custom-file-label" for="uploadFile">Choose file</label>
					</div>
				</div>
				<hr />
					<div>	
						<span id="image"></span>
					</div>
			</div>
		</div>

		<div class="card-footer">
			<button type="button" id="btnAjaxSubmit" class="btn btn-primary">등록</button>
		</div>
		<sec:csrfInput />
	</form>
</div>