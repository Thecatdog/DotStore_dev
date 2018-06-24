<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/cart.css?ver=9"/>

<div class="container checkout-container" align="center">
<h2><i class="fas fa-list-alt cart-icon"></i></h2>
<table class="table table-hover div-body">
	<tr>
		<td><b>Item ID</b></td>
		<td><b>Product ID</b></td>
		<td><b>Description</b></td>
		<td><b>Price</b></td>
		<td>&nbsp;</td>
	</tr>
	<c:forEach var="item" items="${cartList}">
		<tr>
			<td>${item.itemId}</td>
			<td>${item.productId}</td>
			<td>${item.description}</td>
			<td><fmt:formatNumber value="${item.listPrice}" pattern="#,###" />원</td>
			<td><a href='<c:url value="/shop/removeCart.do">
				<c:param name="itemId" value="${item.itemId}"/>
				</c:url>' class="btn btn-gradient"><i class="fas fa-trash-alt"></i></a>
			</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="5">
			<h1>총 가격 : <fmt:formatNumber value="${totalPrice}" pattern="#,###" />원</h1>
		</td>
	</tr>
	<tr>
		<td colspan="5">
			<a href='<c:url value="/shop/newOrder.do">
			</c:url>' class="btn btn-gradient">계속하기</a>
		</td>
	</tr>
</table>
</div>