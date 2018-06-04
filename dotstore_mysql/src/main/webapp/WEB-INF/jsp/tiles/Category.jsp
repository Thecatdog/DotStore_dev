<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/category.css?ver=2"/>
<script>
</script>
<table>
	<thead>
		<tr>
			<td colspan="2">
				<c:if test="${category.categoryId eq 'DOGS'}">
					<a href="<c:url value="/shop/viewCategory.do?categoryId=DOGS"/>">
			            	<img class="image" border="0" src="/dotstore_mysql/images/dog-logo.png" />
			        </a>
				</c:if>
				<c:if test="${category.categoryId eq 'FISH'}">
					<a href="<c:url value="/shop/viewCategory.do?categoryId=FISH"/>">
		            	<img border="0" src="/dotstore_mysql/images/fish-logo.png" />
		            </a>
				</c:if>
				<c:if test="${category.categoryId eq 'BIRDS'}">
					<a href="<c:url value="/shop/viewCategory.do?categoryId=BIRDS"/>">
		            	<img border="0" src="/dotstore_mysql/images/parrot-logo.png" />
		            </a>
				</c:if>
				<c:if test="${category.categoryId eq 'CATS'}">
					<a href="<c:url value="/shop/viewCategory.do?categoryId=CATS"/>">
		            	<img border="0" src="/dotstore_mysql/images/cat-logo.png" />
		            </a>
				</c:if>
				<c:if test="${category.categoryId eq 'REPTILES'}">
					<a href="<c:url value="/shop/viewCategory.do?categoryId=REPTILES"/>">
		            	<img border="0" src="/dotstore_mysql/images/reptiles-logo.png" />
		            </a>
				</c:if>
				<hr/>
			</td>
		</tr>
	</thead>
	<tbody>
	    <c:forEach var="product" items="${productList.pageList}" varStatus="status">
	    	<tr>
	    		<c:if test="${status.count<3}">
	    		<td>
	    			<div class="container">
						<b><a href='<c:url value="/shop/${type}/viewProduct.do">
						<c:param name="productId" value="${product.productId}"/></c:url>'>
						<font color="black"><c:out value="${product.productId}" /></font>
						</a></b>
	          	    	<c:out value="${product.name}" />
	    			</div>
	    		</td>
	    		</c:if>
	    	</tr>
	    	<tr>
	    		<c:if test="${status.count>=3}">
	    		<td>
	    			<div class="container">
						<b><a href='<c:url value="/shop/viewProduct.do">
						<c:param name="productId" value="${product.productId}"/></c:url>'>
						<font color="black"><c:out value="${product.productId}" /></font>
						</a></b>
	          	    	<c:out value="${product.name}" />
	    			</div>
	    		</td>
	    		</c:if>
	    	</tr>
	    	
	    </c:forEach>
	</tbody>
</table>

<%-- <table id="main-menu">
  <tr>
    <td><a href='<c:url value="/shop/index.do"/>'><b>
       <font color="black" size="2">&lt;&lt; Main Menu</font></b></a>
    </td>
  </tr>
</table>

 --%><div align="center">
  <h2><c:out value="${category.name}" /></h2>
  <table class="n23">
    <tr bgcolor="#CCCCCC">
      <td><b>Product ID</b></td>
      <td><b>Name</b></td>
    </tr>
    <c:forEach var="product" items="${productList.pageList}">
      <tr bgcolor="#FFFF88">
        <td><b><a href='<c:url value="/shop/viewProduct.do">
          <c:param name="productId" value="${product.productId}"/></c:url>'>
            <font color="black"><c:out value="${product.productId}" /></font>
          </a></b></td>
        <td><c:out value="${product.name}" /> <c:out value="${status.count}" /></td>
      </tr>
    </c:forEach>
    <tr>
      <td>
        <c:if test="${!productList.firstPage}">
          <a href='<c:url value="/shop/${type}/viewCategory2.do">
            <c:param name="page" value="previous"/></c:url>'>
              <font color="white"><B>&lt;&lt; Prev</B></font></a>
        </c:if> 
        <c:if test="${!productList.lastPage}">
          <a href='<c:url value="/shop/${type}/viewCategory2.do">
            <c:param name="page" value="next"/></c:url>'>
              <font color="white"><B>Next &gt;&gt;</B></font></a>
        </c:if>
      </td>
    </tr>
  </table>
</div>
