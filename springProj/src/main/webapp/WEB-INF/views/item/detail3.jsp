<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".clsPicture").on("click",function(){
		//this : 클릭한 바로 그 이미지
		//data-picture-url=".."
		let pictureUrl = $(this).data("pictureUrl");
		console.log("pictureUrl : " + pictureUrl);
		
		$(".modalPicBody > p").html("<img src='/resources/upload"+pictureUrl +"' style='width:80%' />");	//자식 태그로 접근(modalPicBody 의 자식요소)
		
//		modalPicTitle을 이미지 명으로 처리해보자
//		let test = pictureUrl.split("_");
//		$(".modalPicTitle").html(test[1]);
		
		// substring 사용 -> 선생님 풀이
		let fileName = pictureUrl.substring(pictureUrl.lastIndexOf("_")+1);
		console.log(fileName);
		$(".modalPicTitle").html(fileName);
	});
});
</script>
<style>
.img-fluid {
width: 200px;
height: 200px;
}
</style>
<h2>상품상세</h2>
<form action="/item/detail3?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>상품명</th>
			<td><input type="text" name="itemName" value="${item3VO.itemId}" required="required" readonly="readonly" placeholder="상품명"></td>
		</tr>	
		<tr>
			<th>가격</th>
			<td><input type="text" name="price" required="required" value="${item3VO.price}" placeholder="가격" ></td>
		</tr>
		
	<tr>
         <th>다중 상품이미지</th>
         <td><input type="file" name="uploadFile" id="uploadFile" placeholder="상품이미지" multiple /></td><!-- multiple 드래그,여러개 쌉 가능 -->
    </tr>
      <!-- 이미지를 출력해보자 -->
    <tr>
    	<td colspan="2">
    		<c:forEach var="attachVO" items="${item3VO.attachVOList}" varStatus="stat">
            	<a href="#modalPicture" class="clsPicture" data-picture-url="${attachVO.pictureUrl}" data-toggle="modal">
                	<img src="/resources/upload${attachVO.pictureUrl}" class="img-fluid mb-2" alt="white sample">
                </a>
            </c:forEach>
        </td>
	</tr>
		<tr>
			<th>개요</th>
			<td><input type="text" name="description" placeholder="개요" readonly="readonly" value="${item3VO.description}"></td>
		</tr>	
	</table>
	<sec:csrfInput/>
	<button type="submit">상품 등록</button>
	<button type="reset">초기화</button>
</form>
<!-- ///// 이미지 크게 보기 모달 시작 /////-->
<div class="modal fade" id="modalPicture">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modalPicTitle">Large Modal</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modalPicBody">
        <p>One fine body&hellip;</p>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
<!-- ///// 이미지 크게 보기 모달 끝 /////-->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->