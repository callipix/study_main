<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
    
	let color = "";
	let size = "";
	
	$("input:radio[name=color_option]").on("click" , function () {
		color += $(this).val();
		$(this).attr("checked" , true);
// 		$(this).addClass("selected");
// 		$(this).siblings().removeClass("selected");
		console.log("색상테스트" , color);
		
    });
	
    $("input:radio[name=size_option]").on("click" , function () {
		size += $(this).val();
		$(this).attr("checked" , true);
		console.log("사이즈테스트" , size);
		
    });
    
    $("#btnAddAjax").on("click" , function (event) {

	let formData = new FormData();
	let ecName = $("#ecName").val();
	let ecId = $("#ecId").val();
	let inputImgs = $("#inputImgs");
	
	let files = inputImgs[0].files;
	let price = $("#ecPrice").val();
	let detail = $("#ecDetail").val();
	let url = { };
	formData.append("ecName" , ecName);
    formData.append("ecColor" , color);
    formData.append("ecSize" , size);
	formData.append("ecPrice" , price);
	formData.append("ecDetail" , detail);
	formData.append("url" , url)

    for(let i = 0 ; i < files.length ; i++){
		formData.append("uploadFile" , files[i]);
    };
    
    $.ajax({
		url : "/shop/createPostAjax",
		processData : false,
		contentType : false,
		data : formData,
		dataType : "text",
		type : "post",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},	// beforeSend => 스프링 시큐리티에서 사용시 반드시 작성
		success : function (result) {
			console.log("result : " , result);
			console.log("result : " + result);
			console.log("ecommerceVOList : " + result.ecommerceVOList);
		
			console.log("ecommerceVO : " + ecommerceVO.ecId);
			console.log("ecommerceVO : " + ecommerceVO.ecName);
			console.log("ecommerceVO : " + ecommerceVO.ecPrice);
			console.log("ecommerceVO : " + ecommerceVO.ecDetail);
			
			let str = "";

			str += "<div class='row' id='divTest'>";
			str += "<div class='col-12 col-sm-6'>";
			str += "<h3 class='d-inline-block d-sm-none'>LOWA Men’s Renegade GTX Mid Hiking Boots Review</h3>";
			str += "<div class='col-12'>";
			str += "<img src='../resources/upload"+files[0]+"'class='product-image' alt='Product Image'>";
			str += "</div><div></div>";
			str += "<div class='col-12 product-image-thumbs'>";
			str += "<div class='product-image-thumb' id='img1'><img src='../resources/upload/"+files[0]+" alt='Product Image'></div>";
			str += "<div class='product-image-thumb' id='img2'><img src='../resources/upload/"+files[1]+"alt='Product Image'></div>";
			str += "<div class='product-image-thumb' id='img3'><img src='../resources/upload/"+files[2]+"alt='Product Image'></div>";
			str += "<div class='product-image-thumb' id='img4'><img src='../resources/upload/"+files[3]+"alt='Product Image'></div>";
			str += "<div class='product-image-thumb' id='img5'><img src='../resources/upload/"+files[4]+"alt='Product Image'></div>";
			str += "</div></div>";
// 					<div class="product-image-thumb" id="img2"><img src="../resources/images/prod-2.jpg" alt="Product Image"></div>
// 					<div class="product-image-thumb" id="img3"><img src="../resources/images/prod-3.jpg" alt="Product Image"></div>
// 					<div class="product-image-thumb" id="img4"><img src="../resources/images/prod-4.jpg" alt="Product Image"></div>
// 					<div class="product-image-thumb" id="img5"><img src="../resources/images/prod-5.jpg" alt="Product Image"></div>
			str += "<div class='col-12 col-sm-6'>";
//			str += "<form action='/shop/createPost?"+${_csrf.parameterName}+"="+${_csrf.token}+"' method='post' enctype='multipart/form-data'>";
			str += "<form action='/shop/createPost?ecId='"+ecId+"' method='post' enctype='multipart/form-data'>";
			str += "<form action='/shop/createPost?detail' method='post' enctype='multipart/form-data'>";
			str += "<h3 class='my-3'>LOWA Men’s Renegade GTX Mid Hiking Boots Review</h3>";
			str += "<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terr.</p>";
			str += "<p>"+'${productVO}'+"</p>";
			str += "<h4>Available Colors</h4><hr>";
			str += "<div><button type='button' id='btnAddAjax'>상품등록</button></div>	<hr />";
			str += "<div class='btn-group btn-group-toggle' id='ecColor' data-toggle='buttons'>";
			
			str += "<label class='btn btn-default text-center'>";
			str += "<input type='radio' name='color_option' id='color_option_a1' value='Green' autocomplete='off' checked=''>Green<br>";
			str += "<i class='fas fa-circle fa-2x text-green'></i></label>";
			
			str += "<label class='btn btn-default text-center'>";
			str += "<input type='radio' name='color_option' id='color_option_a2' value='Blue' autocomplete='off'>Blue<br>";
			str += "<i class='fas fa-circle fa-2x text-blue'></i></label>";
			
			str += "<label class='btn btn-default text-center'>";
			str += "<input type='radio' name='color_option' id='color_option_a3' value='Purple' autocomplete='off'>Purple<br>";
			str += "<i class='fas fa-circle fa-2x text-purple'></i></label>";
			
			str += "<label class='btn btn-default text-center'>";
			str += "<input type='radio' name='color_option' id='color_option_a4' value='Red' autocomplete='off'>Red<br>";
			str += "<i class='fas fa-circle fa-2x text-red'></i></label>";
			
			str += "<label class='btn btn-default text-center'>";
			str += "<input type='radio' name='color_option' id='color_option_a5' value='Orange' autocomplete='off'>Orange<br>";
			str += "<i class='fas fa-circle fa-2x text-orange'></i></label>";
			
			str += "</div>";
			str += "<h4 class='mt-3'>Size <small>Please select one</small></h4>";
			str += "<div class='btn-group btn-group-toggle' id='ecSize' data-toggle='buttons'>";
			str += "<label class='btn btn-default text-center'>";
			str += "<input type='radio' name='size_option' id='size_option_b1' value='S' autocomplete='off'>";
			str += "<span class='text-xl'>S</span><br>";
			str += "Small</label>";
			str += "<label class='btn btn-default text-center'>";
			str += "<input type='radio' name='size_option' id='size_option_b2' value='M' autocomplete='off'>";
			str += "<span class='text-xl'>M</span><br>";
			str += "Medium</label>";
			str += "<label class='btn btn-default text-center'>";
			str += "<input type='radio' name='size_option' id='size_option_b3' value='L' autocomplete='off'>";
			str += "<span class='text-xl'>L</span><br>";
			str += "Large</label>";
			str += "<label class='btn btn-default text-center'>";
			str += "<input type='radio' name='size_option' id='size_option_b4' value='XL' autocomplete='off'>";
			str += "<span class='text-xl'>XL</span>"
			str += "<br>Xtra-Large</label></div><hr />";
			str += "<div class='form-group'>";
			str += "<label for='ecName'>상품명&nbsp;&nbsp;</label>";
			str += "<input type='text' id='ecName' name='ecName' required='required' placeholder='상품명'>";
			str += "</div>";
			
			str += "<div class='form-group'>";
			str += "<label for='ecDetail'>상품상세</label>";
			str += "<textarea name='ecDetail' id='ecDetail' rows='4' class='form-control'></textarea>";
			str += "</div>";
			str += "<div class='bg-gray py-2 px-3 mt-4'>";
			str += "<label for='ecPrice'>상품가격&nbsp;</label>";
			str += "<input type='text' id='ecPrice' name='ecPrice' required='required' placeholder=''>";
			str += "<h2 class='mb-0'></h2>";
			str += "<h4 class='mt-0'><small>Ex Tax: $80.00 </small></h4></div><hr />";
			
			str += "<div class='form-group'>";
			str += "<label for='inputImgs'>이미지 등록</label>";
			str += "<input type='file' name='uploadFile' id='inputImgs' placeholder='상품이미지' multiple='multiple'></div>";
			str += "<div class='mt-4'>"
			str += "<div class='btn btn-primary btn-lg btn-flat'>";
			str += "<i class='fas fa-cart-plus fa-lg mr-2'></i>Add to Cart</div>";
			str += "<div class='btn btn-default btn-lg btn-flat'>";
			str += "<i class='fas fa-heart fa-lg mr-2'></i>Add to Wishlist</div></div>";
			
			str += "<div class='mt-4 product-share'>";
			str += "<a href=''#' class='text-gray'>";
			str += "<i class='fab fa-facebook-square fa-2x'></i>";
			str += "</a>";
			str += "<a href='#' class='text-gray'>";
			str += "<i class='fab fa-twitter-square fa-2x'></i></a>";
			str += "<a href='#' class='text-gray'>";
			str += "<i class='fas fa-envelope-square fa-2x'></i></a>";
			str += "<a href='#' class='text-gray'>";
			str += "<i class='fas fa-rss-square fa-2x'></i></a>";
			str += "</div>";
//			str += "<sec:csrfInput/>";
			str += "</form></div></div>";
			
			$("#divTest").append(str);
			
 			}
		});
    });
});
</script>
<div>
<section class="content">
<div class="card card-solid">
<div class="card-body">
<div class="row" id="divTest">
	<div class="col-12 col-sm-6">
		<h3 class="d-inline-block d-sm-none">LOWA Men’s Renegade GTX Mid Hiking Boots Review</h3>
	<div class="col-12">
		<img src="../resources/images/main.jpg" class="product-image" alt="Product Image">
	</div>
	<div>
	</div>
		<div class="col-12 product-image-thumbs">
			<div class="product-image-thumb" id="img1"><img src="../resources/images/main.jpg" alt="Product Image"></div>
			<div class="product-image-thumb" id="img2"><img src="../resources/images/prod-2.jpg" alt="Product Image"></div>
			<div class="product-image-thumb" id="img3"><img src="../resources/images/prod-3.jpg" alt="Product Image"></div>
			<div class="product-image-thumb" id="img4"><img src="../resources/images/prod-4.jpg" alt="Product Image"></div>
			<div class="product-image-thumb" id="img5"><img src="../resources/images/prod-5.jpg" alt="Product Image"></div>
		</div>
			
	</div>
		<div class="col-12 col-sm-6">
		 <form:form modelAttribute="ecommerceVO" action="/shop/createPost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
