<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="card card-primary">
<p>${quickVO}</p>
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
					name="emailAdres" id="emailAdres"
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
						<input type="file" class="custom-file-input" id="uploadFile" name="uploadFile">
						<label class="custom-file-label" for="uploadFile">Choose file</label>
					</div>
				</div>
			</div>
		</div>

		<div class="card-footer">
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
		<sec:csrfInput />
	</form>
</div>