<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div align="center">
<h2>Shopping Cart</h2>
<table border="1">
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
				</c:url>' class="btn btn-gradient">삭제하기</a>
			</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="5">
			<h1>총 가격 : <fmt:formatNumber value="${totalPrice}" pattern="#,###" />원</h1>
			<p>나의 포인트 : ${myPoint}</p>
			
			<!-- 장바구니에 아이템이 있을경우에만 출력 -->
			<c:if test="${not empty cartList}"> 
				<form method="post" action='<c:url value="/shop/usePoint.do" />'>
					<p>포인트 사용하기 : <input id="point" type="number" min="1" max="${myPoint}" name="point" required />
					<button type="submit">사용</button>
				</form>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="5">
			<a href='<c:url value="/shop/checkCart.do">
			</c:url>' class="btn btn-gradient">주문하기</a>
		</td>
	</tr>
</table>
</div>