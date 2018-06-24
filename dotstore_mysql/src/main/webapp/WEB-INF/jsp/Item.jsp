<%@ page pageEncoding="utf-8"%>
<%@ include file="IncludeTop.jsp"%>

<!-- 림아왈 : id값 건들지 말아줄것 -->
<table id="main-menu">
  <tr>
    <td>
      <a href='<c:url value="/shop/viewProduct.do">
        <c:param name="productId" value="${product.productId}"/></c:url>'>
        <b><font color="black" size="2">
          &lt;&lt; <c:out value="${product.name}" /></font></b></a>
    </td>
  </tr>
</table>
<p>
<div align="center">
  <table id="item">
    <tr>
      <td bgcolor="#FFFFFF">
        <c:out value="${product.description}" escapeXml="false" /></td>
    </tr>
    <tr>
      <td id="itemName" width="100%" bgcolor="#CCCCCC"><c:out value="${item.itemId}" /></td>
    </tr>
  	<tr>
  		<td>
  			<c:out value="${item.supplier}"/>
  		</td>
  	</tr>
    <tr>
      <td><b><font size="4"> 
        <c:out value="${item.attr1}" />
        <c:out value="${item.attr2}" /> 
        <c:out value="${item.attr3}" />
        <c:out value="${item.attr4}" /> 
        <c:out value="${item.attr5}" />
        <c:out value="${item.description}" />
        </font></b></td>
    </tr>
    <tr>
      <td id="cate">${product.name}</td>
    </tr>
    <tr>
      <td id="price"> ${item.listprice} 원</td>
    </tr>
    <tr>
      <td>
        <a class="cart-logo" href='<c:url value="/shop/addCart.do">
       			<c:param name="workingItemId" value="${item.itemId}"/>
       			<c:param name="price" value="${item.listprice}"/>
       			</c:url>'> 장바구니
		</a>
          <c:if test="${item.supplier eq userSession.account.firstName}">
          	${form_type }
          	<c:if test="${form_type eq 'c2p'}">
          		<a href='<c:url value="/shop/editC2PForm.do">
							<c:param name="itemId" value="${item.itemId}"/>
						</c:url>'
					class="btn btn-gradient">경매 수정
				</a>
          	</c:if>
          	<c:if test="${form_type eq 'p2p'}">
          		<a href='<c:url value="/shop/editP2PForm.do">
							<c:param name="itemId" value="${item.itemId}"/>
						</c:url>'
					class="btn btn-gradient">경매 수정
				</a>
          	</c:if>
			<a href='<c:url value="/shop/itemDelete.do">
	          <c:param name="itemId" value="${item.itemId}"/>
	          <c:param name="supplier_cate" value="${item.supplier_cate}"/>
	          </c:url>'>
	        삭제</a>
		  </c:if>
	  </td>
    </tr>
  </table>
	
</div>
<%@ include file="ReviewList.jsp"%>	
<%@ include file="IncludeBottom.jsp"%>

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