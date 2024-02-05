<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
	
	$("#insertAjax").on("click" , function () {
		console.log("버튼 클릭");
	});
	
	$("#ciImg").on("change" , handleImg);
	
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
<div class="content-wrapper" style="min-height: 2646.44px;">

	<section class="content">

		<div class="card">
		<form:form modelAttribute="contactInfoVO" action="contact/insert?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
			<div class="card-body row">
				<div
					class="col-5 text-center d-flex align-items-center justify-content-center">
					<div class="#">
						<h2>
							Admin<strong>LTE</strong>
						</h2>
						<p class="lead mb-5" id="image">
							123 Testing Ave, Testtown, 9876 NA<br> Phone: +1 234
							56789012
						</p>
					</div>
				</div>
				<div class="col-7">
				
					<div class="form-group">
						<label for="ciNm">방문자 명</label>
						 <input type="text" id="ciNm" class="form-control">
					</div>
					<div class="form-group">
						<label for="ciMail">이메일</label>
							<input type="email" id="ciMail" class="form-control">
					</div>
					<div class="form-group">
						<label for="ciSubject">방문주제</label>
							<input type="text" id="ciSubject" class="form-control">
					</div>
					
					<div class="form-group">
						<label for="ciImg">방문자 사진</label>
							<input type="file" id="ciImg" class="form-control" multiple>
					</div>
					
					<div class="form-group">
						<label for="ciMesg">방문내용</label>
							<textarea id="ciMesg" class="form-control" rows="4"></textarea>
					</div>
					<div class="form-group">
						<label for="ciDate">방문자예정일</label>
							<input type="date" id="ciDate" class="form-control">
					</div>

					<div class="form-group">
						<input type="button" id="insertAjax" class="btn btn-primary" value="방문신청">
						<input type="reset" id="insertAjax" class="btn btn-primary" value="다시입력">
					</div>
				</div>
			</div>
		</form:form>
		</div>
	</section>
</div>