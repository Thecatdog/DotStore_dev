<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/auctionForm.css?ver=5"/>

<div align="center" class="auctionForm-container container">
<br/>
<h3>${type} FORM</h3>
<hr/>
	<c:if test="${form_type eq 'p2p'}">
		<form method="POST" name="fm" action="<c:url value="/shop/editP2PForm.do"/>"> 
	</c:if>
	<c:if test="${form_type eq 'c2p'}">
		<form method="POST" name="fm" action="<c:url value="/shop/editC2PForm.do"/>"> 
	</c:if>
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
					<td><label for="listprice">가격</label></td>
					<td><input type="number" name="listprice" class="form-control" value="${item.listprice}" /></td>
				</tr>
				<tr>
					<td><label for="supplier_cate">공급자(회사/회원 아이디)</label></td>
					<td>
						<c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/dotstore_mysql/shop/p2pForm.do'}">
							<input type="radio" name="supplier_cate" value="member" checked="checked" onclick="return false"/> 회원
		            		<input type="radio" name="supplier_cate" value="company" onclick="return false"/> 회사 
						</c:if>
						<c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/dotstore_mysql/shop/c2pForm.do'}">
							<input type="radio" name="supplier_cate" value="member" onclick="return false"/> 회원
		            		<input type="radio" name="supplier_cate" value="company" checked="checked" onclick="return false"/> 회사 
						</c:if>
					</td>
				</tr>
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
							<a href='<c:url value="/shop/categoryList.do"/>' class="btn btn-gradient">취소</a>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>