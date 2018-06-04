<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/categoryList.css?ver=14"/>
<div class="container cateList-container">
	<table>
	<thead>
		<tr>
			<td colspan="5">
				<div class="spanarea">
					<span class="info-message">당신이 원하는 동물의 종류를 선택하세요.</span>
					<hr class="cate-list-line"/>
				</div>
			</td>
		</tr>
	</thead>
		<tr>
			<td>
				<a href="<c:url value="/shop/${type}/viewCategory.do?categoryId=DOGS"/>">
	            	<img class="image" border="0" src="/dotstore_mysql/images/dog-logo.png" />
	            </a>
			</td>
			<td>
				<a href="<c:url value="/shop/${type}/viewCategory.do?categoryId=FISH"/>">
	            	<img border="0" src="/dotstore_mysql/images/fish-logo.png" />
	            </a>
			</td>
			<td>
				<a href="<c:url value="/shop/${type}/viewCategory.do?categoryId=BIRDS"/>">
	            	<img border="0" src="/dotstore_mysql/images/parrot-logo.png" />
	            </a>
			</td>
			<td>
				<a href="<c:url value="/shop/${type}/viewCategory.do?categoryId=CATS"/>">
	            	<img border="0" src="/dotstore_mysql/images/cat-logo.png" />
	            </a>
			</td>
			<td>
				<a href="<c:url value="/shop/${type}/viewCategory.do?categoryId=REPTILES"/>">
	            	<img border="0" src="/dotstore_mysql/images/reptiles-logo.png" />
	            </a>
			</td>
		</tr>
	</table>
	<c:if test="${!empty userSession.account}">
		<c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/dotstore_mysql/shop/auction/categoryList.do'}">
			<a href="<c:url value="/shop/auctionForm.do"/>" class="btn btn-gradient">경매상품등록</a>
		</c:if>
	</c:if>
		
</div>