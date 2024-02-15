<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
let ecId = $("#ecId").val();
let ecName = $("#ecName").val();
let ecPrice = $("#ecPrice").val();
let ecColor = $("#ecColor").val();
let ecSize = $("#ecSize").val();
let ecDetail = $("#ecDetail").val();

console.log("ecId" , ecId);
console.log("ecName" ,ecName );
console.log("ecPrice" , ecPrice);
console.log("ecColor" , ecColor);
console.log("ecSize" , ecSize);
console.log("ecDetail" , ecDetail);
</script>
<hr />
<form action="/shop/createPost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>상품아이디</th>
			<td><input type="text" id="ecId" name="ecId" required="required" placeholder="상품아이디"></td>
		</tr>	
		<tr>
			<th>상품명</th>
			<td><input type="text" id="ecName" name="ecName" required="required" placeholder="상품명"></td>
		</tr>	
		<tr>
			<th>가격</th>
			<td><input type="text" id="ecPrice" name="ecPrice" required="required" placeholder="상품가격"></td>
		</tr>	
		<tr>
			<th>다중 상품이미지</th>
			<td><input type="file" name="uploadFile" id="uploadFile" placeholder="상품이미지" multiple="multiple"></td>
		</tr>
		<tr>
			<th>색상</th>
			<td><input type="text" id="ecColor" name="ecColor" required placeholder="색상"></td>
		</tr>
		<tr>
			<th>사이즈</th>
			<td><input type="text" id="ecSize" name="ecSize" required placeholder="사이즈"></td>
		</tr>
		<tr>
			<th>상세설명</th>
			<td><input type="text" id="ecDetail" name="ecDetail" placeholder="개요"></td>
		</tr>
	</table>
	<button type="submit">상품 등록</button>
	<button type="reset">초기화</button>
</form>
	<sec:csrfInput/>