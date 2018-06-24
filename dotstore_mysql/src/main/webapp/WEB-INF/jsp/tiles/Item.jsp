<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/item.css?ver=3" />

<!-- 림아왈 : id값 건들지 말아줄것 -->
	<table id="main-menu">
<!-- 	  <tr><td> -->
<%-- 	    <a href='<c:url value="/shop/viewProduct.do"> --%>
<%--         <c:param name="productId" value="${product.productId}"/></c:url>' style="text-decoration:none;"> --%>
<%-- 	      <b><font color="white" size="3"><i class="fas fa-arrow-circle-left"></i><c:out value="${product.name}" /></font></b></a> --%>
<!-- 	  </td></tr> -->
	</table>

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
					<td class="description-text">
						<c:out value="${item.attr1}" />
						<c:out value="${item.attr2}" /> 
						<c:out value="${item.attr3}" />
						<c:out value="${item.attr4}" /> 
						<c:out value="${item.attr5}" />
					</td>
				</tr>
				<tr>
					<td style="float: right"><fmt:formatNumber value="${item.listprice}"
            		pattern="#,###" />원
					</td>
				</tr>
				<tr>
					<td>
						<div class="btn-group d-flex" role="group" style="float:right">
							<a href='<c:url value="/shop/addCart.do">
					       		<c:param name="workingItemId" value="${item.itemId}"/>
						       	<c:param name="price" value="${item.listprice}"/>
						        </c:url>' class="btn btn-gradient" style="margin-right:-2px"> <i class="fas fa-cart-plus"></i>
							</a>
							<c:if test="${item.supplier eq userSession.account.username}">
				          	<c:if test="${form_type eq 'c2p'}">
				          		<a href='<c:url value="/shop/editC2PForm.do">
											<c:param name="itemId" value="${item.itemId}"/>
										</c:url>'
									class="btn btn-gradient" style="margin-right:-2px">수정
								</a>
				          	</c:if>
				          	<c:if test="${form_type eq 'p2p'}">
				          		<a href='<c:url value="/shop/editP2PForm.do">
											<c:param name="itemId" value="${item.itemId}"/>
										</c:url>'
									class="btn btn-gradient" style="margin-right:-2px">수정
								</a>
				          	</c:if>
							<a href='<c:url value="/shop/itemDelete.do">
					          <c:param name="itemId" value="${item.itemId}"/>
					          <c:param name="supplier_cate" value="${item.supplier_cate}"/>
					          </c:url>' class="btn btn-gradient" style="margin-right:-10px">
					        삭제</a>
						  </c:if>
						</div>
					</td>
				</tr>
			</table>
		</div>




<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	window.onload=function(){
	    // 페이지가 로딩된 후 실행
	    var message="${message}";
	    if(message=="중복된 상품입니다.")
		    alert(message);
	}

	$(document).ready(function(){
		/* localStorage */
		var out = localStorage.getItem('list');
		var list = JSON.parse(out);
		if ( list == null) list = [];
		
		var id = $('#itemName').html();
		var category = $('#cate').html();
		var price = $('#price').html();
		var str = id+'|'+category+'|'+price;
		
		if(id != null) {
	 		list.unshift(str);
			localStorage.setItem('list', JSON.stringify(list));
		}
	});
</script>