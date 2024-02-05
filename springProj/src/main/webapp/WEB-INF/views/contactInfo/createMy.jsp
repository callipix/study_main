<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
	// 내풀이
	//자동입력
	$("#btnAuto").on("click" , function () {
		console.log("자동입력 버튼 클릭");
		$("#ciName").val("테스트1");
		$("#ciMail").val("test@test.com");
		$("#ciSubj").val("테스트주제1");
		$("#ciMesg").val("테스트메세지1");
	})
	
	$("#insertAjax").on("click" , function () {
		console.log("버튼 클릭");
	});
	
	$("#uploadFile").on("change" , handleImg);
	
	function handleImg(e) {
		console.log("이미지 미리보기 확인 테스트");
		let files = e.target.files;
			
		let fileArr = Array.prototype.slice.call(files);
		
		$("#image").html("");
		fileArr.forEach(function (f) {
			
			if(!f.type.match("image.*")){
				alert("이미지만 가능!");
			return
			};
		let reader = new FileReader();
		
		reader.onload = function (e) {
			let img = "<img src="+e.target.result+" style='width:80%' />";
			$("#image").append(img);
		}
		reader.readAsDataURL(f);
		});
	};
		
});
</script>

<!-- 
요청URI : /contactInfo/createPost
요청파라미터 : {ciName=개똥이,ciMail=test@test.com,ciSubj=채용상담,ciImgUrl=파일객체,
		    ciMesg=채용절차에 대한 상담,ciRegDt=2024/02/17}
요청방식 : post
-->  
<form id="contactInfoVO" name="contactInfoVO" 
	action="/contactInfo/createPost?${_csrf.parameterName}=${_csrf.token}" 
	method="post" enctype="multipart/form-data">
<section class="content">
	<div class="card">		
		<div class="card-body row">
			<div
				class="col-5 text-center d-flex align-items-center justify-content-center">
				<div class="">
				<span id="image">이미지 테스트</span>
				</div>
			</div>
			<div class="col-7">
				<div class="form-group">
					<label for="ciName">방문자 명</label> 
					<input type="text" name="ciName" id="ciName" class="form-control" />
				</div>
				<div class="form-group">
					<label for="ciMail">이메일</label> 
					<input type="email" name="ciMail" id="ciMail" class="form-control" />
				</div>
				<div class="form-group">
					<label for="ciSubj">방문 주제</label> 
					<input type="text" name="ciSubj" id="ciSubj" class="form-control" />
				</div>
				<div class="form-group">
					<label for="uploadFile">방문자 사진</label>
					<div class="custom-file">
						<input type="file" name="uploadFile" id="uploadFile"
							 class="custom-file-input">
						<label class="custom-file-label" for="uploadFile">Choose file</label>
					</div> 
				</div>
				<div class="form-group">
					<label for="ciMesg">방문 내용</label>
					<textarea name="ciMesg" id="ciMesg" class="form-control" rows="4"></textarea>
				</div>
				<div class="form-group">
					<label for="ciRegDt">방문자 예정일</label> 
					<input type="date" name="ciRegDt" id="ciRegDt" class="form-control" />
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary">방문 신청</button>
					<button type="reset" class="btn btn-warning">다시 입력</button>
					<button type="button" id="btnAuto" class="btn btn-warning">자동입력</button>
				</div>
			</div>
		</div>
	</div>
</section>
<sec:csrfInput />
</form>