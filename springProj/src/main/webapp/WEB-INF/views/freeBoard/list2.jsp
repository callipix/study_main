<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
/**
 * 페이징 정보 세팅
 */
 $(function () {
  
     $(".page-link").on("click" , function () {
		let testVal = $(this).val();
		console.log("테스트");
		console.log(testVal);
    });
     
})
</script>
<div class="card">
	<div class="card-header">
		<h3 class="card-title">DataTable with minimal features &amp;
			hover style</h3>
	</div>

	<div class="card-body">
		<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
			<div class="row">
				<div class="col-sm-12 col-md-6"></div>
				<div class="col-sm-12 col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-sm-12">
<%-- 				<p>${freeBoardVOList}</p> --%>
					<table id="example2"
						class="table table-bordered table-hover dataTable dtr-inline"
						aria-describedby="example2_info">
						<thead>
							<tr>
								<th class="sorting sorting_asc" tabindex="0"
									aria-controls="example2" rowspan="1" colspan="1"
									aria-sort="ascending"
									aria-label="Rendering engine: activate to sort column descending">순번</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Browser: activate to sort column ascending">제목</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Platform(s): activate to sort column ascending">작성자</th>
							</tr>
						</thead>
						<tbody>
						<!-- freeBoardVOList :  -->
								<c:forEach var="freeBoardVO" items="${freeBoardVOList}" varStatus="stat">
							<tr class="odd">
								<td class="dtr-control sorting_1" tabindex="0">${freeBoardVO.rnum}</td>
								<td>${freeBoardVO.freeTitle}</td>
								<td>${freeBoardVO.freeWriter}</td>
							</tr>
								</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12 col-md-5">
					<div class="dataTables_info" id="example2_info" role="status"
						aria-live="polite">Showing 1 to 10 of 57 entries</div>
				</div>
				<div class="col-sm-12 col-md-7">
					<div class="dataTables_paginate paging_simple_numbers"
						id="example2_paginate">
						<ul class="pagination">
							<li class="paginate_button page-item previous disabled"
								id="example2_previous"><a href="#" aria-controls="example2"
								data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
							<li class="paginate_button page-item active"><a href="#"
								aria-controls="example2" data-dt-idx="1" tabindex="0"
								class="page-link">1</a></li>
							<li class="paginate_button page-item "><a href="#"
								aria-controls="example2" data-dt-idx="2" tabindex="0"
								class="page-link">2</a></li>
							<li class="paginate_button page-item "><a href="#"
								aria-controls="example2" data-dt-idx="3" tabindex="0"
								class="page-link">3</a></li>
							<li class="paginate_button page-item "><a href="#"
								aria-controls="example2" data-dt-idx="4" tabindex="0"
								class="page-link">4</a></li>
							<li class="paginate_button page-item "><a href="#"
								aria-controls="example2" data-dt-idx="5" tabindex="0"
								class="page-link">5</a></li>
							<li class="paginate_button page-item "><a href="#"
								aria-controls="example2" data-dt-idx="6" tabindex="0"
								class="page-link">6</a></li>
							<li class="paginate_button page-item next" id="example2_next"><a
								href="#" aria-controls="example2" data-dt-idx="7" tabindex="0"
								class="page-link">Next</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>