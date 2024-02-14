<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<hr />
<form action="/shop/createecId?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>상품아이디</th>
			<td><input type="text" name="ecId" required="required" placeholder="상품아이디"></td>
		</tr>	
		<tr>
			<th>상품명</th>
			<td><input type="text" name="ecName" required="required" placeholder="상품명"></td>
		</tr>	
		<tr>
			<th>색깔</th>
			<td><input type="text" name="ecColor" required="required" placeholder="상품색깔"></td>
		</tr>	
		<!-- <tr>
			<th>다중 상품이미지</th>
			<td><input type="file" name="uploadFile" id="uploadFile" placeholder="상품이미지" multiple="multiple"></td>
		</tr>	 -->
		<tr>
			<th>상세설명</th>
			<td><input type="text" name="ecDetail" placeholder="개요"></td>
		</tr>	
	</table>
	<button type="submit">상품 등록</button>
	<button type="reset">초기화</button>
</form>
	<sec:csrfInput/>