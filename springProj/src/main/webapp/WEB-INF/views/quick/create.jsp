<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	// 자동입력
	$("#btnAuto").on("click" , function () {
		console.log("자동입력버튼 클릭")
		$("#emailAdres").val("test@test.com");
		$("#password").val("java");
		$("#no1").val("1111-1111-1111-1111");
		$("#validMonth1").val("202408");
		$("#no2").val("2222-2222-2222-2222");
		$("#validMonth2").val("202508");
		$("#likesTitle1").val("운동");
		$("#likesCont1").val("야구");
		$("#likesTitle2").val("독서");
		$("#likesCont2").val("추리소설");
		// success, error, warning, info, question
		var Toast = Swal.mixin({
			toast: true,
			position: 'top-end',
			showConfirmButton: false,
			timer: 3000
			});
			Toast.fire({
			icon:'success',
			title:'자동입력이 완료되었습니다'
			});
	});
	
	// 카드 + / - 잘체크!
	$(".divCardAdd").on("click" , function () {
		console.log("카드 추가");
		
		let len = $(".clsNo").length;	// clsNo -> no
		console.log("len : " + len);
		let str = "";
		
		str += "<div>";
		str += "<div style='width: 50%; float: left;'>";
		str += "<label for='cardNo"+(len+1)+"'>카드번호</label>";
		str += "<input type='text' class='form-control clsNo'";
		str += "name='cardVOList["+len+"].no' id='cardNo"+(len+1)+"'";
		str += "placeholder='카드번호' />";
		
		str += "</div>";
		str += "<div style='width: 50%; float: left;'>";
		str += "<label for='cardValidMonth"+(len+1)+"'>유효연월</label>";
		str += "<input type='text' class='form-control clsValidMonth'";
		str += "name='cardVOList["+len+"].validMonth' id='cardValidMonth"+(len+1)+"'";
		str += "placeholder='유효연월' />";
		str += "</div>";
		str += "</div>";
		// label for -> id와 맞춰놓으면 연결된다!
		$("#divCard").append(str);
	})
	$(".divCardMinus").on("click" , function () {
		console.log("카드 삭제");
		
		let len = $(".clsNo").length;
		
		if(len < 2){
			alert("최소 한개 이상의 카드가 있어야함");
		} else{
			$("#divCard").children().last().remove();
		}
	})
	// 취미 + / -
	$(".divLikesAdd").on("click" , function () {
		console.log("취미 추가");
		
		let len = $(".clsLikesTitle").length;
		console.log("len : " + len);
		let str = "";
		
		str += "<div>";
		str += "<div style='width: 50%; float: left;'>";
		str += "<label for='likesTitle"+(len+1)+"'>취미명</label>";
		str += "<input type='text' class='form-control clsLikesTitle'";
		str += "name='likesVOList["+len+"].likesTitle' id='likesTitle+"+(len+1)+"'";
		str += "placeholder='취미명' />";
		str += "</div>";
		str += "<div style='width: 50%; float: left;'>";
		str += "<label for='likesCont"+(len+1)+"'>취미상세</label>";
		str += "<input type='text' class='form-control clsLikesCont'";
		str += "name='likesVOList["+len+"].likesCont' id='likesCont"+(len+1)+"'";
		str += "placeholder='취미상세' />";
		str += "</div>";
		str += "</div>";

			$("#divLikes").append(str);
			//divLikes의 자식요소에 추가
	});
	// length를 인덱스에 추가
	$(".divLikesMinus").on("click" , function () {
		console.log("취미 삭제");
		
		let len = $(".clsLikesTitle").length;
		
		if(len<2){
			alert("취미 영역은 최소 한개가 있어야 합니다.");
		} else {
			$("#divLikes").children().last().remove();
		}
		// -버튼 누를시 자식요소 삭제
		/*
		<div id = "divLikes">
			<div></div>
			<div></div> -> 삭제된다!
		</div>
		*/
	});
	
	$("#uploadFile").on("change" , handleImg);

	function handleImg(e) {
			console.log("이미지 미리보기 확인 테스트");
			
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
		
		// 카드
		$(".clsNo").each(function (idx , no) {
			//<input type="text" class="form-control clsNo" name="cardVOList[0].no" id="emailAdres" placeholder="카드번호" />
			//<input type="text" class="form-control clsNo" name="cardVOList[1].no" id="emailAdres" placeholder="카드번호" />
			// name 과 value 주의
			formData.append("cardVOList["+idx+"].no" , $(this).val());
		});
		
		$(".clsValidMonth").each(function (idx , validMonth) {
			/*
	         <input type="text" class="form-control clsValidMonth" name="cardVOList[0].validMonth" id="emailAdres" placeholder="유효연월">
	         <input type="text" class="form-control clsValidMonth" name="cardVOList[1].validMonth" id="emailAdres" placeholder="유효연월">
	         */
			//name과 value 주의
			formData.append("cardVOList["+idx+"].validMonth" , $(this).val());
		});
				
		// 취미
		$(".clsLikesTitle").each(function (idx , likesTitle) {
			/*
			<input type="text" class="form-control clsLikesTitle" name="likesVOList[0].likesTitle" id="likesTitle1" placeholder="취미명" required="">
			<input type="text" class="form-control clsLikesTitle" name="likesVOList[1].likesTitle" id="likesTitle1" placeholder="취미명" required="">
			<input type="text" class="form-control clsLikesTitle" name="likesVOList[2].likesTitle" id="likesTitle1" placeholder="취미명" required="">			
			*/
			//name과 value 주의
			formData.append("likesVOList["+idx+"].likesTitle" , $(this).val());
			
		});
		
		//취미상세
		$(".clsLikesCont").each(function (idx , likesCont) {
			/*
			<input type="text" class="form-control clsLikesCont" name="likesVOList[0].likesCont" id="likesCont1" placeholder="취미상세" required="">
			<input type="text" class="form-control clsLikesCont" name="likesVOList[1].likesCont" id="likesCont1" placeholder="취미상세" required="">
			<input type="text" class="form-control clsLikesCont" name="likesVOList[2].likesCont" id="likesCont1" placeholder="취미상세" required="">
			*/
			formData.append("likesVOList["+idx+"].likesCont" , $(this).val());
		});
		
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
 <form:form modelAttribute="quickVO" action="/quick/createPost?${_csrf.parameterName}=${_csrf.token}"
		method="post" enctype="multipart/form-data">
		<div class="card-body">
			<div class="form-group">
				<label for="exampleInputEmail1">Email address</label>
				<!--  form:input => input type = "text" -->
				<form:input class="form-control" path="emailAdres" placeholder="이메일" />
				<font color="red">
					<form:errors path="emailAdres" />
				</font>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Password</label>
				<!--  form:password => input type="password" -->
				<form:password class="form-control" path="password" placeholder="비밀번호" />
					<font color="red">
						<form:errors path="password" />
					</font>
			</div>
			<div class="form-group">
				<label for="exampleInputFile">File input</label>
				<div class="input-group">
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="uploadFile"
							multiple="multiple" name="uploadFile"> <label
							class="custom-file-label" for="uploadFile">Choose file</label>
					</div>
				</div>
			</div>
			<hr />
			<div class="form-group" id="divCard">
				<div>
					<div style="width: 50%; float: left;">
						<label for="exampleInputEmail1">카드번호</label>
						<input type="text" class="form-control clsNo" name="cardVOList[0].no"
							id="no1" placeholder="카드번호" />
					</div>
					<div style="width: 50%; float: left;">
						<label for="exampleInputEmail1">유효연월</label>
						<input type="text" class="form-control clsValidMonth"
							name="cardVOList[0].validMonth" id="validMonth1"
							placeholder="유효연월" />
					</div>
				</div>
					<div>

					<div style="width: 50%; float: left;">
						<label for="exampleInputEmail1">카드번호</label>
						<input type="text" class="form-control clsNo" name="cardVOList[1].no"
							id="no2" placeholder="카드번호" />
					</div>
					<div style="width: 50%; float: left;">
						<label for="exampleInputEmail1">유효연월</label>
						 <input type="text" class="form-control clsValidMonth"
							name="cardVOList[1].validMonth" id="validMonth2"
							placeholder="유효연월" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="btn-group w-100 divCardAdd">
						<span class="btn btn-success col fileinput-button dz-clickable">
							<i class="fas fa-plus"></i>
						</span>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="btn-group w-100 divCardMinus">
						<span class="btn btn-success col fileinput-button dz-clickable">
							<i class="fas fa-minus"></i>
						</span>
					</div>
				</div>
			</div>
			<hr />
			<!-- ////////// 취미시작 ////////// -->
			<div class="form-group" id="divLikes">
				<div>
					<div style="width: 50%; float: left;">
						<label for="likesTitle1">취미명</label>
						 <input type="text"	class="form-control clsLikesTitle" name="likesVOList[0].likesTitle"
							id="likesTitle1" placeholder="취미명" required />
					</div>
					<div style="width: 50%; float: left;">
						<label for="likesCont1">취미상세</label>
						<input type="text" class="form-control clsLikesCont" name="likesVOList[0].likesCont"
							id="likesCont1" placeholder="취미상세" required />
					</div>
				</div>

				<div>
					<div style="width: 50%; float: left;">
						<label for="likesTitle2">취미명</label>
						<input type="text" class="form-control clsLikesTitle" name="likesVOList[1].likesTitle"
							id="likesTitle2" placeholder="취미명" />
					</div>
					<div style="width: 50%; float: left;">
						<label for="likesCont2">취미상세</label>
						<input type="text" class="form-control clsLikesCont" name="likesVOList[1].likesCont"
							id="likesCont2" placeholder="취미상세" />
					</div>
				</div>
				<!-- ////////// 취미끝 ////////// -->
			</div>
				<hr />
				<div class="row">
					<div class="col-lg-6">
						<div class="btn-group w-100 divLikesAdd">
							<span class="btn btn-success col fileinput-button dz-clickable">
								<i class="fas fa-plus"></i>
							</span>
						</div>
					</div>
					
					<div class="col-lg-6">
						<div class="btn-group w-100 divLikesMinus">
							<span class="btn btn-success col fileinput-button dz-clickable">
								<i class="fas fa-minus"></i>
							</span>
						</div>
					</div>
				</div>
		</div>
		<hr />

		<div class="card-footer">
		<!-- ajax(button) 인지 submit인지 잘 체크!! -->
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="button" id="btnAuto" class="btn btn-primary">자동입력</button>
<!-- 			<button type="button" id="btnAjaxSubmit" class="btn btn-primary">등록</button> -->
		</div>
		<sec:csrfInput />
	 </form:form>
</div>