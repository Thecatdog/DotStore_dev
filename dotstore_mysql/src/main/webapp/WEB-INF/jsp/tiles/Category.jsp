<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/category.css?ver=10"/>
<script>
</script>
<div class="container body-container">
	<table>
		<thead>
			<tr>
				<td class="cateheader" colspan="4">
					<c:if test="${category.categoryId eq 'DOGS'}">
						<a href="<c:url value="/shop/${type}/viewCategory.do?categoryId=DOGS"/>">
				            	<img class="image" border="0" src="/dotstore_mysql/images/dog-logo.png" />
				        </a>
					</c:if>
					<c:if test="${category.categoryId eq 'FISH'}">
						<a href="<c:url value="/shop/${type}/viewCategory.do?categoryId=FISH"/>">
			            	<img border="0" src="/dotstore_mysql/images/fish-logo.png" />
			            </a>
					</c:if>
					<c:if test="${category.categoryId eq 'BIRDS'}">
						<a href="<c:url value="/shop/${type}/viewCategory.do?categoryId=BIRDS"/>">
			            	<img border="0" src="/dotstore_mysql/images/parrot-logo.png" />
			            </a>
					</c:if>
					<c:if test="${category.categoryId eq 'CATS'}">
						<a href="<c:url value="/shop/${type}/viewCategory.do?categoryId=CATS"/>">
			            	<img border="0" src="/dotstore_mysql/images/cat-logo.png" />
			            </a>
					</c:if>
					<c:if test="${category.categoryId eq 'REPTILES'}">
						<a href="<c:url value="/shop/${type}/viewCategory.do?categoryId=REPTILES"/>">
			            	<img border="0" src="/dotstore_mysql/images/reptiles-logo.png" />
			            </a>
					</c:if>
					<hr/>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<p>당신이 원하는 
					   <c:choose>
					       <c:when test="${category.categoryId == 'DOGS'}">
					           강아지의
					       </c:when>
					       <c:when test="${category.categoryId == 'FISH'}">
					           물고기의
					       </c:when>
					       <c:when test="${category.categoryId == 'BIRDS'}">
					           새의
					       </c:when>
					       <c:when test="${category.categoryId == 'CATS'}">
					           고양이의
					       </c:when>
					       <c:when test="${category.categoryId == 'REPTILES'}">
					           양서류의
					       </c:when>
					   </c:choose>
					 종을 선택해주세요</p>
				</td>
			</tr>
		</thead>
		<tbody class="cateItems">
			<tr>
				<c:forEach var="product" items="${productList.pageList}" varStatus="status">
			    		<td class="cateItem-container">
			    			<div class="container">
								<b><a class="productId" href='<c:url value="/shop/${type}/viewProduct.do">
								<c:param name="productId" value="${product.productId}"/></c:url>'>
								<c:out value="${product.productId}" />
								</a></b>
			          	    	<c:out value="${product.name}" />
			    			</div>
			    		</td>
			    </c:forEach>
			</tr>
		</tbody>
		<tfoot>
			<tr>
		      <td class="pasination" colspan="4">
		        <c:if test="${!productList.firstPage}">
		          <a href='<c:url value="/shop/${type}/viewCategory2.do">
		            <c:param name="page" value="previous"/></c:url>'>
		              <font color="white"><B><i class="fas fa-arrow-left"></i></B></font></a>
		        </c:if> 
		        <c:if test="${!productList.lastPage}">
		          <a href='<c:url value="/shop/${type}/viewCategory2.do">
		            <c:param name="page" value="next"/></c:url>'>
		              <font color="white"><B><i class="fas fa-arrow-right"></i></B></font></a>
		        </c:if>
		      </td>
		    </tr>
		</tfoot>
	</table>

</div>