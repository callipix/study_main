<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
			<td><input type="file" name="uploadFile" placeholder="상품이미지" multiple="multiple" ></td>
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