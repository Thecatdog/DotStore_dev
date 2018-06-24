<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/auctionForm.css?ver=5"/>

<div align="center" class="auctionForm-container container">
<br/>
<h3>AUCTION EDIT FORM</h3>
<hr/>
	<form method="POST" action="<c:url value="/shop/editAuction.do"/>"> 
		<table>
			<thead>
				<tr>
					<td><label for="categoryId">CATEGORY</label></td>
					<td><input type="text" name="categoryId" class="form-control" value="${item.categoryId}" readonly /></td>
				</tr>
				<tr>
					<td><label for="productId">PRODUCT</label></td>
					<td><input type="text" name="productId" class="form-control" value="${item.productId}" readonly /></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><label for="itemId">상품 이름</label></td>
					<td><input type="text" name="itemId" class="form-control" value="${item.itemId}" readonly /></td>
				</tr>
				<tr>
					<td><label for="listprice">경매 가격</label></td>
					<td><input type="number" name="listprice" class="form-control" value="${item.listprice}" readonly /></td>
				</tr>
				<tr>
					<td><label for="unitcost">단일 비용</label></td>
					<td><input id="unitcost" type="number" name="unitcost" class="form-control" value="${item.unitcost}" /></td>
				</tr>
				<tr>
					<td><label for="companySupplier">공급자(회사/회원 아이디)</label></td>
					<td><input type="text" name="companySupplier" class="form-control" value="${item.companySupplier}" readonly /></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td><label for="status">STATUS</label></td> -->
<%-- 					<td><input type="text" name="status" class="form-control" value="${item.status}" /></td> --%>
<!-- 				</tr> -->
				<input type="hidden" name="status" value="${item.status}" />
				<tr>
					<td><label for="attr1">ATTR1</label></td>
					<td><input type="text" name="attr1" class="form-control" value="${item.attr1}" /></td>
				</tr>
				<tr>
					<td><label for="attr2">ATTR2</label></td>
					<td><input type="text" name="attr2" class="form-control" value="${item.attr2}" /></td>
				</tr>
				<tr>
					<td><label for="attr3">ATTR3</label></td>
					<td><input type="text" name="attr3" class="form-control" value="${item.attr3}" /></td>
				</tr>
				<tr>
					<td><label for="attr4">ATTR4</label></td>
					<td><input type="text" name="attr4" class="form-control" value="${item.attr4}" /></td>
				</tr>
				<tr>
					<td><label for="attr5">ATTR5</label></td>
					<td><input type="text" name="attr5" class="form-control" value="${item.attr5}" /></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td><label for="dueTime">마감 시간</label></td> -->
<%-- 					<td><input type="date" name="dueTime" value='<fmt:formatDate value="${item.dueTime}" pattern="yyyy-MM-dd"/>' required /></td> --%>
<!-- 				</tr> -->
				<tr>
					<td><label for="dueTime">마감일</label>
						<p>*해당 날짜의 24시까지 진행됩니다.*</p></td>
					<td><input type="text" id="datepicker" name="dueTime" value='<fmt:formatDate value="${item.dueTime}" pattern="yyyy-MM-dd"/>' class="form-control" required /></td>
				</tr>
				<tr>
					<td><label for="description">상품 설명</label></td>
					<td><textarea rows="" cols="" name="description" class="form-control" required >${item.description}</textarea></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<div class="btn-group" role="group" aria-label="Basic example">
							<button type="submit" class="btn btn-gradient">수정</button>
							<a href='<c:url value="/shop/auctionDetail.do">
										<c:param name="itemId" value="${item.itemId}" /></c:url>'
								class="btn btn-gradient">취소</a>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/Javascript">
// <script>
    $('#datepicker').datepicker({
        altField : '#dueTime',
        changeMonth: true,
        changeYear: true,
        dateFormat : 'yy-mm-dd',
        dayNamesMin : ['일','월','화','수','목','금','토'],
    	monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        minDate : 0
    });
</script>