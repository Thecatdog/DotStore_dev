<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link type="text/css" rel="stylesheet"
	href="/dotstore_mysql/style/product.css?ver=12" />

<div class="container body-container">
	<h4>
		<a class="back-link"
			href='<c:url value="/shop/${type}/viewCategory.do">
        <c:param name="categoryId" value="${product.categoryId}"/></c:url>'>
			<i class="fas fa-arrow-circle-left"></i>
		</a> ${product.name}
	</h4>
	<p class="itemCount">${fn:length(itemList)} items
	<br/>
	<br/>
		<c:if test="${fn:length(itemList) eq 0 }">
		아직 상품이 존재하지 않습니다.
		</c:if>
	</p>

	<c:forEach var="item" items="${itemList}">
		<div class="item-container">
			<table class="item-table">
				<tr>
					<td>
						<h5>
							<b><c:if test="${type eq 'auction'}">
								<a class="itemid-a" href='<c:url value="/shop/auctionDetail.do">
				    				<c:param name="itemId" value="${item.itemId}"/></c:url>'>
				    				<p>${item.itemId}</p>
				    			</a>
								</c:if> 
								<c:if test="${type ne 'auction'}">
									<a class="itemid-a" href='<c:url value="/shop/viewItem.do">
				            			<c:param name="itemId" value="${item.itemId}"/></c:url>'>
										<p>${item.itemId}</p>
									</a>
								</c:if>
							</b>
						</h5> 
						<p class="description-text">
							<c:if test="${type eq 'auction'}">
								<small>${item.description}</small>
							</c:if>
							<c:if test="${type ne 'auction'}">
								<small>${item.description}</small>
							</c:if>
						</p>
					</td>
				</tr>
				<tr>
					<td style="float: right"><fmt:formatNumber value="${item.listprice}"
            		pattern="#,###" />원&nbsp;&nbsp; 
<%--             		<c:if test="${type ne 'auction'}"> <!-- 장바구니 이동 --> --%>
<!-- 	            		<a class="cart-logo" -->
<%-- 							href='<c:url value="/shop/addCart.do"> --%>
<%-- 	            			<c:param name="workingItemId" value="${item.itemId}"/> --%>
<%-- 	            			<c:param name="price" value="${item.listprice}"/> --%>
<%-- 	            			<c:param name="productId" value="${product.productId}"/> --%>
<%-- 	            			</c:url>'> --%>
<!-- 								<i class="fas fa-cart-plus"></i> -->
<!-- 						</a> -->
<%-- 					</c:if> --%>
					<c:if test="${type eq 'auction'}">
						<c:if test="${item.finish eq 'open'}">
							<p>경매중</p>
						</c:if>
						<c:if test="${item.finish eq 'close'}">
							<p>마감됨</p>
						</c:if>
					</c:if>
					</td>
				</tr>
			</table>
		</div>
	</c:forEach>
</div>