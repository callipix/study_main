<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="card card-primary">
	<div class="card-header">
		<h3 class="card-title">학생 등록</h3>
	</div>

	<!-- 
	요청URI : /stud/create?register
	요청파라미터 : {studId=a001,studNm=개똥이,studPw=java}
	파람즈 : register
	요청방식 : post
	 -->
	<form name="frm" id="frm" action="/stud/create?register" method="post">
		<div class="card-body">
			<div class="form-group">
				<label for="studId">학생 아이디</label> 
				<input type="text" name="studId" class="form-control" id="studId"
					placeholder="학생 아이디" required />
			</div>
			<div class="form-group">
				<label for="studNm">학생 명</label> 
				<input type="text" name="studNm" class="form-control" id="studNm"
					placeholder="학생 명" required />
			</div>
			<div class="form-group">
				<label for="studPw">비밀번호</label> 
				<input type="password" name="studPw" class="form-control" id="studPw"
					placeholder="비밀번호" required />
			</div>
		</div>

		<div class="card-footer">
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="reset" class="btn btn-secondary">취소</button>
		</div>
	</form>
</div>