<!-- 		<form action="/shop/createPost?detail" method="post" enctype="multipart/form-data"> -->

			<h3 class="my-3">LOWA Men’s Renegade GTX Mid Hiking Boots Review</h3>
		<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terr.</p>
		<p>${productVO}</p>
		<h4>Available Colors</h4>
		<hr>
		<div>
<!-- 		<button type="button" id="btnAddAjax">상품등록</button> -->
		<button type="submit">상품등록</button>
		</div>
		<hr />
		<div class="btn-group btn-group-toggle" id="ecColor" data-toggle="buttons">
			<label class="btn btn-default text-center">
			<input type="radio" name="color_option" id="color_option_a1" value="Green" autocomplete="off" checked="">Green<br>
				<i class="fas fa-circle fa-2x text-green"></i>
			</label>
			<label class="btn btn-default text-center">
			<input type="radio" name="color_option" id="color_option_a2" value="Blue" autocomplete="off">Blue
			<br>
			<i class="fas fa-circle fa-2x text-blue"></i>
			</label>
			<label class="btn btn-default text-center">
			<input type="radio" name="color_option" id="color_option_a3" value="Purple" autocomplete="off">Purple
			<br>
			<i class="fas fa-circle fa-2x text-purple"></i>
			</label>
			<label class="btn btn-default text-center">
			<input type="radio" name="color_option" id="color_option_a4" value="Red" autocomplete="off">Red
			<br>
			<i class="fas fa-circle fa-2x text-red"></i>
			</label>
			<label class="btn btn-default text-center active">
			<input type="radio" name="color_option" id="color_option_a5" value="Orange" autocomplete="off">Orange
			<br>
			<i class="fas fa-circle fa-2x text-orange"></i>
			</label>
		</div>
		<h4 class="mt-3">Size <small>Please select one</small></h4>
		<div class="btn-group btn-group-toggle" id="ecSize" data-toggle="buttons">
			<label class="btn btn-default text-center">
			<input type="radio" name="size_option" id="size_option_b1" value="S" autocomplete="off">
			<span class="text-xl">S</span>
			<br>
			Small
			</label>
			<label class="btn btn-default text-center">
			<input type="radio" name="size_option" id="size_option_b2" value="M" autocomplete="off">
			<span class="text-xl">M</span>
			<br>
			Medium
			</label>
			<label class="btn btn-default text-center">
			<input type="radio" name="size_option" id="size_option_b3" value="L" autocomplete="off">
			<span class="text-xl">L</span>
			<br>
			Large
			</label>
			<label class="btn btn-default text-center">
			<input type="radio" name="size_option" id="size_option_b4" value="XL" autocomplete="off">
			<span class="text-xl">XL</span>
			<br>
			Xtra-Large
			</label>
		</div>
		<hr />
		<div class="form-group">
			<label for="ecColor">색상&nbsp;&nbsp;</label>
			<input type="text" id="ecColor" name="ecColor" required="required" placeholder="색상">
		</div>
		<div class="form-group">
			<label for="ecSize">사이즈&nbsp;&nbsp;</label>
			<input type="text" id="ecSize" name="ecSize" required="required" placeholder="사이즈">
		</div>
		<div class="form-group">
			<label for="ecName">상품명&nbsp;&nbsp;</label>
			<input type="text" id="ecName" name="ecName" required="required" placeholder="상품명">
		</div>
		<div class="form-group">
			<label for="ecDetail">상품상세</label>
			<textarea name="ecDetail" id="ecDetail" rows="4" class="form-control"></textarea>
		</div>
		<div class="bg-gray py-2 px-3 mt-4">
			<label for="ecPrice">상품가격&nbsp;</label>
			<input type="text" id="ecPrice" name="ecPrice" required="required" placeholder="">
		<h2 class="mb-0">
		</h2>
		<h4 class="mt-0">
		<small>Ex Tax: $80.00 </small>
		</h4>
		</div>
		<hr />
		<div class="form-group">
			<label for="inputImgs">이미지 등록</label>
			<input type="file" name="uploadFile" id="inputImgs" placeholder="상품이미지" multiple="multiple">
		</div>
		<div class="mt-4">
		<div class="btn btn-primary btn-lg btn-flat">
			<i class="fas fa-cart-plus fa-lg mr-2"></i>Add to Cart
		</div>
		<div class="btn btn-default btn-lg btn-flat">
		<i class="fas fa-heart fa-lg mr-2"></i>
		Add to Wishlist
		</div>

	</div>
		<div class="mt-4 product-share">
			<a href="#" class="text-gray">
				<i class="fab fa-facebook-square fa-2x"></i>
			</a>
			<a href="#" class="text-gray">
				<i class="fab fa-twitter-square fa-2x"></i>
			</a>
			<a href="#" class="text-gray">
				<i class="fas fa-envelope-square fa-2x"></i>
			</a>
			<a href="#" class="text-gray">
				<i class="fas fa-rss-square fa-2x"></i>
			</a>
		</div>
	<sec:csrfInput/>
		</form:form>
	</div>
