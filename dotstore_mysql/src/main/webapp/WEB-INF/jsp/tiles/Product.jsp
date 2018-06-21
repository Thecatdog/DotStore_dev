<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
	<p class="itemCount">${fn:length(itemList)}items</p>
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
							<small>${item.description}</small>
						</p>
					</td>
				</tr>
				<tr>
					<td style="float: right">${item.listprice}원&nbsp;&nbsp; <a
						class="cart-logo"
						href='<c:url value="/shop/addItemToCart.do">
            	<c:param name="workingItemId" value="${item.itemId}"/></c:url>'>
							<i class="fas fa-cart-plus"></i>
					</a></td>
				</tr>
			</table>
		</div>
	</c:forEach>
</div>