</div>
<div class="row mt-4">
	<nav class="w-100">
	<div class="nav nav-tabs" id="product-tab" role="tablist">
		<a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">Description</a>
		<a class="nav-item nav-link" id="product-comments-tab" data-toggle="tab" href="#product-comments" role="tab" aria-controls="product-comments" aria-selected="false">Comments</a>
		<a class="nav-item nav-link" id="product-rating-tab" data-toggle="tab" href="#product-rating" role="tab" aria-controls="product-rating" aria-selected="false">Rating</a>
	</div>
	</nav>
	<div class="tab-content p-3" id="nav-tabContent">
		<div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae condimentum erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed posuere, purus at efficitur hendrerit, augue elit lacinia arcu, a eleifend sem elit et nunc. Sed rutrum vestibulum est, sit amet cursus dolor fermentum vel. Suspendisse mi nibh, congue et ante et, commodo mattis lacus. Duis varius finibus purus sed venenatis. Vivamus varius metus quam, id dapibus velit mattis eu. Praesent et semper risus. Vestibulum erat erat, condimentum at elit at, bibendum placerat orci. Nullam gravida velit mauris, in pellentesque urna pellentesque viverra. Nullam non pellentesque justo, et ultricies neque. Praesent vel metus rutrum, tempus erat a, rutrum ante. Quisque interdum efficitur nunc vitae consectetur. Suspendisse venenatis, tortor non convallis interdum, urna mi molestie eros, vel tempor justo lacus ac justo. Fusce id enim a erat fringilla sollicitudin ultrices vel metus. </div>
		<div class="tab-pane fade" id="product-comments" role="tabpanel" aria-labelledby="product-comments-tab"> Vivamus rhoncus nisl sed venenatis luctus. Sed condimentum risus ut tortor feugiat laoreet. Suspendisse potenti. Donec et finibus sem, ut commodo lectus. Cras eget neque dignissim, placerat orci interdum, venenatis odio. Nulla turpis elit, consequat eu eros ac, consectetur fringilla urna. Duis gravida ex pulvinar mauris ornare, eget porttitor enim vulputate. Mauris hendrerit, massa nec aliquam cursus, ex elit euismod lorem, vehicula rhoncus nisl dui sit amet eros. Nulla turpis lorem, dignissim a sapien eget, ultrices venenatis dolor. Curabitur vel turpis at magna elementum hendrerit vel id dui. Curabitur a ex ullamcorper, ornare velit vel, tincidunt ipsum. </div>
		<div class="tab-pane fade" id="product-rating" role="tabpanel" aria-labelledby="product-rating-tab"> Cras ut ipsum ornare, aliquam ipsum non, posuere elit. In hac habitasse platea dictumst. Aenean elementum leo augue, id fermentum risus efficitur vel. Nulla iaculis malesuada scelerisque. Praesent vel ipsum felis. Ut molestie, purus aliquam placerat sollicitudin, mi ligula euismod neque, non bibendum nibh neque et erat. Etiam dignissim aliquam ligula, aliquet feugiat nibh rhoncus ut. Aliquam efficitur lacinia lacinia. Morbi ac molestie lectus, vitae hendrerit nisl. Nullam metus odio, malesuada in vehicula at, consectetur nec justo. Quisque suscipit odio velit, at accumsan urna vestibulum a. Proin dictum, urna ut varius consectetur, sapien justo porta lectus, at mollis nisi orci et nulla. Donec pellentesque tortor vel nisl commodo ullamcorper. Donec varius massa at semper posuere. Integer finibus orci vitae vehicula placerat. </div>
	</div>
	</div>
</div>

</div>
</section>
</div>